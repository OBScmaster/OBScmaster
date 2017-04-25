package web.scmaster.com.vo;

public class Special {
	
	private int special_No;
	private int pt_no;
	private String today;
	private String sreportTime;
	private String sreport;
	private String inputdate;
	private String updatedate;
	private String deletedate;
	private String deleteflag;
	
	public Special() {
	}

	public Special(int special_No, int pt_no, String today, String sreportTime, String sreport, String inputdate,
			String updatedate, String deletedate, String deleteflag) {
		super();
		this.special_No = special_No;
		this.pt_no = pt_no;
		this.today = today;
		this.sreportTime = sreportTime;
		this.sreport = sreport;
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

	public int getSpecial_No() {
		return special_No;
	}

	public void setSpecial_No(int special_No) {
		this.special_No = special_No;
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

	public String getSreportTime() {
		return sreportTime;
	}

	public void setSreportTime(String sreportTime) {
		this.sreportTime = sreportTime;
	}

	public String getSreport() {
		return sreport;
	}

	public void setSreport(String sreport) {
		this.sreport = sreport;
	}

	public String getDeleteflag() {
		return deleteflag;
	}

	public void setDeleteflag(String deleteflag) {
		this.deleteflag = deleteflag;
	}

	@Override
	public String toString() {
		return "Special [special_No=" + special_No + ", pt_no=" + pt_no + ", today=" + today + ", sreportTime="
				+ sreportTime + ", sreport=" + sreport + ", inputdate=" + inputdate + ", updatedate=" + updatedate
				+ ", deletedate=" + deletedate + ", deleteflag=" + deleteflag + "]";
	}

	

}
