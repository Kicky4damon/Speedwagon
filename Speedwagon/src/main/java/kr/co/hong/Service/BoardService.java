package kr.co.hong.Service;

import java.util.List;

import kr.co.hong.DTO.BoardDTO;
import kr.co.hong.DTO.Criteria;

public interface BoardService {

	/* 게시판 전체 불러오기 */
	public List<BoardDTO> board_ListAll() throws Exception;

	/* 게시물 상세 보기 */
	public BoardDTO board_detail(int num) throws Exception;

	/* 게시물 작성 */
	public void board_write(BoardDTO bDTO) throws Exception;

	/* 게시물 수정 */
	public void board_update(BoardDTO dto) throws Exception;
	
	/* 게시물 삭제	 */
	public void board_delete(int num) throws Exception;
	
	/* 페이징 처리 기준*/
	public List<BoardDTO> listCriteria(Criteria cri) throws Exception;
	
	/* 전체 게시물 숫자 계산 */
	public int listCountCriteria(Criteria cri) throws Exception;
}
