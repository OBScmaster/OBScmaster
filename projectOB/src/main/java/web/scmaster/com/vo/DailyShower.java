package web.scmaster.com.vo;

public class DailyShower {

	private int dailyshower_No;
	private int pt_no;
	private String today;
	private String shower;
	private String showerReport;
	private String inputdate;
	private String updatedate;
	private String deletedate;
	private String deleteflag;
	
	public DailyShower() {
	}

	public DailyShower(int dailyshower_No, int pt_no, String today, String shower, String showerReport,
			String inputdate, String updatedate, String deletedate, String deleteflag) {
		this.dailyshower_No = dailyshower_No;
		this.pt_no = pt_no;
		this.today = today;
		this.shower = shower;
		this.showerReport = showerReport;
		this.inputdate = inputdate;
		this.updatedate = updatedate;
		this.deletedate = deletedate;
		this.deleteflag = deleteflag;
	}

	public int getDailyshower_No() {
		return dailyshower_No;
	}

	public void setDailyshower_No(int dailyshower_No) {
		this.dailyshower_No = dailyshower_No;
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

	public String getShower() {
		return shower;
	}

	public void setShower(String shower) {
		this.shower = shower;
	}

	public String getShowerReport() {
		return showerReport;
	}

	public void setShowerReport(String showerReport) {
		this.showerReport = showerReport;
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
		return "DailyShower [dailyshower_No=" + dailyshower_No + ", pt_no=" + pt_no + ", today=" + today + ", shower="
				+ shower + ", showerReport=" + showerReport + ", inputdate=" + inputdate + ", updatedate=" + updatedate
				+ ", deletedate=" + deletedate + ", deleteflag=" + deleteflag + "]";
	}

}
