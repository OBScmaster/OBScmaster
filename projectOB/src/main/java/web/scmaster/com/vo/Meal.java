package web.scmaster.com.vo;

public class Meal {
	
	private int pt_no;
	private String today;
	private String typeEat;
	private String mealTime;
	private String whatEat;
	private String insertDate;
	private String updateDate;
	private String deleteflag;

	public Meal() {}

	public Meal(int pt_no, String today, String typeEat, String mealTime, String whatEat, String insertDate,
			String updateDate, String deleteflag) {
		super();
		this.pt_no = pt_no;
		this.today = today;
		this.typeEat = typeEat;
		this.mealTime = mealTime;
		this.whatEat = whatEat;
		this.insertDate = insertDate;
		this.updateDate = updateDate;
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

	public String getTypeEat() {
		return typeEat;
	}

	public void setTypeEat(String typeEat) {
		this.typeEat = typeEat;
	}

	public String getMealTime() {
		return mealTime;
	}

	public void setMealTime(String mealTime) {
		this.mealTime = mealTime;
	}

	public String getWhatEat() {
		return whatEat;
	}

	public void setWhatEat(String whatEat) {
		this.whatEat = whatEat;
	}

	public String getInsertDate() {
		return insertDate;
	}

	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getDeleteflag() {
		return deleteflag;
	}

	public void setDeleteflag(String deleteflag) {
		this.deleteflag = deleteflag;
	}

	@Override
	public String toString() {
		return "Meal [pt_no=" + pt_no + ", today=" + today + ", typeEat=" + typeEat + ", mealTime=" + mealTime
				+ ", whatEat=" + whatEat + ", insertDate=" + insertDate + ", updateDate=" + updateDate + ", deleteflag="
				+ deleteflag + "]";
	}

	
}
