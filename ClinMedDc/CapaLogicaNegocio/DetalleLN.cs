using CapaAccesoDatos;
using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaLogicaNegocio
{
   public  class DetalleLN
    {

        #region "PATRON SINGLETON"
        private static DetalleLN objDetalle = null;
        private DetalleLN() { }
        public static DetalleLN getInstance()
        {
            if (objDetalle == null)
            {
                objDetalle = new DetalleLN();
            }
            return objDetalle;
        }
        #endregion


        public List<Detalle> ListarDetalle()
        {
            try
            {
                return DetalleDAO.getInstance().ListarDetalle();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
     

        public bool RegistrarDetalle(Detalle obj)
        {
            try
            {
                return DetalleDAO.getInstance().RegistrarDetalle(obj);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool Actualizar(Detalle obj)
        {
            try
            {
                return DetalleDAO.getInstance().Actualizar(obj);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool Eliminar(int id)
        {
            try
            {
                return DetalleDAO.getInstance().Eliminar(id);
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}
