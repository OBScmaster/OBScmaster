package web.scmaster.com.vo;

public class Room {
	
	private String room_no;
	private int maximum_no;
	private int present_no;
	private String deleteflag;
	
	public Room() {}
	
	public Room(String room_no, int maximum_no, int present_no, String deleteflag) {
		super();
		this.room_no = room_no;
		this.maximum_no = maximum_no;
		this.present_no = present_no;
		this.deleteflag = deleteflag;
	}



	public String getRoom_no() {
		return room_no;
	}
	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}
	public int getMaximum_no() {
		return maximum_no;
	}
	public void setMaximum_no(int maximum_no) {
		this.maximum_no = maximum_no;
	}
	public int getPresent_no() {
		return present_no;
	}
	public void setPresent_no(int present_no) {
		this.present_no = present_no;
	}
	public String getDeleteflag() {
		return deleteflag;
	}
	public void setDeleteflag(String deleteflag) {
		this.deleteflag = deleteflag;
	}



	@Override
	public String toString() {
		return "Room [room_no=" + room_no + ", maximum_no=" + maximum_no + ", present_no=" + present_no
				+ ", deleteflag=" + deleteflag + "]";
	}
	
	

}
