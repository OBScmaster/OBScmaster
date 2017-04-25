package web.scmaster.com.vo;

public class Exercise {
	
	private int exercise_No;
	private int pt_no;
	private String today;
	private String exerciseTime;
	private String exerciseText;
	private String inputdate;
	private String updatedate;
	private String deletedate;
	private String deleteflag;
	
	public Exercise() {}

	

	public Exercise(int exercise_No, int pt_no, String today, String exerciseTime, String exerciseText,
			String inputdate, String updatedate, String deletedate, String deleteflag) {
		super();
		this.exercise_No = exercise_No;
		this.pt_no = pt_no;
		this.today = today;
		this.exerciseTime = exerciseTime;
		this.exerciseText = exerciseText;
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



	public int getExercise_No() {
		return exercise_No;
	}

	public void setExercise_No(int exercise_No) {
		this.exercise_No = exercise_No;
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

	public String getExerciseTime() {
		return exerciseTime;
	}

	public void setExerciseTime(String exerciseTime) {
		this.exerciseTime = exerciseTime;
	}

	public String getExerciseText() {
		return exerciseText;
	}

	public void setExerciseText(String exerciseText) {
		this.exerciseText = exerciseText;
	}

	public String getDeleteflag() {
		return deleteflag;
	}

	public void setDeleteflag(String deleteflag) {
		this.deleteflag = deleteflag;
	}



	@Override
	public String toString() {
		return "Exercise [exercise_No=" + exercise_No + ", pt_no=" + pt_no + ", today=" + today + ", exerciseTime="
				+ exerciseTime + ", exerciseText=" + exerciseText + ", inputdate=" + inputdate + ", updatedate="
				+ updatedate + ", deletedate=" + deletedate + ", deleteflag=" + deleteflag + "]";
	}



}
