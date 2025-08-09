using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Globalization;
using System.Threading;
using System.Windows;

namespace WpfMojaApp1.helpers
{
    internal class ResourceHelper
    {

        public static void ChangeCulture(string cultureCode)
        {
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(cultureCode);
            Thread.CurrentThread.CurrentCulture = new CultureInfo(cultureCode);

            var oldWindow = Application.Current.MainWindow;

            var newWindow = new MainWindow();

           
            newWindow.Width = oldWindow.Width;
            newWindow.Height = oldWindow.Height;
            newWindow.Left = oldWindow.Left;
            newWindow.Top = oldWindow.Top;
            newWindow.WindowState = oldWindow.WindowState;

            Application.Current.MainWindow = newWindow;
            newWindow.Show();
            oldWindow.Close();
        }


    }
}
