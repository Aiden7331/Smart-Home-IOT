package IOT;

import java.sql.*;

public class dbDAO {
	private Connection BeanCon;
	private ResultSet ResultPointer;
	
	
	public void getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/UserWeb";
		BeanCon=DriverManager.getConnection(url,"root","IOT123");
	}
	
	public ResultSet getQuery(String sql) throws SQLException {
		PreparedStatement Pool=BeanCon.prepareStatement(sql);
		ResultPointer=Pool.executeQuery();
		return ResultPointer;
	}
	
	public void getQueryUpdate(String sql) throws SQLException {
		PreparedStatement Pool=BeanCon.prepareStatement(sql);
		Pool.executeUpdate();
	}
	
	public void ConnectionTerminated() {
		try {
			BeanCon.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			ResultPointer.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//letterP.next();
	//OLBody=letterP.getString("LBody");
	//OLHead=letterP.getString("LHead");
	//OLWritter=letterP.getString("LWritter");
	//OLDate=letterP.getString("lwdate");
	//letterP.close();
	//letterPool.close();
}
