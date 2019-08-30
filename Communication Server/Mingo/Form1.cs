using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO.Ports; //Serial Communication Liberary
using Microsoft.Win32; // it includes Port Numbers

namespace Mingo
{
    public partial class Form1 : Form
    {
        bool isOnPort = false;
        bool isOnDB = false;
        bool usingDB = false;
        string[] Proto;
        Protocol Sender;
        UserWeb Mysql=null;
        interfaceEngine MsgEngine = null;
        interfaceEngine InsEngine = null;

        bool turn =false;
        
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            List<string> listOfCOM=GetConnectComDevice();
            foreach(string COM in listOfCOM)
            Port_COM.Items.Add(COM);


            MsgEngine = new interfaceEngine(500);
            InsEngine = new interfaceEngine(500);
            Sender = new Protocol();
            Proto = new string[5];
            Proto[0] = "LTemp";
            Proto[1] = "LHumi";
            Proto[2] = "BTemp";
            Proto[3] = "BHumi";
            Proto[4] = "Parking";
            Mysql = new UserWeb(MsgEngine);
            isOnDB = true;
            DBLabel.Text = "DB ON";
        }

        private void DBThread_Tick(object sender, EventArgs e)
        {
            for (int i = 0; i < 5; i++) {
                string tmp = Sender.OutOfClass(Proto[i]);
                
                if (tmp != null && Mysql != null)
                {
                    Message.Items.Add("Sql Sending.. value is "+Proto[i]+tmp);
                    Mysql.PutQuery("update hardware set "+ Proto[i] + "='" + tmp + "' where list=1");
                }else if (Mysql == null&&isOnDB==true)
                {
                    Message.Items.Add("Mysql is closed. please turn it on!");
                    isOnDB = false;
                }
            }
            if (usingDB == false && isOnPort == true)
            {
                usingDB = true;
                if(usingDB = Sender.ManualControl(Mysql, Dongle))
                    MsgEngine.Enqueue("Sending Manual code is completed.");
                usingDB = false;
            }
        }

        /*Connection between Arduino and C#*/ 

        public void Bluetooth_Connect(String portname, int baudrate)
        {
            
            Dongle.BaudRate = baudrate;
            try
            {
                Dongle.PortName = portname;
                Dongle.Open();
                MsgEngine.Enqueue("Bluetooth Connection is successful.");
                isOnPort = true;
                CopiedDongle = Dongle;
                if (Mysql != null)
                    Mysql.PutQuery("update hardware set power ='on' where list=1");
                else
                    MsgEngine.Enqueue("DataBase Management System is down");
            }
            catch
            {
                MsgEngine.Enqueue("Bluetooth Connection is failed.");
                isOnPort = false;
            }
        }

        private void BT_Connect_Click(object sender, EventArgs e)
        {
            if (isOnPort == false)
                Bluetooth_Connect(Port_COM.Text, 9600);
            else
            {
                isOnPort = false;
                Dongle.Close();
                MsgEngine.Enqueue("Bluetooth Connection is closed.");
                if(isOnDB==true)
                    Mysql.PutQuery("update hardware set power ='off' where list=1");
            }
        }

        private void Signal_Click(object sender, EventArgs e) 
        {
            isOnPort = false;
            Dongle.Close();
        }

        private void receiveSerial_Tick(object sender, EventArgs e)
        {
            string ReceiveString = null;
            if (isOnPort && (ReceiveString = CopiedDongle.ReadExisting()) != null)
            {
                if(MsgProcess(ReceiveString))
                    Message.Items.Add("Arrival Protocol: "+ReceiveString);
            }
        }

        private bool MsgProcess(string ReceiveString)
        {
            char ProtocolC = '\n';
            char[] buffer=new char[10];
            String StrBuffer = null;
            char[] RecvMsg = ReceiveString.ToCharArray();
            if (RecvMsg.Length == 0)
                return false;
            for (int i=0,counter=0; i<RecvMsg.Length; i++)
            {
                if (ProtocolC != '\n'&& RecvMsg[i] != '|')
                    buffer[counter++] = RecvMsg[i];
                else if (ProtocolC != '\n' && RecvMsg[i] == '|')
                {
                    StrBuffer = new string(buffer);
                    if(Sender.InsertProtocol(ProtocolC, StrBuffer)) 
                        MsgEngine.Enqueue("The input value from bluetooth exists.");
                    InsEngine.Enqueue(StrBuffer);
                    ProtocolC = '\n';
                    buffer = new char[10];
                    counter = 0;
                }
                /* Smart Home Protocol
                   T-거실 온도
                   t-침실 온도
                   H-거실 습도
                   h-침실 습도
                   P-주차장 차량있음
                   U-주차장 차량없음
                   */
                if (RecvMsg[i] == 'T'|| RecvMsg[i] == 'H' || RecvMsg[i] == 't' || RecvMsg[i] == 'h')
                {
                    ProtocolC = RecvMsg[i];
                    
                }
                else if(RecvMsg[i] == 'P' || RecvMsg[i] == 'U')
                {
                    Sender.InsertProtocol_P(RecvMsg[i]);
                    buffer[counter] = RecvMsg[i];
                    InsEngine.Enqueue(new string(buffer));
                    buffer = new char[10];
                }
            }
            while(InsEngine.PickUpFeasibility()!=null)
                Message.Items.Add(InsEngine.Dequeue());
            return true;
        }

        private void Port_COM_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        public static List<string> GetConnectComDevice()
        {
            List<string> lstPorts = new List<string>();
            RegistryKey rkRoot = Registry.LocalMachine.OpenSubKey("HARDWARE");
            RegistryKey rkSubKey = rkRoot.OpenSubKey("DEVICEMAP\\SERIALCOMM");

            if (rkSubKey == null || rkSubKey.ValueCount == 0)
            {
                lstPorts.Add("none");
            }
            else
            {
                string[] tmpCom = rkSubKey.GetValueNames();
                for (int i = 0; i < rkSubKey.ValueCount; i++)
                {
                    lstPorts.Insert(0, (rkSubKey.GetValue(tmpCom[i]).ToString()));
                }
            }
            return lstPorts;
        }

        private void MessageList_Tick(object sender, EventArgs e)
        {
            if (MsgEngine.PickUpFeasibility() != null)
                Message.Items.Add(MsgEngine.Dequeue());

            if (isOnPort == true)
                Message.TopIndex = Message.Items.Count - 1;
        }

        private void DBConnection_Click(object sender, EventArgs e)
        {
            if (Mysql == null)
            {
                Mysql = new UserWeb(MsgEngine);
                isOnDB = true;
                DBLabel.Text = "DB ON";
            }
            else
            {
                if (isOnPort == true)
                {
                    MsgEngine.Enqueue("first, terminate SerialPort.");
                    return;
                }
                isOnDB = false;
                Mysql.terminated();
                Mysql = null;
                MsgEngine.Enqueue("Mysql is closed..");
                DBLabel.Text = "DB OFF";
            }


        }

        private void Form_closing(object sender, FormClosingEventArgs e)
        {
            if (isOnDB)
            {
                Mysql.PutQuery("update hardware set power ='off' where list=1");
                Mysql.terminated();
                isOnDB = false;
            }
            if(isOnPort)
            {
                Dongle.Close();
                isOnPort = false;
            }
        }
    }
}
