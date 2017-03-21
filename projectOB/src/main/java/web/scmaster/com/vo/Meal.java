package web.scmaster.com.vo;

public class Meal {
	
	private int pt_no;
	private String today;
	private String breakfast;
	private String lunch;
	private String dinner;
	private String snack;
	private String time;
	private String deleteflag;

	public Meal() {}

	public Meal(int pt_no, String today, String breakfast, String lunch, String dinner, String snack, String time,
			String deleteflag) {
		super();
		this.pt_no = pt_no;
		this.today = today;
		this.breakfast = breakfast;
		this.lunch = lunch;
		this.dinner = dinner;
		this.snack = snack;
		this.time = time;
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

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getDeleteflag() {
		return deleteflag;
	}

	public void setDeleteflag(String deleteflag) {
		this.deleteflag = deleteflag;
	}

	@Override
	public String toString() {
		return "Meal [pt_no=" + pt_no + ", today=" + today + ", breakfast=" + breakfast + ", lunch=" + lunch
				+ ", dinner=" + dinner + ", snack=" + snack + ", time=" + time + ", deleteflag=" + deleteflag + "]";
	}
	
	
	
}
