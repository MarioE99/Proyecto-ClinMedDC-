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
    public class DetalleDAO
    {


        #region "PATRON SINGLETON"
        private static DetalleDAO daoDetalle = null;
        private DetalleDAO() { }
        public static DetalleDAO getInstance()
        {
            if (daoDetalle == null)
            {
                daoDetalle = new DetalleDAO();
            }
            return daoDetalle;
        }
        #endregion

        public bool RegistrarDetalle(Detalle objDetalle)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("spRegistrarDetalle", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmidDetalle", objDetalle.IdDetalle);
                cmd.Parameters.AddWithValue("@prmidFactura", objDetalle.IdFactura);
                cmd.Parameters.AddWithValue("@prmPrecioUnidad", objDetalle.PrecioUnidad);
                cmd.Parameters.AddWithValue("@prmCantidadStock", objDetalle.CantidadStock);
                cmd.Parameters.AddWithValue("@prmEstado", objDetalle.Estado);
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

        public List<Detalle> ListarDetalle()
        {
            List<Detalle> Lista = new List<Detalle>();
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;

            try
            {
                con = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("spListarDetalle", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    // Crear objetos de tipo Detalle
                    Detalle obj = new Detalle();
                    obj.IdDetalle = Convert.ToInt32(dr["idDetalle"].ToString());
                    obj.NombreCliente = dr["idFactura"].ToString();
                    obj.PrecioUnidad = Convert.ToSingle(dr["PrecioUnidad"].ToString());
                    obj.CantidadStock = Convert.ToInt32(dr["CantidadStock"].ToString());
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

        public bool Actualizar(Detalle objDetalle)
        {
            bool ok = false;
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            try
            {
                conexion = Conexion.getInstance().ConexionBD();
                cmd = new SqlCommand("spActualizarDatosDetalle", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmIdDetalle", objDetalle.IdDetalle);
                cmd.Parameters.AddWithValue("@prmPrecioUnidad", objDetalle.PrecioUnidad);
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
                cmd = new SqlCommand("spEliminarDetalle", conexion);
                cmd.Parameters.AddWithValue("@prmIdDetalle", id);
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
