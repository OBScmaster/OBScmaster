package web.scmaster.com.vo;

public class Schedule {
	
	private String typeEat;
	private String mealTime;
	private String whatEat;
	private String exerciseTime;
	private String exerciseText;
	private String cleaning;
	private String cleaningReport;
	private String wash;
	private String washReport;
	private String shower;
	private String showerReport;
	private String timeToSleep;
	private String timeToGetup;
	private String reportTime;
	private String report;
	private String sreportTime;
	private String sreport;
	
	public Schedule() {
	}

	public Schedule(String typeEat, String mealTime, String wahtEat, String exerciseTime, String exerciseText,
			String cleaning, String cleaningReport, String wash, String washReport, String shower, String showerReport,
			String timeToSleep, String timeToGetup, String reportTime, String report, String sreportTime,
			String sreport) {
		this.typeEat = typeEat;
		this.mealTime = mealTime;
		this.whatEat = wahtEat;
		this.exerciseTime = exerciseTime;
		this.exerciseText = exerciseText;
		this.cleaning = cleaning;
		this.cleaningReport = cleaningReport;
		this.wash = wash;
		this.washReport = washReport;
		this.shower = shower;
		this.showerReport = showerReport;
		this.timeToSleep = timeToSleep;
		this.timeToGetup = timeToGetup;
		this.reportTime = reportTime;
		this.report = report;
		this.sreportTime = sreportTime;
		this.sreport = sreport;
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

	public String getWahtEat() {
		return whatEat;
	}

	public void setWahtEat(String wahtEat) {
		this.whatEat = wahtEat;
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

	public String getCleaning() {
		return cleaning;
	}

	public void setCleaning(String cleaning) {
		this.cleaning = cleaning;
	}

	public String getCleaningReport() {
		return cleaningReport;
	}

	public void setCleaningReport(String cleaningReport) {
		this.cleaningReport = cleaningReport;
	}

	public String getWash() {
		return wash;
	}

	public void setWash(String wash) {
		this.wash = wash;
	}

	public String getWashReport() {
		return washReport;
	}

	public void setWashReport(String washReport) {
		this.washReport = washReport;
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

	public String getTimeToSleep() {
		return timeToSleep;
	}

	public void setTimeToSleep(String timeToSleep) {
		this.timeToSleep = timeToSleep;
	}

	public String getTimeToGetup() {
		return timeToGetup;
	}

	public void setTimeToGetup(String timeToGetup) {
		this.timeToGetup = timeToGetup;
	}

	public String getReportTime() {
		return reportTime;
	}

	public void setReportTime(String reportTime) {
		this.reportTime = reportTime;
	}

	public String getReport() {
		return report;
	}

	public void setReport(String report) {
		this.report = report;
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

	@Override
	public String toString() {
		return "Schedule [typeEat=" + typeEat + ", mealTime=" + mealTime + ", wahtEat=" + whatEat + ", exerciseTime="
				+ exerciseTime + ", exerciseText=" + exerciseText + ", cleaning=" + cleaning + ", cleaningReport="
				+ cleaningReport + ", wash=" + wash + ", washReport=" + washReport + ", shower=" + shower
				+ ", showerReport=" + showerReport + ", timeToSleep=" + timeToSleep + ", timeToGetup=" + timeToGetup
				+ ", reportTime=" + reportTime + ", report=" + report + ", sreportTime=" + sreportTime + ", sreport="
				+ sreport + "]";
	}
}
