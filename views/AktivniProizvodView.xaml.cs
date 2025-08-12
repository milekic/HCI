using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
using WpfMojaApp1.models;
using WpfMojaApp1.services;
using WpfMojaApp1.viewModels;

namespace WpfMojaApp1.views
{
   
    public partial class AktivniProizvodView : UserControl
    {
        public AktivniProizvodView()
        {
            InitializeComponent();
            DataContext=new AktivniProizvodiViewModel();
        }

        private void DodajProizvod_Click(object sender, RoutedEventArgs e)
        {
            
            var izabraniProizvodForma = cmbVrstaProizvoda.SelectedItem as Proizvod;
            var izabranaVrstaDrvetaForma=cmbVrstaDrveta.SelectedItem as Drvo;           
            
            string cijenaText = txtCijena.Text;
            string nazivIzabranogProizvoda = izabraniProizvodForma?.naziv;
            string izabranaVrstaDrveta = izabranaVrstaDrvetaForma?.vrsta;
            string sifra = ProizvodService.GetSifraByNaziv(nazivIzabranogProizvoda);

            decimal? cijena = null;
            if (decimal.TryParse(cijenaText.Replace(',', '.'), out decimal parsedCijena))
            {
                cijena = parsedCijena;
            }

            // 4. Provjera i prikaz podataka
            if (izabraniProizvodForma != null && izabranaVrstaDrveta != null && cijena != null)
            {
                MessageBox.Show(
                    $"Dodaj proizvod:\nNaziv: {izabraniProizvodForma.naziv}\nVrsta drveta: {izabranaVrstaDrveta}\nCijena: {cijena} KM \nSifra: {sifra}",
                    "Informacija",
                    MessageBoxButton.OK,
                    MessageBoxImage.Information);

                try
                {
                    ProizvodOdDrvetaService.DodajProizvodOdDrveta(sifra, izabranaVrstaDrveta, cijena.Value);
                   //kad se dodan novi proizvod, azurira se tabela tako sto ucita opet sve iz baze.
                    var vm = DataContext as AktivniProizvodiViewModel;
                    vm?.UcitajProizvode();
                    

                    MessageBox.Show("Proizvod je uspješno dodat!", "Uspjeh", MessageBoxButton.OK, MessageBoxImage.Information);

                    // Resetuj formu
                    cmbVrstaProizvoda.SelectedItem = null;
                    cmbVrstaDrveta.SelectedItem = null;
                    txtCijena.Text = string.Empty;
                }
                catch (MySql.Data.MySqlClient.MySqlException ex)
                {
                    if (ex.Number == 1062) // 1062 = Duplicate entry
                    {
                        MessageBox.Show("Greška: Proizvod sa istom šifrom i vrstom drveta već postoji u bazi!", "Duplikat", MessageBoxButton.OK, MessageBoxImage.Warning);
                    }
                    else
                    {
                        MessageBox.Show($"Greška u bazi: {ex.Message}", "Greška", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Greška: {ex.Message}", "Greška", MessageBoxButton.OK, MessageBoxImage.Error);
                }

            }
            else
            {
                MessageBox.Show("Molimo popunite sva polja ispravno!", "Greška", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }


        //validacija unosa cijene
        private void txtCijena_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            // Dozvoljava samo brojeve i jedan decimalni separator (tačku ili zarez)
            e.Handled = !IsTextValidDecimal(((TextBox)sender).Text, e.Text);
        }

        private bool IsTextValidDecimal(string currentText, string newText)
        {
            string fullText = currentText + newText;
            fullText = fullText.Replace(',', '.');
            return decimal.TryParse(fullText, out _);
        }
        //validacija cijene
        private void txtCijena_Pasting(object sender, DataObjectPastingEventArgs e)
        {
            if (e.DataObject.GetDataPresent(typeof(string)))
            {
                string text = (string)e.DataObject.GetData(typeof(string));
                if (!decimal.TryParse(text.Replace(',', '.'), out _))
                {
                    e.CancelCommand();
                }
            }
            else
            {
                e.CancelCommand();
            }
        }

        //stranicenje
        private void Prethodna_Click(object sender, RoutedEventArgs e)
        {
            var vm = DataContext as AktivniProizvodiViewModel;
            vm?.PrethodnaStranica();
        }

        private void Sledeca_Click(object sender, RoutedEventArgs e)
        {
            var vm = DataContext as AktivniProizvodiViewModel;
            vm?.SledecaStranica();
        }

        //uklanjanje proizvoda
        private void UkloniProizvod_Click(object sender, RoutedEventArgs e)
        {
            var dugme = sender as Button;
            var proizvod = dugme?.Tag as AktivniProizvod;

            if (proizvod == null)
                return;

            var rezultat = MessageBox.Show($"Da li ste sigurni da želite ukloniti proizvod {proizvod.NazivProizvoda}?",
                                           "Potvrda",
                                           MessageBoxButton.YesNo,
                                           MessageBoxImage.Question);

            if (rezultat == MessageBoxResult.Yes)
            {
                try
                {
                    // Postavi aktivan = false
                    ProizvodOdDrvetaService.DeaktivirajProizvod(proizvod.SifraProizvoda, proizvod.VrstaDrveta);

                    // Osvježi prikaz
                    var vm = DataContext as AktivniProizvodiViewModel;
                    vm?.UcitajProizvode();

                    MessageBox.Show("Proizvod je uspješno uklonjen.", "Informacija", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Greška prilikom uklanjanja proizvoda: {ex.Message}", "Greška", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        //izmjena cijene
        private void IzmijeniCijenu_Click(object sender, RoutedEventArgs e)
        {
            var dugme = sender as Button;
            var proizvod = dugme?.Tag as AktivniProizvod;

            if (proizvod == null)
                return;

            // Prompt korisniku da unese novu cijenu
            string input = Microsoft.VisualBasic.Interaction.InputBox(
                $"Unesite novu cijenu za proizvod:\n{proizvod.NazivProizvoda} ({proizvod.VrstaDrveta})\nTrenutna cijena: {proizvod.CijenaProizvoda} KM",
                "Izmjena cijene",
                proizvod.CijenaProizvoda.ToString());

            // Ako je korisnik pritisnuo Cancel
            if (string.IsNullOrWhiteSpace(input))
                return;

            // Pokušaj parsiranja unosa
            if (!decimal.TryParse(input.Replace(',', '.'), out decimal novaCijena))
            {
                MessageBox.Show("Unesena cijena nije validan broj!", "Greška", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            var rezultat = MessageBox.Show(
                $"Da li ste sigurni da želite izmijeniti cijenu proizvoda {proizvod.NazivProizvoda} na {novaCijena} KM?",
                "Potvrda",
                MessageBoxButton.YesNo,
                MessageBoxImage.Question);

            if (rezultat == MessageBoxResult.Yes)
            {
                try
                {
                    ProizvodOdDrvetaService.IzmijeniCijenu(proizvod.SifraProizvoda, proizvod.VrstaDrveta, novaCijena);

                    // Osvježi prikaz
                    var vm = DataContext as AktivniProizvodiViewModel;
                    vm?.UcitajProizvode();

                    MessageBox.Show("Cijena je uspješno izmijenjena.", "Uspjeh", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Greška prilikom izmjene cijene: {ex.Message}", "Greška", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        public void UpdateLanguage()
        {
            colSifra.Header = resources.Strings.Sifra;
            colNaziv.Header = resources.Strings.Naziv;
            colVrstaDrveta.Header = resources.Strings.VrstaDrveta;
            colCijena.Header = resources.Strings.Cijena;

            var vm = DataContext as AktivniProizvodiViewModel;
            vm?.UpdateLanguage();

            btnPrethodna.Content = resources.Strings.Prethodna;
            btnSledeca.Content = resources.Strings.Sledeca;

            MaterialDesignThemes.Wpf.HintAssist.SetHint(
              cmbVrstaProizvoda,
              resources.Strings.VrstaProizvoda
            );

            MaterialDesignThemes.Wpf.HintAssist.SetHint(
                cmbVrstaDrveta,
                resources.Strings.VrstaDrveta
            );

            MaterialDesignThemes.Wpf.HintAssist.SetHint(
                txtCijena,
                resources.Strings.Cijena
            );

            btnDodajProizvod.Content = resources.Strings.DodajProizvod;


        }




    }
}
