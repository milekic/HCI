using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Windows;
using WpfMojaApp1.models;
using WpfMojaApp1.services;
using System.Collections.Generic;
using WpfMojaApp1.views;
using MaterialDesignThemes.Wpf;
using static MaterialDesignThemes.Wpf.Theme.ToolBar;
using MaterialDesignColors;
using MaterialDesignColors.ColorManipulation;
using System.IO;
using System.Windows;

namespace WpfMojaApp1
{

    public partial class MainWindow : Window
    {
        
        //konstruktor
        public MainWindow()
        {
            InitializeComponent();

            //pocetni prozor
            MainContentControl.Content = new views.HomeView();

            //prijava
            var login = new LoginWindow();
            bool? rezultat = login.ShowDialog();

            if (rezultat == true)
            {
                // Uspješna prijava - dohvati tip korisnika
                var tip = login.TipKorisnika;

                if (tip == TipKorisnika.Menadzer)
                {
                    PrikaziSveOpcije();
                }
                else if (tip == TipKorisnika.Radnik)
                {
                    PrikaziSamoPregledRacuna();
                }
            }
            else
            {
                // Ako korisnik otkaže prijavu ili nije uspješan login, zatvori aplikaciju
                Application.Current.Shutdown();
            }
        }

      

        private void PrikaziAktivneProizvode(object sender, RoutedEventArgs e)
        {
            MainContentControl.Content = new AktivniProizvodView();
        }

        private void PrikaziRacune(object sender, RoutedEventArgs e)
        {
            MainContentControl.Content=new RacuniView();
        }

        private void PrikaziNarudzbe(object sender, RoutedEventArgs e)
        {
            MainContentControl.Content = new NarudzbaView();
        }

        private void ChangeToSerbian_Click(object sender, RoutedEventArgs e)
        {
            helpers.ResourceHelper.ChangeCulture("sr");
        }

        private void ChangeToEnglish_Click(object sender, RoutedEventArgs e)
        {
            helpers.ResourceHelper.ChangeCulture("en");
        }


        // Prikaži sva tri dugmeta za menadžera
        private void PrikaziSveOpcije()
        {
            buttonAktivniProizvodi.Visibility = Visibility.Visible;
            buttonPregledRacuna.Visibility = Visibility.Visible;
            buttonNarudzbe.Visibility = Visibility.Visible;
        }

        // Prikaži samo dugme "Pregled računa" za radnika, ostala sakrij
        private void PrikaziSamoPregledRacuna()
        {
            buttonAktivniProizvodi.Visibility = Visibility.Collapsed;
            buttonNarudzbe.Visibility = Visibility.Collapsed;
            buttonPregledRacuna.Visibility = Visibility.Visible;
        }

        private void OdjaviSe_Click(object sender, RoutedEventArgs e)
        {
            // Sakrij glavni prozor
            this.Hide();

            // Prikaži dijalog za prijavu ponovo
            var login = new LoginWindow();
            bool? rezultat = login.ShowDialog();

            if (rezultat == true)
            {
                // Prijava uspješna, prikaži dugmad prema tipu korisnika
                var tip = login.TipKorisnika;

                if (tip == TipKorisnika.Menadzer)
                {
                    PrikaziSveOpcije();
                }
                else if (tip == TipKorisnika.Radnik)
                {
                    PrikaziSamoPregledRacuna();
                }

                // Očisti sadržaj (po želji)
                MainContentControl.Content = null;

                // Prikaži glavni prozor opet
                this.Show();
            }
            else
            {
                // Ako korisnik otkaže prijavu - zatvori aplikaciju
                Application.Current.Shutdown();
            }
        }


        public void UpdateLanguage()
        {
            buttonAktivniProizvodi.Content = resources.Strings.AktivniProizvodi;
            buttonPregledRacuna.Content = resources.Strings.PregledRacuna;
            buttonNarudzbe.Content = resources.Strings.Narudzbe;

            if (MainContentControl.Content is AktivniProizvodView aktivniProizvodView)
            {
                aktivniProizvodView.UpdateLanguage();
            }

            if (MainContentControl.Content is NarudzbaView narudzbaView)
            {
                narudzbaView.UpdateLanguage();
            }

            if (MainContentControl.Content is RacuniView racuniView)
            {
                racuniView.UpdateLanguage();
            }


            // ...i ostala dugmad i kontrole koje koriste resurse za tekst
        }




    }
}
