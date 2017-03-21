package web.scmaster.com.vo;

public class SenserLog {
	
	private int pt_no;
	private String time;
	private String text;
	private String grade;
	
	public SenserLog() {}

	public SenserLog(int pt_no, String time, String text, String grade) {
		super();
		this.pt_no = pt_no;
		this.time = time;
		this.text = text;
		this.grade = grade;
	}

	public int getPt_no() {
		return pt_no;
	}

	public void setPt_no(int pt_no) {
		this.pt_no = pt_no;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "SenserLog [pt_no=" + pt_no + ", time=" + time + ", text=" + text + ", grade=" + grade + "]";
	}
	

}
