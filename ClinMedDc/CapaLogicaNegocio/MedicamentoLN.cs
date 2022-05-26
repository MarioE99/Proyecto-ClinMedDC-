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
   public  class MedicamentoLN
    {

        #region "PATRON SINGLETON"
        private static MedicamentoLN objMedicamento = null;
        private MedicamentoLN() { }
        public static MedicamentoLN getInstance()
        {
            if (objMedicamento == null)
            {
                objMedicamento = new MedicamentoLN();
            }
            return objMedicamento;
        }
        #endregion


        public List<Medicamento> ListarMedicamentos()
        {
            try
            {
                return MedicamentoDAO.getInstance().ListarMedicamentos();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<Medicamento> ListarMedicamentosStock()
        {
            try
            {
                return MedicamentoDAO.getInstance().ListarMedicamentosStock();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<Medicamento> ListarMedicamentosVencimiento()
        {
            try
            {
                return MedicamentoDAO.getInstance().ListarMedicamentosVencimiento();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool RegistrarMedicamento(Medicamento obj)
        {
            try
            {
                return MedicamentoDAO.getInstance().RegistrarMedicamento(obj);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool ActualizarDatosMedicamento(Medicamento obj)
        {
            try
            {
                return MedicamentoDAO.getInstance().ActualizarDatosMedicamento(obj);
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
                return MedicamentoDAO.getInstance().Eliminar(id);
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}
