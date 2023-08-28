package kr.co.hong.DTO;

public class LikeDTO {
	private int hit;
	private String member_id;
	private int board_num;
	
	@Override
	public String toString() {
		return "LikeDTO [hit=" + hit + ", member_id=" + member_id + ", board_num=" + board_num + "]";
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	
}
