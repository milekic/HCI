using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WpfMojaApp1.models;

namespace WpfMojaApp1.services
{
    internal class DrvoService
    {
        private static readonly string SELECT = "SELECT * FROM drvo";

        public static List<Drvo> GetDrvo()
        {
            List<Drvo> result=new List<Drvo>();
            MySqlConnection conn = null;
            MySqlCommand cmd = null;
            MySqlDataReader reader = null;

            try
            {
                conn=MySqlUtil.GetConnection();
                cmd=conn.CreateCommand();
                cmd.CommandText=SELECT;
                reader= cmd.ExecuteReader();
                while(reader.Read())
                {
                    result.Add(new Drvo
                    {
                        vrsta=reader.GetString(0)
                    });
                }
            }catch (Exception ex)
            {
                throw new Exception("Greska prilikom dobavljana podataka iz tabele VrsteDrveta",ex);
            }
            finally
            {
                MySqlUtil.CloseQuietly(reader,conn);
            }

            return result;
        }  
    }
}
