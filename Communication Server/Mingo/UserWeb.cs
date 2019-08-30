using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace Mingo
{
    class UserWeb
    {
        MySqlConnection conn = null;
        MySqlCommand command = null;
        MySqlDataReader reader = null;
        interfaceEngine tmp1;

        public UserWeb(interfaceEngine ListOfChat)
        {
            String MysqlCon = "Server=localhost; Database=UserWeb; Uid=root; Pwd=IOT123;";
            conn = new MySqlConnection(MysqlCon);
            try
            {
                tmp1 = ListOfChat;
                ListOfChat.Enqueue("Connecting to Mysql..");
                conn.Open();
            } catch (Exception ex)
            {
                ListOfChat.Enqueue(ex.ToString());
            }
            ListOfChat.Enqueue("Done.");
        }
        public void PutQuery(String SQL)
        {
            command = new MySqlCommand(SQL,conn);
            try
            {
                command.ExecuteNonQuery();
            }catch(MySqlException e) {
                tmp1.Enqueue(e.Message);
            }
        }
        public MySqlDataReader GetQuery(String SQL)
        {
            command = new MySqlCommand(SQL, conn);
            try
            {
                reader = command.ExecuteReader();
            }
            catch (MySqlException e)
            {
                tmp1.Enqueue(e.Message);
            }
            return reader;
        }

        public void terminated()
        {
            conn.Close();
        }
    }
}
