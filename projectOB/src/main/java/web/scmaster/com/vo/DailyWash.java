package web.scmaster.com.vo;

public class DailyWash {
	
	private int dailywash_No;
	private int pt_no;
	private String today;
	private String wash;
	private String washReport;
	private String inputdate;
	private String updatedate;
	private String deletedate;
	private String deleteflag;
	
	public DailyWash() {
	}

	public DailyWash(int dailywash_No, int pt_no, String today, String wash, String washReport, String inputdate,
			String updatedate, String deletedate, String deleteflag) {
		this.dailywash_No = dailywash_No;
		this.pt_no = pt_no;
		this.today = today;
		this.wash = wash;
		this.washReport = washReport;
		this.inputdate = inputdate;
		this.updatedate = updatedate;
		this.deletedate = deletedate;
		this.deleteflag = deleteflag;
	}

	public int getDailywash_No() {
		return dailywash_No;
	}

	public void setDailywash_No(int dailywash_No) {
		this.dailywash_No = dailywash_No;
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

	public String getWash() {
		return wash;
	}

	public void setWash(String wash) {
		this.wash = wash;
	}

	public String getWashReport() {
		return washReport;
	}

	public void setWashReport(String washReport) {
		this.washReport = washReport;
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
		return "DailyWash [dailywash_No=" + dailywash_No + ", pt_no=" + pt_no + ", today=" + today + ", wash=" + wash
				+ ", washReport=" + washReport + ", inputdate=" + inputdate + ", updatedate=" + updatedate
				+ ", deletedate=" + deletedate + ", deleteflag=" + deleteflag + "]";
	}



}
