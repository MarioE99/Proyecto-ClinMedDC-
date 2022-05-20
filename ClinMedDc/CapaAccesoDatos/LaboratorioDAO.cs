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
    public class LaboratorioDAO
    {
        #region "PATRON SINGLETON"
        private static LaboratorioDAO daoEmpleado = null;
        private LaboratorioDAO() { }
        public static LaboratorioDAO getInstance()
        {
            if (daoEmpleado == null)
            {
                daoEmpleado = new LaboratorioDAO();
            }
            return daoEmpleado;
        }
        #endregion

        public bool RegistraLaboratorio(Laboratorio objLaboratorio)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("spRegistrarLaboratorio", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmNombreLaboratorio", objLaboratorio.NombreLaboratorio);
                cmd.Parameters.AddWithValue("@prmDescripcion", objLaboratorio.Descripcion);
                cmd.Parameters.AddWithValue("@prmEstado", objLaboratorio.Estado);
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

        public List<Laboratorio> ListarLaboratorio()
        {
            List<Laboratorio> Lista = new List<Laboratorio>();
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("spListarLaboratorio", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    // Crear objetos de tipo Laboratorio
                    Laboratorio objLaboratorio = new Laboratorio();
                    objLaboratorio.IdLaboratorio = Convert.ToInt32(dr["idLaboratorio"].ToString());
                    objLaboratorio.NombreLaboratorio = dr["nombreLaboratorio"].ToString();
                    objLaboratorio.Descripcion = dr["descripcion"].ToString();
                    objLaboratorio.Estado = true;

                    // añadir a la lista de objetos
                    Lista.Add(objLaboratorio);
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

        public bool Actualizar(Laboratorio objLaboratorio)
        {
            bool ok = false;
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            try
            {
                conexion = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("spActualizarDatosLaboratorio", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmIdLaboratorio", objLaboratorio.IdLaboratorio);
                cmd.Parameters.AddWithValue("@prmDescripcion", objLaboratorio.Descripcion);
                cmd.Parameters.AddWithValue("@prmNombreLaboratorio", objLaboratorio.NombreLaboratorio);

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

        public bool Eliminar(int id)
        {
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            bool ok = false;
            try
            {
                conexion = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("spEliminarLaboratorio", conexion);
                cmd.Parameters.AddWithValue("@prmIdLaboratorio", id);
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
