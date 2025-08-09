using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfMojaApp1.services
{
    internal class MenadzerService
    {
        private static readonly string SELECT_EXISTS = "SELECT COUNT(*) FROM menadzer WHERE jmb = @Jmb";

        public static bool MenadzerPostoji(int jmb)
        {
            MySqlConnection conn = null;
            MySqlCommand cmd = null;
            bool postoji = false;

            try
            {
                conn = MySqlUtil.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = SELECT_EXISTS;
                cmd.Parameters.AddWithValue("@Jmb", jmb);

                
                var count = Convert.ToInt32(cmd.ExecuteScalar());
                postoji = (count > 0);
            }
            finally
            {
                MySqlUtil.CloseQuietly(conn);
            }

            return postoji;
        }
    }
}
