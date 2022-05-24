using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class Medicamento : Laboratorio
    {

        public int IdMedicamento { get; set; }
        public Laboratorio Laboratorio { get; set; }
        public String NombreMedicamento { get; set; }
        public int Cantidad { get; set; }
        public float Precio { get; set; }
        public new bool Estado { get; set; }

        public Medicamento(): base()
        {
        }
        public Medicamento(int IdMedicamento, Laboratorio _Laboratorio, String _NombreMedicamento,int _Cantidad,float _Precio, bool Estado)
            :base(0, "", "",true)
        {
            this.IdMedicamento = IdMedicamento;
            this.Laboratorio = _Laboratorio;
            this.NombreMedicamento= _NombreMedicamento;
            this.Cantidad = _Cantidad;
            this.Precio = _Precio;
            this.Estado = Estado;
        }

    }
}
