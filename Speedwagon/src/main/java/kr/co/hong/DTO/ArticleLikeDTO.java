package kr.co.hong.DTO;

public class ArticleLikeDTO {
	private int id;
	private int like;
	private int article_id;
	private String member_id;
	
	@Override
	public String toString() {
		return "ArticleLikeDTO [id=" + id + ", like=" + like + ", article_id=" + article_id + ", member_id=" + member_id
				+ "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public int getArticle_id() {
		return article_id;
	}

	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
}
