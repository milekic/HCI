using MySql.Data.MySqlClient;
using Mysqlx.Crud;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WpfMojaApp1.models;

namespace WpfMojaApp1.services
{
    internal class NarudzbaService
    {
        private static readonly string SELECT = "SELECT idNARUDZBA, Datum, DOBAVLJAC_nazivFirme, MENADZER_RADNIK_jmb FROM narudzba";
        private static readonly string INSERT = @"INSERT INTO narudzba 
            (Datum, DOBAVLJAC_nazivFirme, MENADZER_RADNIK_jmb) 
            VALUES (@Datum, @DobavljacNazivFirme, @MenadzerRadnikJmb)";

        //Lista narudzbi
        public static List<Narudzba> GetNarudzbe()
        {
            List<Narudzba> result = new List<Narudzba>();
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
                    result.Add(new Narudzba
                    {
                        IdNarudzba = reader.GetInt32(0),
                        Datum = reader.GetDateTime(1),
                        DobavljacNazivFirme = reader.GetString(2),
                        MenadzerRadnikJmb = reader.GetInt32(3)
                    });
                }
            }
            finally
            {
                MySqlUtil.CloseQuietly(reader, conn);
            }

            return result;
        }

        //Dodajvanje nove narudzbe
        public static void AddNarudzba(Narudzba narudzba)
        {
            MySqlConnection conn = null;
            MySqlCommand cmd = null;

            try
            {
                conn = MySqlUtil.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = INSERT;

                cmd.Parameters.AddWithValue("@Datum", narudzba.Datum);
                cmd.Parameters.AddWithValue("@DobavljacNazivFirme", narudzba.DobavljacNazivFirme);
                cmd.Parameters.AddWithValue("@MenadzerRadnikJmb", narudzba.MenadzerRadnikJmb);

                cmd.ExecuteNonQuery();
            }
            finally
            {
                MySqlUtil.CloseQuietly(conn);
            }
        }

    }
}
