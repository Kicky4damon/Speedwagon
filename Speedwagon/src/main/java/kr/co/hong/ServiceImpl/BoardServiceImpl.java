package kr.co.hong.ServiceImpl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.hong.DAO.BoardDAO;
import kr.co.hong.DTO.BoardDTO;
import kr.co.hong.Service.BoardService;

@Service
public class BoardServiceImpl implements BoardService{

	@Inject
	private BoardDAO dao;
	
	@Override
	public List<BoardDTO> board_ListAll() {
		// TODO Auto-generated method stub
		
		return dao.board_ListAll();
	}

	@Override
	public BoardDTO board_detail(int num) {
		// TODO Auto-generated method stub
		return dao.board_detail(num);
	}

	@Override
	public void board_write(BoardDTO bDTO) {
		// TODO Auto-generated method stub
		dao.board_write(bDTO);
	}

	@Override
	public void board_update(int num) {
		// TODO Auto-generated method stub
		dao.board_update(num);
	}

	@Override
	public void board_delete(int num) {
		// TODO Auto-generated method stub
		dao.board_delete(num);
	}
	
	
	

}
