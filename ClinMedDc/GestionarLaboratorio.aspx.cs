using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaEntidades;
using CapaLogicaNegocio;
using System.Web.Services;
using System.Web.Script.Serialization;


namespace PaginaWebClinina
{
    public partial class GestionarLaboratorio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }

        }

        [WebMethod]
        public static List<Laboratorio> ListarLaboratorio()
        {
            List<Laboratorio> Lista = null;
            try
            {
                Lista = LaboratorioLN.getInstance().ListarLaboratorio();
            }
            catch (Exception)
            {
                Lista = new List<Laboratorio>();
            }
            return Lista;
        }

        [WebMethod]
        public static bool ActualizarDatosLaboratorio(String id, String descripcion, string nombreLaboratorio)
        {
            Laboratorio objLaboratorio = new Laboratorio()
            {
                IdLaboratorio = Convert.ToInt32(id),
                Descripcion = descripcion,
                NombreLaboratorio = nombreLaboratorio
            };

            bool ok = LaboratorioLN.getInstance().Actualizar(objLaboratorio);
            return ok;
        }

        [WebMethod]
        public static bool EliminarDatosLaboratorio(String id)
        {
            Int32 idLaboratorio = Convert.ToInt32(id);

            bool ok = LaboratorioLN.getInstance().Eliminar(idLaboratorio);

            return ok;

        }

        private Laboratorio GetEntity()
        {
            Laboratorio objLaboratorio = new Laboratorio();
            objLaboratorio.IdLaboratorio = 0;
            objLaboratorio.NombreLaboratorio = txtNombreLab.Text;
            objLaboratorio.Descripcion = txtDescripcion.Text;
            objLaboratorio.Estado = true;

            return objLaboratorio;
        }


        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            // Registro del Laboratorio
            Laboratorio objLaboratorio = GetEntity();
            // enviar a la capa de logica de negocio
            bool response = LaboratorioLN.getInstance().RegistrarLaboratorio(objLaboratorio);
            if (response)
            {
                Response.Write("<script>alert('REGISTRO CORRECTO.')</script>");

            }
            else
            {
                Response.Write("<script>alert('REGISTRO INCORRECTO.')</script>");
            }

            Limpiar();

        }

        private void Limpiar()
        { 
            txtNombreLab.Text = "";
            txtDescripcion.Text = "";

        }
    }
}