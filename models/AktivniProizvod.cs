using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace WpfMojaApp1.models
{
    internal class AktivniProizvod
    {
        public AktivniProizvod() { }
        public string SifraProizvoda { get; set; }
        public string NazivProizvoda { get; set; }
        public string VrstaDrveta { get; set; }
        public decimal CijenaProizvoda { get; set; }
        //public bool Aktivan { get; set; }
    }
}
