using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using WpfMojaApp1.models;
using WpfMojaApp1.services;

namespace WpfMojaApp1.viewModels
{
    internal class NarudzbaViewModel : INotifyPropertyChanged
    {
        public ObservableCollection<Narudzba> Narudzbe { get; set; }
        public ObservableCollection<string> Dobavljaci { get; set; }
        public string NovoDatum => DateTime.Now.ToString("yyyy-MM-dd");

        public NarudzbaViewModel()
        {
            var narudzbeIzBaze = NarudzbaService.GetNarudzbe();
            Narudzbe = new ObservableCollection<Narudzba>(narudzbeIzBaze);

            var dobavljaciIzBaze = DobavljacServis.GetNaziviFirmi();
            Dobavljaci = new ObservableCollection<string>(dobavljaciIzBaze);
        }

        private string _odabraniDobavljac;
        public string OdabraniDobavljac
        {
            get => _odabraniDobavljac;
            set
            {
                _odabraniDobavljac = value;
                OnPropertyChanged(nameof(OdabraniDobavljac));
            }
        }

        // Dodavanje nove narudžbe
        public void DodajNovuNarudzbu(string jmbString)
        {
            if (string.IsNullOrWhiteSpace(OdabraniDobavljac) || string.IsNullOrWhiteSpace(jmbString))
            {
                MessageBox.Show("Morate unijeti sve podatke!", "Greška", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            if (!int.TryParse(jmbString, out int jmb))
            {
                MessageBox.Show("JMB mora biti broj!", "Greška", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            // Provjera menadžera
            if (!MenadzerService.MenadzerPostoji(jmb))
            {
                MessageBox.Show("Menadžer sa unesenim JMB ne postoji!", "Greška", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            // Kreiranje nove narudžbe
            var novaNarudzba = new Narudzba
            {
                Datum = DateTime.Now,
                DobavljacNazivFirme = OdabraniDobavljac,
                MenadzerRadnikJmb = jmb
            };

            // Dodavanje u bazu
            NarudzbaService.AddNarudzba(novaNarudzba);

            // Dodavanje u ObservableCollection da se prikaže odmah
            Narudzbe.Add(novaNarudzba);
             
            //ciscenje forme
            OdabraniDobavljac = null;
            OnPropertyChanged(nameof(OdabraniDobavljac));

            MessageBox.Show("Narudžba uspješno dodata!", "Info", MessageBoxButton.OK, MessageBoxImage.Information);
        }


        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
