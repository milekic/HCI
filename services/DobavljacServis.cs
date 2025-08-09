using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfMojaApp1.services
{
    internal class DobavljacServis
    {
        private static readonly string SELECT_NAZIV_FIRME = "SELECT nazivFirme FROM dobavljac";
        public static List<string> GetNaziviFirmi()
        {
            

            List<string> result = new List<string>();
            MySqlConnection conn = null;
            MySqlCommand cmd = null;
            MySqlDataReader reader = null;

            try
            {
                conn = MySqlUtil.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = SELECT_NAZIV_FIRME;
                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    // Uzimamo naziv firme (string)
                    result.Add(reader.GetString(0));
                }
            }
            finally
            {
                MySqlUtil.CloseQuietly(reader, conn);
            }

            return result;
        }
    }
}
