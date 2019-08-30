package IOT;


public class ListDTO {
	String LetterNum=null;
	String LHead=null;
	String LWritter=null;
	String LDate=null;
	
	public String getLetterNum() {
		return LetterNum;
	}
	public void setLetterNum(String letterNum) {
		if(letterNum.equals(null))
			letterNum=" ";
		LetterNum = letterNum;
	}
	public String getLHead() {
		return LHead;
	}
	public void setLHead(String lHead) {
		if(lHead.equals(null))
			lHead=" ";
		LHead = lHead;
	}
	public String getLWritter() {
		return LWritter;
	}
	public void setLWritter(String lWritter) {
		if(lWritter.equals(null))
			lWritter=" ";
		LWritter = lWritter;
	}
	public String getLDate() {
		return LDate;
	}
	public void setLDate(String lDate) {
		if(lDate.equals(null))
			lDate=" ";
		LDate = lDate;
	}
	
	
}
