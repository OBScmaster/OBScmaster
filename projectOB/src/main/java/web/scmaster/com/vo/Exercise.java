package web.scmaster.com.vo;

public class Exercise {
	
	private int pt_no;
	private String today;
	private String text;
	private String deleteflag;
	
	public Exercise() {}
	
	
	
	public Exercise(int pt_no, String today, String text, String deleteflag) {
		super();
		this.pt_no = pt_no;
		this.today = today;
		this.text = text;
		this.deleteflag = deleteflag;
	}



	public int getPt_no() {
		return pt_no;
	}
	public void setPt_no(int pt_no) {
		this.pt_no = pt_no;
	}
	public String getToday() {
		return today;
	}
	public void setToday(String today) {
		this.today = today;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getDeleteflag() {
		return deleteflag;
	}
	public void setDeleteflag(String deleteflag) {
		this.deleteflag = deleteflag;
	}



	@Override
	public String toString() {
		return "Exercise [pt_no=" + pt_no + ", today=" + today + ", text=" + text + ", deleteflag=" + deleteflag + "]";
	}
	
	

}
