package web.scmaster.com.vo;

public class Patient {
	
	private int pt_no;
	private int nurse_no;
	private String ins_no;
	private String name;
	private String birthdate;
	private String disease;
	private String phone;
	private String address;
	private String originalphoto;
	private String savedphoto;
	private String room_no;
	private String ppt_id;
	private String ppt_pw;
	private String ppt_name;
	private String ppt_phone;
	private String ppt_add;
	private String inputdate;
	private String updatedate;
	private String deletedate;
	private String deleteflag;
	
	public Patient() {}

	public Patient(int pt_no, int nurse_no, String ins_no, String name, String birthdate, String disease, String phone,
			String address, String originalphoto, String savedphoto, String room_no, String ppt_id, String ppt_pw,
			String ppt_name, String ppt_phone, String ppt_add, String inputdate, String updatedate, String deletedate,
			String deleteflag) {
		super();
		this.pt_no = pt_no;
		this.nurse_no = nurse_no;
		this.ins_no = ins_no;
		this.name = name;
		this.birthdate = birthdate;
		this.disease = disease;
		this.phone = phone;
		this.address = address;
		this.originalphoto = originalphoto;
		this.savedphoto = savedphoto;
		this.room_no = room_no;
		this.ppt_id = ppt_id;
		this.ppt_pw = ppt_pw;
		this.ppt_name = ppt_name;
		this.ppt_phone = ppt_phone;
		this.ppt_add = ppt_add;
		this.inputdate = inputdate;
		this.updatedate = updatedate;
		this.deletedate = deletedate;
		this.deleteflag = deleteflag;
	}

	public int getPt_no() {
		return pt_no;
	}

	public void setPt_no(int pt_no) {
		this.pt_no = pt_no;
	}

	public int getNurse_no() {
		return nurse_no;
	}

	public void setNurse_no(int nurse_no) {
		this.nurse_no = nurse_no;
	}

	public String getIns_no() {
		return ins_no;
	}

	public void setIns_no(String ins_no) {
		this.ins_no = ins_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	public String getDisease() {
		return disease;
	}

	public void setDesease(String disease) {
		this.disease = disease;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getOriginalphoto() {
		return originalphoto;
	}

	public void setOriginalphoto(String originalphoto) {
		this.originalphoto = originalphoto;
	}

	public String getSavedphoto() {
		return savedphoto;
	}

	public void setSavedphoto(String savedphoto) {
		this.savedphoto = savedphoto;
	}

	public String getRoom_no() {
		return room_no;
	}

	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}

	public String getPpt_id() {
		return ppt_id;
	}

	public void setPpt_id(String ppt_id) {
		this.ppt_id = ppt_id;
	}

	public String getPpt_pw() {
		return ppt_pw;
	}

	public void setPpt_pw(String ppt_pw) {
		this.ppt_pw = ppt_pw;
	}

	public String getPpt_name() {
		return ppt_name;
	}

	public void setPpt_name(String ppt_name) {
		this.ppt_name = ppt_name;
	}

	public String getPpt_phone() {
		return ppt_phone;
	}

	public void setPpt_phone(String ppt_phone) {
		this.ppt_phone = ppt_phone;
	}

	public String getPpt_add() {
		return ppt_add;
	}

	public void setPpt_add(String ppt_add) {
		this.ppt_add = ppt_add;
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

	public String getDeleteflag() {
		return deleteflag;
	}

	public void setDeleteflag(String deleteflag) {
		this.deleteflag = deleteflag;
	}

	@Override
	public String toString() {
		return "Patient [pt_no=" + pt_no + ", nurse_no=" + nurse_no + ", ins_no=" + ins_no + ", name=" + name
				+ ", birthdate=" + birthdate + ", disease=" + disease + ", phone=" + phone + ", address=" + address
				+ ", originalphoto=" + originalphoto + ", savedphoto=" + savedphoto + ", room_no=" + room_no
				+ ", ppt_id=" + ppt_id + ", ppt_pw=" + ppt_pw + ", ppt_name=" + ppt_name + ", ppt_phone=" + ppt_phone
				+ ", ppt_add=" + ppt_add + ", inputdate=" + inputdate + ", updatedate=" + updatedate + ", deletedate="
				+ deletedate + ", deleteflag=" + deleteflag + "]";
	}
	
	
	
	

}
