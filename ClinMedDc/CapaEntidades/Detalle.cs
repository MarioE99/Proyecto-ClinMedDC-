using System;
using System.Data;
using System.Data.SqlClient;

namespace CapaEntidades
{
    public class Detalle : Factura
    {

        public int IdDetalle { get; set; }
        public Factura Factura { get; set; }
        public int IdMedicamento { get; set; }
        public float PrecioUnidad { get; set; }
        public int CantidadStock { get; set; }
        public new bool Estado { get; set; }

        public Detalle() : base()
        {
        }
        public Detalle(int _IdDetalle,int _IdMedicamento, Factura _Factura, float _PrecioUnidad, int _CantidadStock, bool Estado)
            : base(0, "","",DateTime.Now, 0, true)
        {
            this.IdDetalle = _IdDetalle;
            this.Factura = _Factura;
            this.IdMedicamento = _IdMedicamento;
            this.PrecioUnidad = _PrecioUnidad;
            this.CantidadStock = _CantidadStock;
            this.Estado = Estado;
        }

    }
}
