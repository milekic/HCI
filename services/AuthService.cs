using MySql.Data.MySqlClient;
using System;
using WpfMojaApp1.models;

namespace WpfMojaApp1.services
{
    internal class AuthService
    {
        public static TipKorisnika ProvjeriKorisnika(string ime, int jmb)
        {
            MySqlConnection conn = null;
            MySqlCommand cmd = null;
            try
            {
                conn = MySqlUtil.GetConnection();

                // Provjera menadžera
                cmd = conn.CreateCommand();
                cmd.CommandText = "SELECT COUNT(*) FROM menadzer WHERE ime=@ime AND jmb=@jmb";
                cmd.Parameters.AddWithValue("@ime", ime);
                cmd.Parameters.AddWithValue("@jmb", jmb);
                var count = Convert.ToInt32(cmd.ExecuteScalar());
                if (count > 0)
                    return TipKorisnika.Menadzer;

                // Provjera radnika
                cmd.CommandText = "SELECT COUNT(*) FROM radnik WHERE ime=@ime AND jmb=@jmb";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@ime", ime);
                cmd.Parameters.AddWithValue("@jmb", jmb);
                count = Convert.ToInt32(cmd.ExecuteScalar());
                if (count > 0)
                    return TipKorisnika.Radnik;

                return TipKorisnika.Nema;
            }
            catch (Exception ex)
            {
                throw new Exception("Greška pri provjeri korisnika", ex);
            }
            finally
            {
                MySqlUtil.CloseQuietly(null, conn);
            }
        }
    }
}
