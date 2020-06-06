using System;
using System.Collections.Generic;
using System.Text;

namespace Entidades
{
    public class LecturaEntity
    {
        public uint id_parametro { get; set; }
        public string fecha { get; set; }
        public string hora { get; set; }
        public string descripcion { get; set; }
        public string valor { get; set; }
        public string unidad { get; set; }
    }
}
