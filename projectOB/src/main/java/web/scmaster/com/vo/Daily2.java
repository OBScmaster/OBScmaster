package web.scmaster.com.vo;

public class Daily2 {
	
	private int pt_no;
	private String today;
	private String cleaning;
	private String wash;
	private String shower;
	private String report;
	private String inputdate;
	private String breakfast;
	private String lunch;
	private String dinner;
	private String snack;
	private String text;
	private String time;
	private String drtext;
	
	public Daily2() {}
	
	public Daily2(int pt_no, String today, String cleaning, String wash, String shower, String report, String inputdate,
			String breakfast, String lunch, String dinner, String snack, String text, String time, String drtext) {
		super();
		this.pt_no = pt_no;
		this.today = today;
		this.cleaning = cleaning;
		this.wash = wash;
		this.shower = shower;
		this.report = report;
		this.inputdate = inputdate;
		this.breakfast = breakfast;
		this.lunch = lunch;
		this.dinner = dinner;
		this.snack = snack;
		this.text = text;
		this.time = time;
		this.drtext = drtext;
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
	public String getBreakfast() {
		return breakfast;
	}
	public void setBreakfast(String breakfast) {
		this.breakfast = breakfast;
	}
	public String getLunch() {
		return lunch;
	}
	public void setLunch(String lunch) {
		this.lunch = lunch;
	}
	public String getDinner() {
		return dinner;
	}
	public void setDinner(String dinner) {
		this.dinner = dinner;
	}
	public String getSnack() {
		return snack;
	}
	public void setSnack(String snack) {
		this.snack = snack;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getDrtext() {
		return drtext;
	}
	public void setDrtext(String drtext) {
		this.drtext = drtext;
	}

	@Override
	public String toString() {
		return "Daily2 [pt_no=" + pt_no + ", today=" + today + ", cleaning=" + cleaning + ", wash=" + wash + ", shower="
				+ shower + ", report=" + report + ", inputdate=" + inputdate + ", breakfast=" + breakfast + ", lunch="
				+ lunch + ", dinner=" + dinner + ", snack=" + snack + ", text=" + text + ", time=" + time + ", drtext="
				+ drtext + "]";
	}
	
	
	

}
