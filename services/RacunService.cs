using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WpfMojaApp1.models;

namespace WpfMojaApp1.services
{
    internal class RacunService
    {
        private static readonly string SELECT = "SELECT idRacun, datum, PRODAVAC_RADNIK_jmb FROM racun";

        public static List<Racun> GetRacuni()
        {
            List<Racun> result = new List<Racun>();
            MySqlConnection conn = null;
            MySqlCommand cmd = null;
            MySqlDataReader reader = null;

            conn = MySqlUtil.GetConnection();
            cmd = conn.CreateCommand();
            cmd.CommandText = SELECT;
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                result.Add(new Racun
                {
                    IdRacun = reader.GetInt32(0),
                    Datum = reader.GetDateTime(1),
                    ProdavacJmb = reader.GetInt32(2)
                });
            }

            MySqlUtil.CloseQuietly(reader, conn);

            return result;
        }

    }
}
