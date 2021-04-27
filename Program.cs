using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SQLite;
using System.IO;

namespace RunSQLiteScript
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Input Database Location: ");
            string databaseLocation = Console.ReadLine();

            Console.Write("Input the SQL File Location: ");
            string sqlFileLocation = Console.ReadLine();

            string sqlQuery = File.ReadAllText(sqlFileLocation);

            Console.WriteLine("Executing SQL Script");
            string connectionString = @"URI=file:" + databaseLocation;
            SQLiteConnection connection = new SQLiteConnection(connectionString);

            connection.Open();

            var cmd = new SQLiteCommand(connection);
            cmd.CommandText = sqlQuery;

            cmd.ExecuteNonQuery();

            connection.Close();

            Console.WriteLine("Script successfully executed");
            Console.Read();
        }
    }
}
