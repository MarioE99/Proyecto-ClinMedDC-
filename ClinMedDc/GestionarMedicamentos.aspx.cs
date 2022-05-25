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
    public partial class GestionarMedicamento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LlenarLaboratorio();
            }

        }

        [WebMethod]
        public static List<Medicamento> ListarMedicamentos()
        {
            List<Medicamento> Lista = null;
            try
            {
                Lista = MedicamentoLN.getInstance().ListarMedicamentos();
            }
            catch (Exception)
            {
                Lista = new List<Medicamento>();
            }
            return Lista;
        }

        [WebMethod]
        public static bool ActualizarDatosMedicamento(String id, String nombreMedicamento, int Cantidad, float Precio)
        {
            Medicamento obj = new Medicamento()
            {
                IdMedicamento = Convert.ToInt32(id),
                NombreMedicamento = nombreMedicamento,
                Cantidad = Cantidad,
                Precio = Precio

            };

            bool ok = MedicamentoLN.getInstance().ActualizarDatosMedicamento(obj);

            return ok;
        }

        [WebMethod]
        public static bool EliminarDatosMedicamento(String id)
        {
            Int32 IdMedicamento= Convert.ToInt32(id);

            bool ok = MedicamentoLN.getInstance().Eliminar(IdMedicamento);

            return ok;

        }

        private Medicamento GetEntity()
        {

            Medicamento obj = new Medicamento();
            obj.IdMedicamento = 0;
            obj.Laboratorio = new Laboratorio();
            obj.Laboratorio.IdLaboratorio = (ddlLaboratorio.SelectedIndex) + 1;
            obj.NombreMedicamento = txtNombreMedicamento.Text;
            obj.FechaVencimiento = Convert.ToDateTime(txtVencimiento.Text);
            obj.FechaEntrada = Convert.ToDateTime(txtEntrada.Text);
            obj.Cantidad = Convert.ToInt32(txtCantidad.Text);
            obj.Precio = Convert.ToSingle(txtPrecio.Text);
            obj.Estado = true;

            return obj;
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            Medicamento obj = GetEntity();
            bool response = MedicamentoLN.getInstance().RegistrarMedicamento(obj);
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

        private void LlenarLaboratorio()
        {
            List<Laboratorio> Lista = LaboratorioLN.getInstance().ListarLaboratorio();

            ddlLaboratorio.DataSource = Lista;
            ddlLaboratorio.DataValueField = "idLaboratorio";
            ddlLaboratorio.DataTextField = "nombreLaboratorio";
            ddlLaboratorio.DataBind();
        }

        private void Limpiar()
        {
            txtNombreMedicamento.Text = "";
            txtVencimiento.Text = "";
            txtEntrada.Text = "";
            txtCantidad.Text = "";
            txtPrecio.Text = "";

            ddlLaboratorio.SelectedIndex = 0;
        }
    }
}