﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class Paciente
    {
        public int IdPaciente { get; set; }
        public String Nombres { get; set; }
        public String Apellidos { get; set; }
        public int Edad { get; set; }
        public char Sexo { get; set; }
        public String NroDocumento { get; set; }
        public String Direccion { get; set; }
        public String Telefono { get; set; }
        public bool Estado { get; set; }
        public String Imagen { get; set; }



        public Paciente() { }


        public Paciente(int _IdPaciente, String _Nombres, String _Apellidos, int _Edad, char _Sexo
            , String _NroDocumento, String _Direccion, String _Telefono, bool _Estado, String _Imagen)
        {

            this.IdPaciente = _IdPaciente;
            this.Nombres = _Nombres;
            this.Apellidos = _Apellidos;
            this.Edad = _Edad;
            this.Sexo = _Sexo;
            this.NroDocumento = _NroDocumento;
            this.Direccion = _Direccion;
            this.Telefono = _Telefono;
            this.Imagen = _Imagen;
        }

    }
}
