package IOT;


import java.sql.*;
import IOT.dbDAO;
import IOT.ListDTO;

public class ListDAO {
	dbDAO Origin=new dbDAO();
	ResultSet listPool;
	int CurrentPage;
	int TotalPageIndex=0;
	int MinimumPageNumber=0;
	String SQL="select * from notice order by LetterList desc";

	
	public int getConnect(int MinimumPage,int PageNum){
		int TotalPool=0;
	
		try {
			Origin.getConnection();
			TotalPool=ListPrint();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	
		MinimumPageNumber=MinimumPage;
		CalcPage(MinimumPageNumber,TotalPool);
	
		if(PageNum==0)
			CurrentPage=1;
		else
			CurrentPage=PageNum;
	
	return TotalPageIndex;
	}
	
	private void CalcPage(int Temp1,int TotalPool) {
		TotalPageIndex=TotalPool/Temp1;
		TotalPageIndex++;
	}
	
	public int ModifyBeanPage(String modifyLocation) {
		int Index=0,ControlVarious=0;
		if(modifyLocation=="Previous")
			ControlVarious--;
		if(modifyLocation=="later")
			ControlVarious++;
		CurrentPage+=ControlVarious;
		Index=(CurrentPage-1)*MinimumPageNumber;
		try {
			listPool.absolute(Index);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return CurrentPage;
	}
	
	public void exitListDAO() {
		try {
			listPool.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Origin.ConnectionTerminated();
	}
	
	private int ListPrint() {
		int PoolLength=0;
		try {
			listPool=Origin.getQuery(SQL);
			PoolLength=SettingPool();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return PoolLength;
	}
	
	public void nextRow(ListDTO Datafield) {
		try {
			boolean D=listPool.next();
			
			if(D) {
			Datafield.setLetterNum(listPool.getString("LetterList"));
			Datafield.setLHead(listPool.getString("LHead"));
			Datafield.setLWritter(listPool.getString("lwritter"));
			Datafield.setLDate(listPool.getString("LWDate"));
			}else {
				Datafield.setLetterNum(" ");
				Datafield.setLHead(" ");
				Datafield.setLWritter(" ");
				Datafield.setLDate(" ");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int SettingPool() {
		int TotalLength=0;
		try {
			listPool.last();
			TotalLength=listPool.getRow();
			listPool.first();
			listPool.previous();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return TotalLength;	
	}
	
}
