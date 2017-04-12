package web.scmaster.com.vo;

public class DailyCleaning {
	
	private int dailycleaning_No;
	private int pt_no;
	private String today;
	private String cleaning;
	private String cleaningReport;
	private String inputdate;
	private String updatedate;
	private String deletedate;
	private String deleteflag;
	
	public DailyCleaning() {}

	public DailyCleaning(int dailycleaning_No, int pt_no, String today, String cleaning, String cleaningReport,
			String inputdate, String updatedate, String deletedate, String deleteflag) {
		this.dailycleaning_No = dailycleaning_No;
		this.pt_no = pt_no;
		this.today = today;
		this.cleaning = cleaning;
		this.cleaningReport = cleaningReport;
		this.inputdate = inputdate;
		this.updatedate = updatedate;
		this.deletedate = deletedate;
		this.deleteflag = deleteflag;
	}

	public int getDailycleaning_No() {
		return dailycleaning_No;
	}

	public void setDailycleaning_No(int dailycleaning_No) {
		this.dailycleaning_No = dailycleaning_No;
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

	public String getCleaning() {
		return cleaning;
	}

	public void setCleaning(String cleaning) {
		this.cleaning = cleaning;
	}

	public String getCleaningReport() {
		return cleaningReport;
	}

	public void setCleaningReport(String cleaningReport) {
		this.cleaningReport = cleaningReport;
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

	public String getDeleteflag() {
		return deleteflag;
	}

	public void setDeleteflag(String deleteflag) {
		this.deleteflag = deleteflag;
	}

	@Override
	public String toString() {
		return "DailyCleaning [dailycleaning_No=" + dailycleaning_No + ", pt_no=" + pt_no + ", today=" + today
				+ ", cleaning=" + cleaning + ", cleaningReport=" + cleaningReport + ", inputdate=" + inputdate
				+ ", updatedate=" + updatedate + ", deletedate=" + deletedate + ", deleteflag=" + deleteflag + "]";
	}

}