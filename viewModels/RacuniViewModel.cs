using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Windows.Input;
using WpfMojaApp1.models;
using WpfMojaApp1.services;

namespace WpfMojaApp1.viewModels
{
    internal class RacuniViewModel : INotifyPropertyChanged
    {
        private const int ItemsPerPage = 15;

        private List<Racun> _sviRacuni;
        private int _trenutnaStranica;
        private string _filterJmb;
        private bool _filterAktivan;

        public ObservableCollection<Racun> Racuni { get; set; }
        public int UkupnoStranica => (int)Math.Ceiling((double)_sviRacuni.Count / ItemsPerPage);

        public int TrenutnaStranica => _trenutnaStranica + 1;

        public string FilterJmb
        {
            get => _filterJmb;
            set
            {
                _filterJmb = value;
                OnPropertyChanged(nameof(FilterJmb));
            }
        }

        public ICommand SledecaStranicaCommand { get; }
        public ICommand PrethodnaStranicaCommand { get; }
        public ICommand PrimijeniFilterCommand { get; }
        public ICommand OcistiFilterCommand { get; }

        public RacuniViewModel()
        {
            _sviRacuni = RacunService.GetRacuni();
            Racuni = new ObservableCollection<Racun>();

            SledecaStranicaCommand = new RelayCommand(_ => SledecaStranica(), _ => !_filterAktivan && _trenutnaStranica < UkupnoStranica - 1);
            PrethodnaStranicaCommand = new RelayCommand(_ => PrethodnaStranica(), _ => !_filterAktivan && _trenutnaStranica > 0);
            PrimijeniFilterCommand = new RelayCommand(_ => PrimijeniFilter());
            OcistiFilterCommand = new RelayCommand(_ => OcistiFilter());

            _trenutnaStranica = 0;
            _filterAktivan = false;
            UcitajStranicu();
        }

        private void UcitajStranicu()
        {
            Racuni.Clear();
            var racuniZaStranicu = _sviRacuni
                .Skip(_trenutnaStranica * ItemsPerPage)
                .Take(ItemsPerPage);

            foreach (var racun in racuniZaStranicu)
                Racuni.Add(racun);

            OnPropertyChanged(nameof(TrenutnaStranica));
        }

        private void SledecaStranica()
        {
            if (_trenutnaStranica < UkupnoStranica - 1)
            {
                _trenutnaStranica++;
                UcitajStranicu();
            }
        }

        private void PrethodnaStranica()
        {
            if (_trenutnaStranica > 0)
            {
                _trenutnaStranica--;
                UcitajStranicu();
            }
        }

        private void PrimijeniFilter()
        {
            if (int.TryParse(FilterJmb, out int jmb))
            {
                var filtrirani = _sviRacuni.Where(r => r.ProdavacJmb == jmb).ToList();
                Racuni.Clear();
                foreach (var racun in filtrirani)
                    Racuni.Add(racun);

                _filterAktivan = true;
            }
        }

        private void OcistiFilter()
        {
            _filterJmb = string.Empty;
            OnPropertyChanged(nameof(FilterJmb));

            _filterAktivan = false;
            _trenutnaStranica = 0;
            UcitajStranicu();
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged(string name) =>
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
    }

    public class RelayCommand : ICommand
    {
        private readonly Action<object> _execute;
        private readonly Func<object, bool> _canExecute;

        public RelayCommand(Action<object> execute, Func<object, bool> canExecute = null)
        {
            _execute = execute;
            _canExecute = canExecute;
        }

        public event EventHandler CanExecuteChanged
        {
            add => CommandManager.RequerySuggested += value;
            remove => CommandManager.RequerySuggested -= value;
        }

        public bool CanExecute(object parameter) => _canExecute == null || _canExecute(parameter);
        public void Execute(object parameter) => _execute(parameter);
    }
}
