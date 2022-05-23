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
        private static MedicamentoDAO daoMedico = null;
        private MedicamentoDAO() { }
        public static MedicamentoDAO getInstance()
        {
            if (daoMedico == null)
            {
                daoMedico = new MedicamentoDAO();
            }
            return daoMedico;
        }
        #endregion

  
        public bool Actualizar(Medicamento objmedicamento)
        {
            bool ok = false;
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            try
            {
                conexion = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("spActualizarDatosMedicamento", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmIdMedicamento", objmedicamento.IdMedicamento);
                cmd.Parameters.AddWithValue("@prmIdMedicamento", objmedicamento.NombreMedicamento);
                cmd.Parameters.AddWithValue("@prmIdMedicamento", objmedicamento.Cantidad);
                cmd.Parameters.AddWithValue("@prmIdMedicamento", objmedicamento.Precio);


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

        public bool RegistrarMedicamento(Medicamento objmedi)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("spRegistrarMedicamento", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmNombreMedicamento ", objmedi.NombreMedicamento);
                cmd.Parameters.AddWithValue("@prmFechaVencimiento", objmedi.FechaVencimiento);
                cmd.Parameters.AddWithValue("@prmFechaEntrada", objmedi.FechaEntrada);
                cmd.Parameters.AddWithValue("@prmLaboratorio", objmedi.Laboratorio.IdLaboratorio);
                cmd.Parameters.AddWithValue("@prmCantidad", objmedi.Cantidad);
                cmd.Parameters.AddWithValue("@prmPrecio", objmedi.Precio);
                cmd.Parameters.AddWithValue("@prmEstado", objmedi.Estado);
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
                    // Crear objetos de tipo Medico
                    Medicamento obj = new Medicamento();
                    obj.IdMedicamento = Convert.ToInt32(dr["idMedicamento"].ToString());
                    obj.Laboratorio = new Laboratorio();
                    obj.Laboratorio.NombreLaboratorio = dr["nombreLaboratorio"].ToString();
                    obj.NombreMedicamento = dr["nombreMedicamento"].ToString();
                    obj.FechaVencimiento = Convert.ToDateTime(dr["fechaVencimiento"].ToString());
                    obj.FechaEntrada = Convert.ToDateTime(dr["fechaEnrada"].ToString());
                    obj.Cantidad = Convert.ToInt32(dr["Cantidad"].ToString());
                    obj.Precio = Convert.ToSingle(dr["Cantidad"].ToString());
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
