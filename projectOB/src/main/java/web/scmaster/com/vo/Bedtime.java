package web.scmaster.com.vo;

public class Bedtime {
	
	private int bedtime_No;
	private int pt_no;
	private String today;
	private String timeToSleep;
	private String timeToGetup;
	private String report;
	private String inputdate;
	private String updatedate;
	private String deletedate;
	private String deleteflag;
	
	public Bedtime() {}



	public Bedtime(int bedtime_No, int pt_no, String today, String timeToSleep, String timeToGetup, String report,
			String inputdate, String updatedate, String deletedate, String deleteflag) {
		super();
		this.bedtime_No = bedtime_No;
		this.pt_no = pt_no;
		this.today = today;
		this.timeToSleep = timeToSleep;
		this.timeToGetup = timeToGetup;
		this.report = report;
		this.inputdate = inputdate;
		this.updatedate = updatedate;
		this.deletedate = deletedate;
		this.deleteflag = deleteflag;
	}



	public String getInputdate() {
		return inputdate;
	}



	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}



	public String getUpdatedate() {
		return updatedate;
	}



	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}



	public String getDeletedate() {
		return deletedate;
	}



	public void setDeletedate(String deletedate) {
		this.deletedate = deletedate;
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
				+ timeToSleep + ", timeToGetup=" + timeToGetup + ", report=" + report + ", inputdate=" + inputdate
				+ ", updatedate=" + updatedate + ", deletedate=" + deletedate + ", deleteflag=" + deleteflag + "]";
	}



}
