using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfMojaApp1.services
{
    internal class ProizvodOdDrvetaService
    {
        public static void DodajProizvodOdDrveta(string sifra, string vrsta, decimal cijena)
        {
            string INSERT = "INSERT INTO proizvod_od_drveta (PROIZVOD_sifra, DRVO_Vrsta, Cijena) VALUES (@sifra, @vrsta, @cijena)";

            MySqlConnection conn = null;
            MySqlCommand cmd = null;

            try
            {
                conn = MySqlUtil.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = INSERT;

                cmd.Parameters.AddWithValue("@sifra", sifra);
                cmd.Parameters.AddWithValue("@vrsta", vrsta);
                cmd.Parameters.AddWithValue("@cijena", cijena);

                cmd.ExecuteNonQuery(); 
            }
           // catch (Exception ex)
           // {
               // throw new Exception("Greška prilikom unosa u tabelu proizvod_od_drveta", ex);
            //}
            finally
            {
                MySqlUtil.CloseQuietly(conn);
            }
        }

        //deaktivacija proizvoda
        public static void DeaktivirajProizvod(string sifra, string vrstaDrveta)
        {
            string UPDATE = "UPDATE proizvod_od_drveta SET aktivan = false WHERE PROIZVOD_sifra = @sifra AND DRVO_Vrsta = @vrsta";

            using (var conn = MySqlUtil.GetConnection())
            using (var cmd = conn.CreateCommand())
            {
                cmd.CommandText = UPDATE;
                cmd.Parameters.AddWithValue("@sifra", sifra);
                cmd.Parameters.AddWithValue("@vrsta", vrstaDrveta);

                cmd.ExecuteNonQuery();
            }
        }

        //izmjena cijene
        public static void IzmijeniCijenu(string sifra, string vrstaDrveta, decimal novaCijena)
        {
            string UPDATE = "UPDATE proizvod_od_drveta SET Cijena = @cijena WHERE PROIZVOD_sifra = @sifra AND DRVO_Vrsta = @vrsta";

            using (var conn = MySqlUtil.GetConnection())
            using (var cmd = conn.CreateCommand())
            {
                cmd.CommandText = UPDATE;
                cmd.Parameters.AddWithValue("@cijena", novaCijena);
                cmd.Parameters.AddWithValue("@sifra", sifra);
                cmd.Parameters.AddWithValue("@vrsta", vrstaDrveta);

                cmd.ExecuteNonQuery();
            }
        }



    }
}
