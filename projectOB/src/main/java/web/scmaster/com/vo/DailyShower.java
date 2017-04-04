package web.scmaster.com.vo;

public class DailyShower {

	private int pt_no;
	private String today;
	private String cleaning;
	private String dailyReport;
	private String inputdate;
	private String updatedate;
	private String deletedate;
	private String deleteflag;
	
	public DailyShower() {
	}
	
	public DailyShower(int pt_no, String today, String cleaning, String dailyReport, String inputdate,
			String updatedate, String deletedate, String deleteflag) {
		this.pt_no = pt_no;
		this.today = today;
		this.cleaning = cleaning;
		this.dailyReport = dailyReport;
		this.inputdate = inputdate;
		this.updatedate = updatedate;
		this.deletedate = deletedate;
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

	public String getCleaning() {
		return cleaning;
	}

	public void setCleaning(String cleaning) {
		this.cleaning = cleaning;
	}

	public String getDailyReport() {
		return dailyReport;
	}

	public void setDailyReport(String dailyReport) {
		this.dailyReport = dailyReport;
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
		return "DailyShower [pt_no=" + pt_no + ", today=" + today + ", cleaning=" + cleaning + ", dailyReport="
				+ dailyReport + ", inputdate=" + inputdate + ", updatedate=" + updatedate + ", deletedate=" + deletedate
				+ ", deleteflag=" + deleteflag + "]";
	}
}
