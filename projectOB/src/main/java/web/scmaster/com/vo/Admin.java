package web.scmaster.com.vo;

public class Admin {
	
	private String id;
	private String password;
	
	public Admin() {
		super();
	}

	public Admin(String id, String password) {
		super();
		this.id = id;
		this.password = password;
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

	@Override
	public String toString() {
		return "Admin [id=" + id + ", password=" + password + "]";
	}
	
}
