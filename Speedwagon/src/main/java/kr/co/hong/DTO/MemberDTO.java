package kr.co.hong.DTO;

public class MemberDTO {
	private String id;
	private String email;
	private String nickname;
	private String password;
	private String userrole;
	
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", email=" + email + ", nickname=" + nickname + ", password=" + password
				+ ", userrole=" + userrole + "]";
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserrole() {
		return userrole;
	}
	public void setUserrole(String userrole) {
		this.userrole = userrole;
	}
	
}
