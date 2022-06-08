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
    public partial class GestionarDetalleFactura : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LlenarCliente();
            }

        }

        [WebMethod]
        public static List<Detalle> ListarDetalle()
        {
            List<Detalle> Lista = null;
            try
            {
                Lista = DetalleLN.getInstance().ListarDetalle();
            }
            catch (Exception)
            {
                Lista = new List<Detalle>();
            }
            return Lista;
        }

        [WebMethod]
        public static bool Actualizar(String id, float precio)
        {
            Detalle objDetalle = new Detalle()
            {
                IdFactura = Convert.ToInt32(id),
                PrecioUnidad = precio
            };

            bool ok = DetalleLN.getInstance().Actualizar(objDetalle);
            return ok;
        }

        [WebMethod]
        public static bool EliminarDatosDetalle(String id)
        {
            Int32 IdDetalle = Convert.ToInt32(id);

            bool ok = DetalleLN.getInstance().Eliminar(IdDetalle);

            return ok;

        }

        private Detalle GetEntity()
        {
            Detalle objDetalle = new Detalle();
            objDetalle.IdDetalle = 0;
            objDetalle.Factura = new Factura();
            objDetalle.Factura.IdFactura = (ddlCliente.SelectedIndex) + 1;
            objDetalle.PrecioUnidad = Convert.ToSingle(txtPrecioUnidad.Text);
            objDetalle.CantidadStock = Convert.ToInt32(txtCantidad.Text);
            objDetalle.Estado = true;
            return objDetalle;
        }


        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            // Registro del Laboratorio
            Detalle objDetalle = GetEntity();
            // enviar a la capa de logica de negocio
            bool response = DetalleLN.getInstance().RegistrarDetalle(objDetalle);
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
        private void LlenarCliente()
        {
            List<Factura> Lista = FacturaLN.getInstance().ListarFactura();

            ddlCliente.DataSource = Lista;
            ddlCliente.DataValueField = "idFactura";
            ddlCliente.DataTextField = "nombreCliente";
            ddlCliente.DataBind();
        }
        private void Limpiar()
        {
            txtPrecioUnidad.Text = "";
            txtCantidad.Text = "";

        }
    }
}