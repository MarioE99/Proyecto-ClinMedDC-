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
    public partial class GestionarFactura : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }

        }

        [WebMethod]
        public static List<Factura> ListarFactura()
        {
            List<Factura> Lista = null;
            try
            {
                Lista = FacturaLN.getInstance().ListarFactura();
            }
            catch (Exception)
            {
                Lista = new List<Factura>();
            }
            return Lista;
        }

        [WebMethod]
        public static bool Actualizar(String id, String nombreCliente, String nombreMedicamento, float total)
        {
            Factura objFactura = new Factura()
            {
                IdFactura = Convert.ToInt32(id),
                NombreCliente = nombreCliente,
                NombreMedicamento = nombreMedicamento,
                Total = total
            };

            bool ok = FacturaLN.getInstance().Actualizar(objFactura);
            return ok;
        }

        [WebMethod]
        public static bool EliminarDatosFactura(String id)
        {
            Int32 idFactura = Convert.ToInt32(id);

            bool ok = FacturaLN.getInstance().Eliminar(idFactura);

            return ok;

        }

        private Factura GetEntity()
        {
            Factura objFactura = new Factura();
            objFactura.IdFactura = 0;
            objFactura.NombreCliente = txtCliente.Text;
            objFactura.NombreMedicamento = txtMedicamento.Text;
            objFactura.Fecha = Convert.ToDateTime(txtFecha.Text);
            objFactura.Total = Convert.ToSingle(txtTotal.Text);
            objFactura.Estado = true;

            return objFactura;
        }


        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            // Registro del Laboratorio
            Factura objFactura = GetEntity();
            // enviar a la capa de logica de negocio
            bool response = FacturaLN.getInstance().RegistrarFactura(objFactura);
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
            txtCliente.Text = "";
            txtMedicamento.Text = "";

        }

        protected void btnDetalle_Click(object sender, EventArgs e)
        {
            CargarDetalle();
        }
    }
}