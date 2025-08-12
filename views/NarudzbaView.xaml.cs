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
   
    public partial class NarudzbaView : UserControl
    {
        public NarudzbaView()
        {
            InitializeComponent();
            this.DataContext = new NarudzbaViewModel();

            UpdateLanguage();
        }

        private void DodajNarudzbu_Click(object sender, RoutedEventArgs e)
        {
            if (this.DataContext is NarudzbaViewModel vm)
            {
                vm.DodajNovuNarudzbu(txtMenadzerJmb.Text);
                txtMenadzerJmb.Clear();
                txtDatum.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }


        public void UpdateLanguage()
        {
            var cols = dataGridNarudzbe.Columns;

           
            cols[0].Header = WpfMojaApp1.resources.Strings.Datum;
            cols[1].Header = WpfMojaApp1.resources.Strings.Dobavljac;
            cols[2].Header = WpfMojaApp1.resources.Strings.Menadzer;

            lblDatum.Content = resources.Strings.Datum;
            lblDobavljac.Content = resources.Strings.Dobavljac;
            lblMenadzer.Content = resources.Strings.Menadzer;

            btnDodaj.Content = resources.Strings.Dodaj;
        }


    }
}
