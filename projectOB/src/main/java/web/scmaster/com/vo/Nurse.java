package web.scmaster.com.vo;

public class Nurse {
	
	private int nurse_no;
	private String cert_no;
	private String id;
	private String password;
	private String name;
	private String phone;
	private String originalphoto;
	private String savedphoto;
	private String inputdate;
	private String updatedate;
	private String deletedate;
	private String deleteflag;
	
	public Nurse() {}
	
	public Nurse(int nurse_no, String cert_no, String id, String password, String name, String phone,
			String originalphoto, String savedphoto, String inputdate, String updatedate, String deletedate,
			String deleteflag) {
		super();
		this.nurse_no = nurse_no;
		this.cert_no = cert_no;
		this.id = id;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.originalphoto = originalphoto;
		this.savedphoto = savedphoto;
		this.inputdate = inputdate;
		this.updatedate = updatedate;
		this.deletedate = deletedate;
		this.deleteflag = deleteflag;
	}
	
	

	public int getNurse_no() {
		return nurse_no;
	}

	public void setNurse_no(int nurse_no) {
		this.nurse_no = nurse_no;
	}

	public String getCert_no() {
		return cert_no;
	}

	public void setCert_no(String cert_no) {
		this.cert_no = cert_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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
		return "Nurse [nurse_no=" + nurse_no + ", cert_no=" + cert_no + ", id=" + id + ", password=" + password
				+ ", name=" + name + ", phone=" + phone + ", originalphoto=" + originalphoto + ", savedphoto="
				+ savedphoto + ", inputdate=" + inputdate + ", updatedate=" + updatedate + ", deletedate=" + deletedate
				+ ", deleteflag=" + deleteflag + "]";
	}
	
	

}
