package web.scmaster.com.vo;

public class Room {
	
	private String room_no;
	private int maximum;
	private int present;
	private String deleteflag;
	
	public Room() {}

	public Room(String room_no, int maximum, int present, String deleteflag) {
		super();
		this.room_no = room_no;
		this.maximum = maximum;
		this.present = present;
		this.deleteflag = deleteflag;
	}

	public String getRoom_no() {
		return room_no;
	}

	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}

	public int getMaximum() {
		return maximum;
	}

	public void setMaximum(int maximum) {
		this.maximum = maximum;
	}

	public int getPresent() {
		return present;
	}

	public void setPresent(int present) {
		this.present = present;
	}

	public String getDeleteflag() {
		return deleteflag;
	}

	public void setDeleteflag(String deleteflag) {
		this.deleteflag = deleteflag;
	}

	@Override
	public String toString() {
		return "Room [room_no=" + room_no + ", maximum=" + maximum + ", present=" + present + ", deleteflag="
				+ deleteflag + "]";
	}
	
	

}
