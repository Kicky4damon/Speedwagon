package kr.co.hong.DTO;

public class ArticleDTO {
	private int id;
	private String member_m_id;
	private String content;
	private int board_num;
	
	@Override
	public String toString() {
		return "ArticleDTO [id=" + id + ", member_m_id=" + member_m_id + ", content=" + content + ", board_num="
				+ board_num + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMember_m_id() {
		return member_m_id;
	}

	public void setMember_m_id(String member_m_id) {
		this.member_m_id = member_m_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	
	
}
