using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfMojaApp1.models
{
    internal class ProizvodOdDrveta
    {
        public ProizvodOdDrveta() { }

        public String Sifra {  get; set; }
        public String DrvoVrsta {  get; set; }
        public decimal cijena { get; set; }
        public bool aktivan { get; set; }
    }
}
