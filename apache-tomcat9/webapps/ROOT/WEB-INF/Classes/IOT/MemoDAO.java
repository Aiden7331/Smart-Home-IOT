package IOT;

import java.sql.*;
import IOT.dbDAO;

public class MemoDAO{
	dbDAO Origin=new dbDAO();
	ResultSet MemoPool;
	
	public MemoDAO(){
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
	
	public void MemoUpdate(MemoDTO dto) {
		String SQL="insert into notice(LBody,Lwritter,LHead) values('"+dto.getLBody()+"','"+dto.getLWritter()+"','"+dto.getLHead()+"')";
		try {
			Origin.getQueryUpdate(SQL);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	/*RowCounter=MemoPool.getRow();
	MemoPool.isBeforeFirst();*/

	public void MemoExit() {
		Origin.ConnectionTerminated();
	}
	
}
