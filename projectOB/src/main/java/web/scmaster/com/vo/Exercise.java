package web.scmaster.com.vo;

public class Exercise {
	
	private int exercise_No;
	private int pt_no;
	private String today;
	private String exerciseTime;
	private String exerciseText;
	private String deleteflag;
	
	public Exercise() {}

	public Exercise(int exercise_No, int pt_no, String today, String exerciseTime, String exerciseText,
			String deleteflag) {
		this.exercise_No = exercise_No;
		this.pt_no = pt_no;
		this.today = today;
		this.exerciseTime = exerciseTime;
		this.exerciseText = exerciseText;
		this.deleteflag = deleteflag;
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
				+ exerciseTime + ", exerciseText=" + exerciseText + ", deleteflag=" + deleteflag + "]";
	}

}
