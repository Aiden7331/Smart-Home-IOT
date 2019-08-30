package IOT;

import java.sql.*;
import IOT.dbDAO;
import IOT.FileDTO;
public class ContextDAO {
		dbDAO Origin1=new dbDAO();
		dbDAO Origin2=new dbDAO();
		ResultSet ContextPool;
		ResultSet replyPool;
		String Headinfo=null;
		int TotalRow=0;
		
		public int getConnect(String LetterList){
			try {
				Origin1.getConnection();
				Origin2.getConnection();
				Headinfo=LetterList;
				String ContextSQL="select *from notice where letterlist='"+LetterList+"'";
				String ReplySQL="select * from reply where letterlist= '"+LetterList+"' order by replykey";
				ContextPool=Origin1.getQuery(ContextSQL);
				replyPool=Origin2.getQuery(ReplySQL);
			} catch (ClassNotFoundException e) {
				System.out.println("Class error");
				e.printStackTrace();
			} catch (SQLException e) {
				System.out.println("SQL error");
				e.printStackTrace();
			}
			TotalRow=CalcTotalRow();
			return TotalRow;
		}
		
		private int CalcTotalRow(){
			int returnvalue=0;
			try {
				replyPool.last();
				returnvalue=replyPool.getRow();
				replyPool.first();
				replyPool.previous();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return returnvalue;
		}
		
		public void CnextRow(FileDTO Datafield) {
			try {
				boolean D=ContextPool.next();
				if(D) {
					Datafield.setDataList(ContextPool.getString("LetterList"));
					Datafield.setBody(ContextPool.getString("lbody"));
					Datafield.setHead(ContextPool.getString("Lhead"));
					Datafield.setWritter(ContextPool.getString("lwritter"));
					Datafield.setDate(ContextPool.getString("lwdate"));
				}else {
					Datafield.setDataList(" ");
					Datafield.setBody(" ");
					Datafield.setHead(" ");
					Datafield.setWritter(" ");
					Datafield.setDate(" ");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		public boolean RnextRow(ReplyDTO Datafield) {
			boolean replyExist=true;
			try {
				boolean D=replyPool.next();
				
				if(D) {
					Datafield.setBody(replyPool.getString("rebody"));
					Datafield.setWritter(replyPool.getString("rewritter")+"ดิ");
					Datafield.setDate("|"+replyPool.getString("replydate"));
				}else {
					replyExist=false;
					Datafield.setBody(" ");
					Datafield.setWritter(" ");
					Datafield.setDate(" ");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return replyExist;
		}
		
		
		/*RowCounter=MemoPool.getRow();
		MemoPool.isBeforeFirst();*/
		public void ExitConnection() {
			try {
				replyPool.close();
				ContextPool.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Origin1.ConnectionTerminated();
			Origin2.ConnectionTerminated();
		}
		

}
