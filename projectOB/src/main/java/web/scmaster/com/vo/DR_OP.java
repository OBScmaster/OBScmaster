package web.scmaster.com.vo;

public class DR_OP {

	private int pt_no;
	private String today;
	private String reportTime;
	private String report;
	private String deleteflag;
	
	public DR_OP() {}

	public DR_OP(int pt_no, String today, String reportTime, String report, String deleteflag) {
		this.pt_no = pt_no;
		this.today = today;
		this.reportTime = reportTime;
		this.report = report;
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

	public String getReportTime() {
		return reportTime;
	}

	public void setReportTime(String reportTime) {
		this.reportTime = reportTime;
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
		return "DR_OP [pt_no=" + pt_no + ", today=" + today + ", reportTime=" + reportTime + ", report=" + report
				+ ", deleteflag=" + deleteflag + "]";
	}
}
