package kr.co.hong.DAO;

import java.util.List;

import kr.co.hong.DTO.ArticleDTO;

public interface ArticleDAO {

	/* 댓글 전체 불러오기 */
	public List<ArticleDTO> article_All();

	/* 댓글 불러오기 */
	public ArticleDTO article_Load();

	/* 댓글 작성 */
	public void article_write(ArticleDTO aDTO);

	/* 댓글 수정 */
	public void article_update(ArticleDTO aDTO);

	/* 댓글 삭제 */
	public void article_delete(ArticleDTO aDTO);

}
