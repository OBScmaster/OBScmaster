package web.scmaster.com.vo;

public class Meal {
	
	private int meal_No;
	private int pt_no;
	private String today;
	private String typeEat;
	private String mealTime;
	private String whatEat;
	private String inputdate;
	private String updatedate;
	private String deletedate;
	private String deleteflag;

	public Meal() {}


	public Meal(int meal_No, int pt_no, String today, String typeEat, String mealTime, String whatEat, String inputdate,
			String updatedate, String deletedate, String deleteflag) {
		super();
		this.meal_No = meal_No;
		this.pt_no = pt_no;
		this.today = today;
		this.typeEat = typeEat;
		this.mealTime = mealTime;
		this.whatEat = whatEat;
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



	public int getMeal_No() {
		return meal_No;
	}

	public void setMeal_No(int meal_No) {
		this.meal_No = meal_No;
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


	public String getDeleteflag() {
		return deleteflag;
	}

	public void setDeleteflag(String deleteflag) {
		this.deleteflag = deleteflag;
	}


	@Override
	public String toString() {
		return "Meal [meal_No=" + meal_No + ", pt_no=" + pt_no + ", today=" + today + ", typeEat=" + typeEat
				+ ", mealTime=" + mealTime + ", whatEat=" + whatEat + ", inputdate=" + inputdate + ", updatedate="
				+ updatedate + ", deletedate=" + deletedate + ", deleteflag=" + deleteflag + "]";
	}



	

	
}
