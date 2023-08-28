package kr.co.hong.DTO;

public class RoleDTO {
	private String name;
	private String part;
	private String member_m_id;
	
	@Override
	public String toString() {
		return "RoleDTO [name=" + name + ", part=" + part + ", member_m_id=" + member_m_id + "]";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}

	public String getMember_m_id() {
		return member_m_id;
	}

	public void setMember_m_id(String member_m_id) {
		this.member_m_id = member_m_id;
	}
	
	
}
