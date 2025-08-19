using System;
using System.Windows;
using WpfMojaApp1.models;
using WpfMojaApp1.services;  

namespace WpfMojaApp1
{
    public partial class LoginWindow : Window
    {
        private AuthService authService = new AuthService();

        
        public TipKorisnika TipKorisnika { get; private set; } = TipKorisnika.Nema;

        public LoginWindow()
        {
            InitializeComponent();
        }

        private void PrijaviSe_Click(object sender, RoutedEventArgs e)
        {
            string ime = txtIme.Text.Trim();

            if (!int.TryParse(txtJmb.Text.Trim(), out int jmb))
            {
                MessageBox.Show("JMB mora biti broj!", "Greška", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            TipKorisnika tip = AuthService.ProvjeriKorisnika(ime, jmb);

            if (tip == TipKorisnika.Nema)
            {
                MessageBox.Show("Neispravan korisnik!", "Greška", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            TipKorisnika = tip;

            
            this.DialogResult = true;
            this.Close();
        }
    }
}
