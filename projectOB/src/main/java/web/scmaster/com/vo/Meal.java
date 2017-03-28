package web.scmaster.com.vo;

public class Meal {
	
	private int pt_no;
	private String today;
	private String breakfast;
	private String breakfastTime;
	private String lunch;
	private String lunchTime;
	private String dinner;
	private String dinnerTime;
	private String snack;
	private String snackTime;
	private String deleteflag;

	public Meal() {}

	public Meal(int pt_no, String today, String breakfast, String breakfastTime, String lunch, String lunchTime,
			String dinner, String dinnerTime, String snack, String snackTime, String deleteflag) {
		super();
		this.pt_no = pt_no;
		this.breakfast = breakfast;
		this.breakfastTime = breakfastTime;
		this.lunch = lunch;
		this.lunchTime = lunchTime;
		this.dinner = dinner;
		this.dinnerTime = dinnerTime;
		this.snack = snack;
		this.snackTime = snackTime;
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

	public String getBreakfastTime() {
		return breakfastTime;
	}

	public void setBreakfastTime(String breakfastTime) {
		this.breakfastTime = breakfastTime;
	}

	public String getLunch() {
		return lunch;
	}

	public void setLunch(String lunch) {
		this.lunch = lunch;
	}

	public String getLunchTime() {
		return lunchTime;
	}

	public void setLunchTime(String lunchTime) {
		this.lunchTime = lunchTime;
	}

	public String getDinner() {
		return dinner;
	}

	public void setDinner(String dinner) {
		this.dinner = dinner;
	}

	public String getDinnerTime() {
		return dinnerTime;
	}

	public void setDinnerTime(String dinnerTime) {
		this.dinnerTime = dinnerTime;
	}

	public String getSnack() {
		return snack;
	}

	public void setSnack(String snack) {
		this.snack = snack;
	}

	public String getSnackTime() {
		return snackTime;
	}

	public void setSnackTime(String snackTime) {
		this.snackTime = snackTime;
	}

	public String getDeleteflag() {
		return deleteflag;
	}

	public void setDeleteflag(String deleteflag) {
		this.deleteflag = deleteflag;
	}

	@Override
	public String toString() {
		return "Meal [pt_no=" + pt_no + ", today=" + today + ", breakfast=" + breakfast + ", breakfastTime="
				+ breakfastTime + ", lunch=" + lunch + ", lunchTime=" + lunchTime + ", dinner=" + dinner
				+ ", dinnerTime=" + dinnerTime + ", snack=" + snack + ", snackTime=" + snackTime + ", deleteflag="
				+ deleteflag + "]";
	}
}
