using System;
using System.Data.SqlClient;

namespace DataAccess
{
    public class Connection
    {
        #region "Singleton Pattern"
        private static Connection connection = null;
        private Connection() { }
        public static Connection getInstance()
        {
            if(connection == null)
            {
                connection = new Connection();
            }
            return connection;
        }
        #endregion

        public SqlConnection DBConnect()
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = "Data Source=PERSONAL-PC\\SQLEXPRESS;Initial Catalog=DBTEST;Integrated Security=True;";
            return connection;
        }
    }
}
