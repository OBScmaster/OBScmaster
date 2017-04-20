package web.scmaster.com.vo;

public class AisleSensorLog {
	
	private String ipaddress;
	private String timeonlog;
	private String text;
	
	public AisleSensorLog() {}
	
	public AisleSensorLog(String ipaddress, String timeonlog, String text) {
		super();
		this.ipaddress = ipaddress;
		this.timeonlog = timeonlog;
		this.text = text;
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

	@Override
	public String toString() {
		return "AisleSensorLog [ipaddress=" + ipaddress + ", timeonlog=" + timeonlog + ", text=" + text + "]";
	}
	
	
	

}
