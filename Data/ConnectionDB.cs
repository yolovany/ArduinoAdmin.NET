using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace Data
{
    public class ConnectionDB
    {
        public ConnectionDB()
        {
            ConnectionString = ConfigurationManager.ConnectionStrings["MySQLConnection"].ConnectionString;
            MySqlConnection = new MySqlConnection(ConnectionString);
        }

        public string ConnectionString { get; set; } = string.Empty;
        public MySqlConnection MySqlConnection { get; set; } = null;
    }
}
