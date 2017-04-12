package web.scmaster.com.vo;

public class Bedtime {
	
	private int bedtime_No;
	private int pt_no;
	private String today;
	private String timeToSleep;
	private String timeToGetup;
	private String report;
	private String deleteflag;
	
	public Bedtime() {}

	public Bedtime(int bedtime_No, int pt_no, String today, String timeToSleep, String timeToGetup, String report,
			String deleteflag) {
		this.bedtime_No = bedtime_No;
		this.pt_no = pt_no;
		this.today = today;
		this.timeToSleep = timeToSleep;
		this.timeToGetup = timeToGetup;
		this.report = report;
		this.deleteflag = deleteflag;
	}

	public int getBedtime_No() {
		return bedtime_No;
	}

	public void setBedtime_No(int bedtime_No) {
		this.bedtime_No = bedtime_No;
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

	public String getTimeToSleep() {
		return timeToSleep;
	}

	public void setTimeToSleep(String timeToSleep) {
		this.timeToSleep = timeToSleep;
	}

	public String getTimeToGetup() {
		return timeToGetup;
	}

	public void setTimeToGetup(String timeToGetup) {
		this.timeToGetup = timeToGetup;
	}

	public String getReport() {
		return report;
	}

	public void setReport(String report) {
		this.report = report;
	}

	public String getDeleteflag() {
		return deleteflag;
	}

	public void setDeleteflag(String deleteflag) {
		this.deleteflag = deleteflag;
	}

	@Override
	public String toString() {
		return "Bedtime [bedtime_No=" + bedtime_No + ", pt_no=" + pt_no + ", today=" + today + ", timeToSleep="
				+ timeToSleep + ", timeToGetup=" + timeToGetup + ", report=" + report + ", deleteflag=" + deleteflag
				+ "]";
	}

}
