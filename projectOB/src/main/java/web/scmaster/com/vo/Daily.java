package web.scmaster.com.vo;

public class Daily {
	
	private int pt_no;
	private String today;
	private String cleaning;
	private String wash;
	private String shower;
	private String report;
	private String inputdate;
	private String updatedate;
	private String deletedate;
	private String deleteflag;
	
	public Daily() {}

	public Daily(int pt_no, String today, String cleaning, String wash, String shower, String report, String inputdate,
			String updatedate, String deletedate, String deleteflag) {
		super();
		this.pt_no = pt_no;
		this.today = today;
		this.cleaning = cleaning;
		this.wash = wash;
		this.shower = shower;
		this.report = report;
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

	public String getWash() {
		return wash;
	}

	public void setWash(String wash) {
		this.wash = wash;
	}

	public String getShower() {
		return shower;
	}

	public void setShower(String shower) {
		this.shower = shower;
	}

	public String getReport() {
		return report;
	}

	public void setReport(String report) {
		this.report = report;
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
		return "Daily [pt_no=" + pt_no + ", today=" + today + ", cleaning=" + cleaning + ", wash=" + wash + ", shower="
				+ shower + ", report=" + report + ", inputdate=" + inputdate + ", updatedate=" + updatedate
				+ ", deletedate=" + deletedate + ", deleteflag=" + deleteflag + "]";
	}
	
	

}