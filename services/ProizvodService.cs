using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WpfMojaApp1.models;

namespace WpfMojaApp1.services
{
    internal class ProizvodService
    {
        private static readonly string SELECT = "SELECT * FROM proizvod";

        public static List<Proizvod> GetProizvodi()
        {
            List<Proizvod> result = new List<Proizvod>();
            MySqlConnection conn = null;
            MySqlCommand cmd = null;
            MySqlDataReader reader = null;

            try
            {
                conn = MySqlUtil.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = SELECT;
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    result.Add(new Proizvod
                    {
                        naziv=reader.GetString(0),
                        sifra=reader.GetString(1)
                    });
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Greska prilikom dobavljana podataka iz tabele Proizvod", ex);
            }
            finally
            {
                MySqlUtil.CloseQuietly(reader, conn);
            }

            return result;
        }

        public static string GetSifraByNaziv(string nazivProizvoda)
        {
            string sifra = null;
            MySqlConnection conn = null;
            MySqlCommand cmd = null;
            MySqlDataReader reader = null;

            try
            {
                conn = MySqlUtil.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = "SELECT sifra FROM proizvod WHERE naziv = @naziv";
                cmd.Parameters.AddWithValue("@naziv", nazivProizvoda);
                reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    sifra = reader.GetString(0);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Greska prilikom dobavljanja sifre proizvoda po nazivu", ex);
            }
            finally
            {
                MySqlUtil.CloseQuietly(reader, conn);
            }

            return sifra;
        }


    }
}
