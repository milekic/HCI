using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.ObjectModel;
using System.ComponentModel;
using WpfMojaApp1.models;
using WpfMojaApp1.services;

namespace WpfMojaApp1.viewModels
{
    internal class AktivniProizvodiViewModel : INotifyPropertyChanged
    {
        private readonly AktivniProizvodService _service = new AktivniProizvodService();

        public event PropertyChangedEventHandler PropertyChanged;

        private List<AktivniProizvod> sviProizvodi; // cijela lista iz baze
        public ObservableCollection<AktivniProizvod> Proizvodi { get; set; } // trenutna stranica

        public ObservableCollection<Proizvod> ProizvodiOdDrveta { get; set; }
        public ObservableCollection<Drvo> VrsteDrveta { get; set; }

        private Proizvod _selectedProizvod;
        private Drvo _selectedDrvo;

        public string TextUkloni => resources.Strings.Ukloni;
        public string TextIzmijeniCijenu => resources.Strings.IzmijeniCijenu;


        // PAGINACIJA
        private int _pageSize = 10;
        private int _currentPage = 1;

        public int PageSize
        {
            get => _pageSize;
            set
            {
                _pageSize = value;
                OnPropertyChanged(nameof(PageSize));
                UcitajStranicu();
            }
        }

        public int CurrentPage
        {
            get => _currentPage;
            set
            {
                if (value >= 1 && value <= TotalPages)
                {
                    _currentPage = value;
                    OnPropertyChanged(nameof(CurrentPage));
                    UcitajStranicu();
                }
            }
        }

        public int TotalPages => (int)Math.Ceiling((double)sviProizvodi.Count / PageSize);

        public void SledecaStranica()
        {
            if (CurrentPage < TotalPages)
                CurrentPage++;
        }

        public void PrethodnaStranica()
        {
            if (CurrentPage > 1)
                CurrentPage--;
        }

        // konstruktor
        public AktivniProizvodiViewModel()
        {
            sviProizvodi = AktivniProizvodService.GetAktivniProizvodi();
            Proizvodi = new ObservableCollection<AktivniProizvod>();
            UcitajStranicu();

            List<Proizvod> prozivodiOdDrvetaIzBaze = ProizvodService.GetProizvodi();
            ProizvodiOdDrveta = new ObservableCollection<Proizvod>(prozivodiOdDrvetaIzBaze);

            List<Drvo> vrsteDrvetaIzBaze = DrvoService.GetDrvo();
            VrsteDrveta = new ObservableCollection<Drvo>(vrsteDrvetaIzBaze);
        }

        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public Proizvod SelectedProizvod
        {
            get => _selectedProizvod;
            set
            {
                _selectedProizvod = value;
                OnPropertyChanged(nameof(SelectedProizvod));
            }
        }

        public Drvo SelectedDrvo
        {
            get => _selectedDrvo;
            set
            {
                _selectedDrvo = value;
                OnPropertyChanged(nameof(SelectedDrvo));
            }
        }

        // koristi se za ponovno učitavanje kompletne baze 
        public void UcitajProizvode()
        {
            sviProizvodi = AktivniProizvodService.GetAktivniProizvodi();
            OnPropertyChanged(nameof(TotalPages));
            if (CurrentPage > TotalPages)
                CurrentPage = TotalPages;

            UcitajStranicu();
        }

        // popunjava ObservableCollection za prikaz
        private void UcitajStranicu()
        {
            Proizvodi.Clear();
            var proizvodiNaStranici = sviProizvodi
                .Skip((CurrentPage - 1) * PageSize)
                .Take(PageSize);

            foreach (var p in proizvodiNaStranici)
                Proizvodi.Add(p);
        }

        public void UpdateLanguage()
        {
            OnPropertyChanged(nameof(TextUkloni));
            OnPropertyChanged(nameof(TextIzmijeniCijenu));
        }
    }

}
