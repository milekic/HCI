using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;
using WpfMojaApp1.models;


namespace WpfMojaApp1.services
{
    internal class AktivniProizvodService
    {
        private static readonly string SELECT = "SELECT * FROM aktivni_proizvodi_od_drveta";

        public static List<AktivniProizvod> GetAktivniProizvodi()
        {
            List<AktivniProizvod> result = new List<AktivniProizvod>();
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
                    result.Add(new AktivniProizvod
                    {
                        SifraProizvoda=reader.GetString(0),
                        NazivProizvoda=reader.GetString (1),
                        VrstaDrveta=reader.GetString(2),
                        CijenaProizvoda=reader.GetDecimal(3),

                    });
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Greska prilikom dobavljana podataka iz tabele AktivniProizvodOdDrveta", ex);
            }
            finally
            {
                MySqlUtil.CloseQuietly(reader, conn);
            }

            return result;
        }

        
    }
}
