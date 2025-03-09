package model;

public class User implements java.io.Serializable {
	private int id;
	private String username;
	private String fullname;
	private String email;
	
	public User(int id, String username, String fullname, String email) {
		super();
		this.id = id;
		this.username = username;
		this.fullname = fullname;
		this.email = email;
	}
	
	public User() {
		super();
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getFullname() {
		return fullname;
	}
	
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
}
