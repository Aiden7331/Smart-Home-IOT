package IOT;

import java.sql.*;
import IOT.dbDAO;

public class NoticeDAO {
		dbDAO Origin=new dbDAO();
		ResultSet NoticePool=null;
		String OLBody = null;
		String OLHead = null;
		String OLWritter = null;
		String OLDate = null;
		
		String getOLBody () {
			if(this.OLBody==null)
				return " ";
			else
				return this.OLBody;
		}
		String getOLHead () {
			if(this.OLHead==null)
				return " ";
			else
				return this.OLHead;
			}
		String getOLWritter() {
			if(this.OLWritter==null)
				return " ";
			else
				return this.OLWritter;
		}
		String getOLDate() {
			if(this.OLDate==null)
				return " ";
			else
				return this.OLDate;
		}
		
		public NoticeDAO(){
			try {
				Origin.getConnection();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		public void ShowCustomerTheNotice(String LetterList) {
			String SQL="select *from notice where letterlist='"+LetterList+"';";
			try {
				NoticePool=Origin.getQuery(SQL);
				NoticePool.next();
				
				OLBody=NoticePool.getString("LBody");
				OLHead=NoticePool.getString("LHead");
				OLWritter=NoticePool.getString("LWritter");
				OLDate=NoticePool.getString("lwdate");
		
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		/*RowCounter=MemoPool.getRow();
		MemoPool.isBeforeFirst();*/
		public void NoticeExit() {
			Origin.ConnectionTerminated();
		}
		

}
