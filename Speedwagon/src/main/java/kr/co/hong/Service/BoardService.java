package kr.co.hong.Service;

import java.util.List;

import kr.co.hong.DTO.BoardDTO;

public interface BoardService {

	/* 게시판 전체 불러오기 */
	public List<BoardDTO> board_ListAll();

	/* 게시물 상세 보기 */
	public BoardDTO board_detail(int num);

	/* 게시물 작성 */
	public void board_write(BoardDTO bDTO);

	/* 게시물 수정 */
	public void board_update(int num);
	
	/* 게시물 삭제	 */
	public void board_delete(int num);
	
	
	

}
