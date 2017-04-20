package web.scmaster.com.vo;

public class SensorLog {
	
	private String ipaddress;
	private String timeonlog;
	private String text;
	private String sensortype;
	
	public SensorLog() {}

	public SensorLog(String ipaddress, String timeonlog, String text, String sensortype) {
		super();
		this.ipaddress = ipaddress;
		this.timeonlog = timeonlog;
		this.text = text;
		this.sensortype = sensortype;
	}
	
	public String getIpaddress() {
		return ipaddress;
	}

	public void setIpaddress(String ipaddress) {
		this.ipaddress = ipaddress;
	}

	public String getTimeonlog() {
		return timeonlog;
	}

	public void setTimeonlog(String timeonlog) {
		this.timeonlog = timeonlog;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
	public String getSensortype() {
		return sensortype;
	}

	public void setSensortype(String sensortype) {
		this.sensortype = sensortype;
	}

	@Override
	public String toString() {
		return "SensorLog [ipaddress=" + ipaddress + ", timeonlog=" + timeonlog + ", text=" + text + ", sensortype="
				+ sensortype + "]";
	}



}
