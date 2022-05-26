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
    public partial class GestionarStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            
            }
        }

        [WebMethod]
        public static List<Medicamento> ListarMedicamentosStock()
        {
            List<Medicamento> Lista = null;
            try
            {
                Lista = MedicamentoLN.getInstance().ListarMedicamentosStock();
            }
            catch (Exception)
            {
                Lista = new List<Medicamento>();
            }
            return Lista;
            }
        }
    }

