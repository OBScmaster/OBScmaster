package web.scmaster.com.vo;

public class Bedtime {
	
	private int pt_no;
	private String today;
	private String time;
	private String deleteflag;
	
	public Bedtime() {}

	public Bedtime(int pt_no, String today, String time, String deleteflag) {
		super();
		this.pt_no = pt_no;
		this.today = today;
		this.time = time;
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

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getDeleteflag() {
		return deleteflag;
	}

	public void setDeleteflag(String deleteflag) {
		this.deleteflag = deleteflag;
	}

	@Override
	public String toString() {
		return "Bedtime [pt_no=" + pt_no + ", today=" + today + ", time=" + time + ", deleteflag=" + deleteflag + "]";
	}
	
	

}
