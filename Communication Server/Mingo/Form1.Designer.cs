namespace Mingo
{
    partial class Form1
    {
        /// <summary>
        /// 필수 디자이너 변수입니다.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 사용 중인 모든 리소스를 정리합니다.
        /// </summary>
        /// <param name="disposing">관리되는 리소스를 삭제해야 하면 true이고, 그렇지 않으면 false입니다.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form 디자이너에서 생성한 코드

        /// <summary>
        /// 디자이너 지원에 필요한 메서드입니다. 
        /// 이 메서드의 내용을 코드 편집기로 수정하지 마세요.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.DBLabel = new System.Windows.Forms.Label();
            this.Dongle = new System.IO.Ports.SerialPort(this.components);
            this.Message = new System.Windows.Forms.ListBox();
            this.DBThread = new System.Windows.Forms.Timer(this.components);
            this.BT_Connect = new System.Windows.Forms.Button();
            this.Signal = new System.Windows.Forms.Button();
            this.receiveSerial = new System.Windows.Forms.Timer(this.components);
            this.Port_COM = new System.Windows.Forms.ComboBox();
            this.MessageList = new System.Windows.Forms.Timer(this.components);
            this.DBConnection = new System.Windows.Forms.Button();
            this.CopiedDongle = new System.IO.Ports.SerialPort(this.components);
            this.SuspendLayout();
            // 
            // DBLabel
            // 
            this.DBLabel.AutoSize = true;
            this.DBLabel.Location = new System.Drawing.Point(313, 30);
            this.DBLabel.Name = "DBLabel";
            this.DBLabel.Size = new System.Drawing.Size(97, 15);
            this.DBLabel.TabIndex = 0;
            this.DBLabel.Text = "DB ON/OFF :";
            // 
            // Message
            // 
            this.Message.FormattingEnabled = true;
            this.Message.ItemHeight = 15;
            this.Message.Location = new System.Drawing.Point(12, 12);
            this.Message.Name = "Message";
            this.Message.Size = new System.Drawing.Size(295, 319);
            this.Message.TabIndex = 1;
            // 
            // DBThread
            // 
            this.DBThread.Enabled = true;
            this.DBThread.Interval = 1000;
            this.DBThread.Tick += new System.EventHandler(this.DBThread_Tick);
            // 
            // BT_Connect
            // 
            this.BT_Connect.Location = new System.Drawing.Point(316, 98);
            this.BT_Connect.Name = "BT_Connect";
            this.BT_Connect.Size = new System.Drawing.Size(121, 41);
            this.BT_Connect.TabIndex = 2;
            this.BT_Connect.Text = "블루투스         연결/취소";
            this.BT_Connect.UseVisualStyleBackColor = true;
            this.BT_Connect.Click += new System.EventHandler(this.BT_Connect_Click);
            // 
            // Signal
            // 
            this.Signal.Location = new System.Drawing.Point(313, 170);
            this.Signal.Name = "Signal";
            this.Signal.Size = new System.Drawing.Size(110, 36);
            this.Signal.TabIndex = 3;
            this.Signal.Text = "신호 전송";
            this.Signal.UseVisualStyleBackColor = true;
            this.Signal.Click += new System.EventHandler(this.Signal_Click);
            // 
            // receiveSerial
            // 
            this.receiveSerial.Enabled = true;
            this.receiveSerial.Tick += new System.EventHandler(this.receiveSerial_Tick);
            // 
            // Port_COM
            // 
            this.Port_COM.FormattingEnabled = true;
            this.Port_COM.Location = new System.Drawing.Point(316, 69);
            this.Port_COM.Name = "Port_COM";
            this.Port_COM.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.Port_COM.Size = new System.Drawing.Size(121, 23);
            this.Port_COM.TabIndex = 4;
            this.Port_COM.Text = "Serial Port";
            this.Port_COM.SelectedIndexChanged += new System.EventHandler(this.Port_COM_SelectedIndexChanged);
            // 
            // MessageList
            // 
            this.MessageList.Enabled = true;
            this.MessageList.Interval = 50;
            this.MessageList.Tick += new System.EventHandler(this.MessageList_Tick);
            // 
            // DBConnection
            // 
            this.DBConnection.Location = new System.Drawing.Point(313, 212);
            this.DBConnection.Name = "DBConnection";
            this.DBConnection.Size = new System.Drawing.Size(110, 36);
            this.DBConnection.TabIndex = 5;
            this.DBConnection.Text = "DB 수동 제어";
            this.DBConnection.UseVisualStyleBackColor = true;
            this.DBConnection.Click += new System.EventHandler(this.DBConnection_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(446, 338);
            this.Controls.Add(this.DBConnection);
            this.Controls.Add(this.Port_COM);
            this.Controls.Add(this.Signal);
            this.Controls.Add(this.BT_Connect);
            this.Controls.Add(this.Message);
            this.Controls.Add(this.DBLabel);
            this.Name = "Form1";
            this.Text = "Smart IOT";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form_closing);
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label DBLabel;
        private System.IO.Ports.SerialPort Dongle;
        private System.Windows.Forms.ListBox Message;
        private System.Windows.Forms.Timer DBThread;
        private System.Windows.Forms.Button BT_Connect;
        private System.Windows.Forms.Button Signal;
        private System.Windows.Forms.Timer receiveSerial;
        private System.Windows.Forms.ComboBox Port_COM;
        private System.Windows.Forms.Timer MessageList;
        private System.IO.Ports.SerialPort CopiedDongle;
        public System.Windows.Forms.Button DBConnection;
    }
}

