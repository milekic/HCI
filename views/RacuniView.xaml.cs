using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using WpfMojaApp1.viewModels;

namespace WpfMojaApp1.views
{
  
    public partial class RacuniView : UserControl
    {
        public RacuniView()
        {
            InitializeComponent();
            this.DataContext = new RacuniViewModel();
            UpdateLanguage();
        }

        public void UpdateLanguage()
        {
            btnPretraziPoJmb.Content = WpfMojaApp1.resources.Strings.PretraziPoJmb;
            btnOcistiFilter.Content = WpfMojaApp1.resources.Strings.OcistiFilter;

            if (dataGridRacuni.Columns.Count >= 2)
            {
                dataGridRacuni.Columns[0].Header = WpfMojaApp1.resources.Strings.Datum;
                dataGridRacuni.Columns[1].Header = WpfMojaApp1.resources.Strings.Trgovac;
            }

            btnPrethodna.Content = WpfMojaApp1.resources.Strings.Prethodna;
            btnSledeca.Content = WpfMojaApp1.resources.Strings.Sledeca;

        }
    }
}
