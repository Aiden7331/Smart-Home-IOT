
package IOT;


import java.sql.*;
import IOT.dbDAO;
import IOT.ReplyDTO;

public class replyUpDAO {
	dbDAO Origin=new dbDAO();
	
	public void getConnectAndUpLoad(ReplyDTO Datafield){
		String UPSQL="insert into reply(letterlist,rebody,rewritter) values("+Datafield.getLetterList()+",'"+Datafield.getBody()+"','"+Datafield.getWritter()+"')";
			try {
			Origin.getConnection();
			Origin.getQueryUpdate(UPSQL);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
