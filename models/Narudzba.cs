using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfMojaApp1.models
{
    internal class Narudzba
    {
        public Narudzba() { }
        public int IdNarudzba { get; set; }
        public DateTime Datum { get; set; }
        public string DobavljacNazivFirme { get; set; }
        public int MenadzerRadnikJmb { get; set; }
    }
}
