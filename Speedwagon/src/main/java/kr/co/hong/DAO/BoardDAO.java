package kr.co.hong.DAO;

import java.util.List;

import kr.co.hong.DTO.BoardDTO;
import kr.co.hong.DTO.Criteria;

public interface BoardDAO {

	/* 게시판 전체 불러오기 */
	public List<BoardDTO> board_ListAll()throws Exception;

	/* 게시물 상세 보기 */
	public BoardDTO board_detail(int num)throws Exception;

	/* 게시물 작성 */
	public void board_write(BoardDTO bDTO)throws Exception;

	/* 게시물 수정 */
	public void board_update(BoardDTO dto)throws Exception;
	
	/* 게시물 삭제	 */
	public void board_delete(int num)throws Exception;
	
	/* 게시물 페이징 */
	
	public List<BoardDTO> listPage(int page)throws Exception;

	public List<BoardDTO> listCriteria(Criteria cri)throws Exception;
	
}	
