using CapaAccesoDatos;
using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaLogicaNegocio
{
    public class LaboratorioLN
    {
        #region "PATRON SINGLETON"
        private static LaboratorioLN objEmpleado = null;
        private LaboratorioLN() { }
        public static LaboratorioLN getInstance()
        {
            if (objEmpleado == null)
            {
                objEmpleado = new LaboratorioLN();
            }
            return objEmpleado;
        }
        #endregion


        public bool RegistrarLaboratorio(Laboratorio objLaboratorio)
        {
            try
            {
                return LaboratorioDAO.getInstance().RegistraLaboratorio(objLaboratorio);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Laboratorio> ListarLaboratorio()
        {
            try
            {
                return LaboratorioDAO.getInstance().ListarLaboratorio();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool Actualizar(Laboratorio objLaboratorio)
        {
            try
            {
                return LaboratorioDAO.getInstance().Actualizar(objLaboratorio);
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
                return LaboratorioDAO.getInstance().Eliminar(id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
