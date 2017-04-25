package web.scmaster.com.vo;

public class DR_OP {

	private int dr_op_No;
	private int pt_no;
	private String today;
	private String reportTime;
	private String report;
	private String inputdate;
	private String updatedate;
	private String deletedate;
	private String deleteflag;
	
	public DR_OP() {}

	

	public DR_OP(int dr_op_No, int pt_no, String today, String reportTime, String report, String inputdate,
			String updatedate, String deletedate, String deleteflag) {
		super();
		this.dr_op_No = dr_op_No;
		this.pt_no = pt_no;
		this.today = today;
		this.reportTime = reportTime;
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



	public int getDr_op_No() {
		return dr_op_No;
	}

	public void setDr_op_No(int dr_op_No) {
		this.dr_op_No = dr_op_No;
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
		return "DR_OP [dr_op_No=" + dr_op_No + ", pt_no=" + pt_no + ", today=" + today + ", reportTime=" + reportTime
				+ ", report=" + report + ", inputdate=" + inputdate + ", updatedate=" + updatedate + ", deletedate="
				+ deletedate + ", deleteflag=" + deleteflag + "]";
	}



}
