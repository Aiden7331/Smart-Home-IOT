package IOT;

public class ReplyDTO {
	String Writter=null;
	String Body=null;
	String Date=null;
	String LetterList=null;
	
	public String getLetterList() {
		return LetterList;
	}
	public void setLetterList(String letterList) {
		LetterList = letterList;
	}
	public String getWritter() {
		return Writter;
	}
	public void setWritter(String writter) {
		Writter = writter;
	}
	public String getBody() {
		return Body;
	}
	public void setBody(String body) {
		Body = body;
	}
	public String getDate() {
		return Date;
	}
	public void setDate(String date) {
		Date = date;
	}
}
