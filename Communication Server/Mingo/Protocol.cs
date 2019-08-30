using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.IO.Ports;
namespace Mingo
{
    /* Smart Home Protocol
     Receive Protocol
                   T-거실 온도
                   t-침실 온도
                   H-거실 습도
                   h-침실 습도
                   P-주차장 차량있음
                   U-주차장 차량없음
     Send Protocol
                   A-거실 에어컨 켜기
                   B-거실 에어컨 끄기
                   C-침실 에어컨 켜기
                   D-침실 에어컨 닫기

                   */
    class Protocol
    {
        private string LivingRoomTemp;
        private string LivingRoomHumi;
        private string BedRoomTemp;
        private string BedRoomHumi;
        private string Park;
        MySqlDataReader reader = null;
        string control_unit;
        char[] sendingP = new char[10];
        public Protocol()
        {
            LivingRoomTemp = null;
            LivingRoomHumi = null;
            BedRoomTemp = null;
            BedRoomHumi = null;
            Park = null;

            
            sendingP[0] = 'A';
            sendingP[1] = 'B';
            sendingP[2] = 'C';
            sendingP[3] = 'D';

            control_unit = null;
        }

        public bool ManualControl(UserWeb mysql,SerialPort Dongle)
        {
            reader=mysql.GetQuery("select * from manual");
            while (reader.Read())
            {
                control_unit = (string)reader[0];   
            }
            reader.Close();
            if (control_unit.Equals(" "))
            {
                reader.Close();
                return false;
            }
            if (control_unit.Equals("LmotorOn"))//on
                Dongle.Write("A");
            else if (control_unit.Equals("LmotorOff"))//off
                Dongle.Write("B");
            else if (control_unit.Equals("BmotorOn"))//on
                Dongle.Write("C");
            else if (control_unit.Equals("BmotorOff"))
                Dongle.Write("D");
            else if (control_unit.Equals("exWinOn"))//on
                Dongle.Write("E");
            else if (control_unit.Equals("exWinOff"))
                Dongle.Write("F");

            mysql.PutQuery("update manual set Mfield=' ' where list=1");
            return true;
        }

        public string OutOfClass(string D)
        {
            string tmp;
            if (D=="LTemp")
            {
                tmp = LivingRoomTemp;
                LivingRoomTemp = null;
                return tmp;
            }
            else if (D=="LHumi")
            {
                tmp = LivingRoomHumi;
                LivingRoomHumi = null;
                return tmp;
            }
            else if (D=="BTemp")
            {
                tmp = BedRoomTemp;
                BedRoomTemp = null;
                return tmp;
            }
            else if (D=="BHumi")
            {
                tmp = BedRoomHumi;
                BedRoomHumi = null;
                return tmp;
            }
            else if (D=="Parking")
            {
                tmp = Park;
                Park = null;
                return tmp;
            }
            return null;
        }

        public bool InsertProtocol_P(char D)
        {
            if (D == 'P')
            {
                Park = "Parking";
                return true;
            }
            else if (D == 'U')
            {
                Park = "Unparking";
                return true;
            }

            return false;
        }
        public bool InsertProtocol(char D, string Value)
        {
            if (D == 'T')
            {
                LivingRoomTemp = Value;
                return true;
            }
            else if (D == 'H') {
                LivingRoomHumi = Value;
                return true;
            }
            else if (D == 't') {
                BedRoomTemp = Value;
                return true;
            }
            else if (D == 'h') {
                BedRoomHumi = Value;
                return true;
            }
        
        return false;
        }
    }
}
