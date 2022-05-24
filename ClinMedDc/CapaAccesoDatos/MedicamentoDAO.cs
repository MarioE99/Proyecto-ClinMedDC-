using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaAccesoDatos
{
    public class MedicamentoDAO
    {

        #region "PATRON SINGLETON"
        private static MedicamentoDAO daoMedicamento = null;
        private MedicamentoDAO() { }
        public static MedicamentoDAO getInstance()
        {
            if (daoMedicamento == null)
            {
                daoMedicamento = new MedicamentoDAO();
            }
            return daoMedicamento;
        }
        #endregion

  
        public bool ActualizarDatosMedicamento(Medicamento obj)
        {
            bool ok = false;
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            try
            {
                conexion = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("spActualizarDatosMedicamento", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmIdMedicamento", obj.IdMedicamento);
                cmd.Parameters.AddWithValue("@prmNombreMedicamento", obj.NombreMedicamento);
                cmd.Parameters.AddWithValue("@prmCantidad", obj.Cantidad);
                cmd.Parameters.AddWithValue("@prmPrecio", obj.Precio);


                conexion.Open();

                cmd.ExecuteNonQuery();

                ok = true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
            return ok;
        }

        public bool RegistrarMedicamento(Medicamento obj)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("spRegistrarMedicamento", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmNombreMedicamento",obj.NombreMedicamento);
                cmd.Parameters.AddWithValue("@prmidLaboratorio",obj.Laboratorio.IdLaboratorio);
                cmd.Parameters.AddWithValue("@prmCantidad",obj.Cantidad);
                cmd.Parameters.AddWithValue("@prmPrecio",obj.Precio);
                cmd.Parameters.AddWithValue("@prmEstado",obj.Estado);
                con.Open();

                int filas = cmd.ExecuteNonQuery();
                if (filas > 0) response = true;

            }
            catch (Exception ex)
            {
                response = false;
                throw ex;
            }
            finally
            {
                con.Close();
            }
            return response;
        }

        public List<Medicamento> ListarMedicamentos()
        {
            List<Medicamento> Lista = new List<Medicamento>();
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("spListarMedicamentos", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    // Crear objetos de tipo Medicamento
                    Medicamento obj = new Medicamento();
                    obj.IdMedicamento = Convert.ToInt32(dr["idMedicamento"].ToString());
                    obj.Laboratorio = new Laboratorio();
                    obj.Laboratorio.NombreLaboratorio = dr["nombreLaboratorio"].ToString();
                    obj.NombreMedicamento = dr["nombreMedicamento"].ToString();
                    //obj.FechaVencimiento = Convert.ToString(dr["fechaVencimiento"].ToString());
                    //obj.FechaEntrada = Convert.ToString(dr["fechaEnrada"].ToString());
                    obj.Cantidad = Convert.ToInt32(dr["Cantidad"].ToString());
                    obj.Precio = Convert.ToSingle(dr["Precio"].ToString());
                    obj.Estado = true;
                    // añadir a la lista de objetos
                    Lista.Add(obj);
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
            return Lista;
        }

        public bool Eliminar(int id)
        {
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            bool ok = false;
            try
            {
                conexion = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("spEliminarMedicamento", conexion);
                cmd.Parameters.AddWithValue("@prmIdMedicamento", id);
                cmd.CommandType = CommandType.StoredProcedure;

                conexion.Open();

                cmd.ExecuteNonQuery();

                ok = true;

            }
            catch (Exception ex)
            {
                ok = false;
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
            return ok;
        }
    }
}
