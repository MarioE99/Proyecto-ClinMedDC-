using CapaEntidades;
using CapaLogicaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PaginaWebClinina
{
    public partial class GestionarVencimiento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            
            }

        }

        [WebMethod]
        public static List<Medicamento> ListarMedicamentosVencimiento()
        {
            List<Medicamento> Lista = null;
            try
            {
                Lista = MedicamentoLN.getInstance().ListarMedicamentosVencimiento();
            }
            catch (Exception)
            {
                Lista = new List<Medicamento>();
            }
            return Lista;
            }
        }
    }

