using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class Laboratorio
    {
        public int IdLaboratorio { get; set; }
        public String NombreLaboratorio { get; set; }
        public String Descripcion { get; set; }
        public bool Estado { get; set; }



        public Laboratorio() { }


        public Laboratorio(int _IdLaboratorio, String _NombreLaboratorio, String _Descripcion, bool _Estado)
        {

            this.IdLaboratorio = _IdLaboratorio;
            this.NombreLaboratorio = _NombreLaboratorio;
            this.Descripcion = _Descripcion;
        }
    }
}
