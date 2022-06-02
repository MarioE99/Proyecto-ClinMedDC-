using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class DetalleFactura : Factura
    {

        public int IdDetalle { get; set; }
        public Factura Factura { get; set; }
        public Medicamento Medicamento { get; set; }
        public float PrecioUnidad { get; set; }

        public int Cantidad { get; set; }
        public new bool Estado { get; set; }

        public DetalleFactura (): base()
        {
        }
        public DetalleFactura(int _IdDetalle, Factura _Factura, Medicamento _Medicamento, float _PrecioUnidad, int _Cantidad, bool Estado)
            :base(0,"","",DateTime.Now,0,true)
        {
            this.IdDetalle = _IdDetalle;
            this.Factura = _Factura;
            this.Medicamento= _Medicamento;
            this.PrecioUnidad = _PrecioUnidad;
            this.Cantidad = _Cantidad;
            this.Estado = Estado;
        }

    }
}
