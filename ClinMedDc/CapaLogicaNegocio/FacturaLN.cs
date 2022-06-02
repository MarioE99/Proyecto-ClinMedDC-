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
   public  class FacturaLN
    {

        #region "PATRON SINGLETON"
        private static FacturaLN objFactura = null;
        private FacturaLN() { }
        public static FacturaLN getInstance()
        {
            if (objFactura == null)
            {
                objFactura = new FacturaLN();
            }
            return objFactura;
        }
        #endregion


        public List<Factura> ListarFactura()
        {
            try
            {
                return FacturaDAO.getInstance().ListarFactura();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool RegistrarFactura(Factura obj)
        {
            try
            {
                return FacturaDAO.getInstance().RegistrarFactura(obj);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool Actualizar(Factura obj)
        {
            try
            {
                return FacturaDAO.getInstance().Actualizar(obj);
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
                return FacturaDAO.getInstance().Eliminar(id);
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}
