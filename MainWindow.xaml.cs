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
            //LoadUserSettings();
        }

       // private readonly string settingsFile = "userSettings.txt";

        /*
        private void ApplyTheme(string themeFile)
        {
            
            var dictionaries = Application.Current.Resources.MergedDictionaries;
            dictionaries.Clear();

            
            var uri = new Uri($"/Themes/{themeFile}", UriKind.Relative);
            var resourceDict = new ResourceDictionary() { Source = uri };
            dictionaries.Add(resourceDict);

            
            SaveUserSettings(themeFile);
        }

        private void SaveUserSettings(string themeFile)
        {
            try
            {
                File.WriteAllText(settingsFile, themeFile);
            }
            catch
            {
                // TODO
            }
        }

        private void LoadUserSettings()
        {
            if (File.Exists(settingsFile))
            {
                var themeFile = File.ReadAllText(settingsFile);
                ApplyTheme(themeFile);
            }
            else
            {
                // po defaultu LightTheme
                ApplyTheme("LightTheme.xaml");
            }
        }

       */

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

        




    }
}
