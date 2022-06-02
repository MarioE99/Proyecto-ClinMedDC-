using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class Factura
    {
        public int IdFactura { get; set; }
        public String NombreCliente { get; set; }

        public String NombreMedicamento { get; set; }
        public DateTime Fecha { get; set; }
        public float Total { get; set; }

        public bool Estado { get; set; }



        public Factura() { }


        public Factura(int _IdFactura, String _NombreCliente, String _NombreMedicamento, DateTime _Fecha, float _total,bool _Estado)
        {

            this.IdFactura = _IdFactura;
            this.NombreCliente = _NombreCliente;
            this.NombreMedicamento = _NombreMedicamento;
            this.Fecha = _Fecha;
            this.Total = _total;
            this.Estado = _Estado;
        }
    }
}
