package web.scmaster.com.vo;

public class SensorLog {
	
	private int pt_no;
	private String timeonlog;
	private String text;
	private String grade;
	
	public SensorLog() {}

	public SensorLog(int pt_no, String timeonlog, String text, String grade) {
		super();
		this.pt_no = pt_no;
		this.timeonlog = timeonlog;
		this.text = text;
		this.grade = grade;
	}

	public int getPt_no() {
		return pt_no;
	}

	public void setPt_no(int pt_no) {
		this.pt_no = pt_no;
	}

	public String getTimeonlog() {
		return timeonlog;
	}

	public void setTimeonlog(String timeonlog) {
		this.timeonlog = timeonlog;
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
		return "SenserLog [pt_no=" + pt_no + ", time=" + timeonlog + ", text=" + text + ", grade=" + grade + "]";
	}
	

}
