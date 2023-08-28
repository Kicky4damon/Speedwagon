package kr.co.hong.DTO;

public class InterestDTO {
	private int id;
	private int cartegory_id;
	private String member_id;
	
	@Override
	public String toString() {
		return "InterestDTO [id=" + id + ", cartegory_id=" + cartegory_id + ", member_id=" + member_id + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCartegory_id() {
		return cartegory_id;
	}

	public void setCartegory_id(int cartegory_id) {
		this.cartegory_id = cartegory_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
}
