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
    public class FacturaDAO
    {


        #region "PATRON SINGLETON"
        private static FacturaDAO daoFactura = null;
        private FacturaDAO() { }
        public static FacturaDAO getInstance()
        {
            if (daoFactura == null)
            {
                daoFactura = new FacturaDAO();
            }
            return daoFactura;
        }
        #endregion

        public bool RegistrarFactura(Factura obj)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("spRegistrarFactura", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmNombreCliente", obj.NombreCliente);
                cmd.Parameters.AddWithValue("@prmNombreMedicamento", obj.NombreMedicamento);
                cmd.Parameters.AddWithValue("@prmFecha", obj.Fecha);
                cmd.Parameters.AddWithValue("@prmTotal", obj.Total);
                cmd.Parameters.AddWithValue("@prmEstado", obj.Estado);
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

        public List<Factura> ListarFactura()
        {
            List<Factura> Lista = new List<Factura>();
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("spListarFactura", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    // Crear objetos de tipo Factura
                    Factura obj = new Factura();
                    obj.IdFactura = Convert.ToInt32(dr["idFactura"].ToString());
                    obj.NombreCliente = dr["nombreCliente"].ToString();
                    obj.NombreMedicamento = dr["nombreMedicamento"].ToString();
                    obj.Fecha = Convert.ToDateTime(dr["fecha"].ToString());
                    obj.Total = Convert.ToSingle(dr["total"].ToString());
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

        public bool Actualizar(Factura obj)
        {
            bool ok = false;
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            try
            {
                conexion = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("spActualizarDatosFactura", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmIdFactura", obj.IdFactura);
                cmd.Parameters.AddWithValue("@prmNombreCliente", obj.NombreCliente);
                cmd.Parameters.AddWithValue("@prmNombreMedicamento", obj.NombreCliente);
                cmd.Parameters.AddWithValue("@prmTotal", obj.Total);
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
                cmd = new SqlCommand("spEliminarFactura", conexion);
                cmd.Parameters.AddWithValue("@prmIdFactura", id);
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
