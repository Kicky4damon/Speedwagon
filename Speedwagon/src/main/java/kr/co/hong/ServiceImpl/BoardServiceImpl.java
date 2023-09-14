package kr.co.hong.ServiceImpl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.hong.DAO.BoardDAO;
import kr.co.hong.DTO.BoardDTO;
import kr.co.hong.DTO.Criteria;
import kr.co.hong.Service.BoardService;

@Service
public class BoardServiceImpl implements BoardService{

	@Inject
	private BoardDAO dao;
	
	@Override
	public List<BoardDTO> board_ListAll() throws Exception{
		// TODO Auto-generated method stub
		
		return dao.board_ListAll();
	}

	@Override
	public BoardDTO board_detail(int num) throws Exception{
		// TODO Auto-generated method stub
		return dao.board_detail(num);
	}

	@Override
	public void board_write(BoardDTO bDTO) throws Exception{
		// TODO Auto-generated method stub
		dao.board_write(bDTO);
	}

	@Override
	public void board_update(BoardDTO dto) throws Exception{
		// TODO Auto-generated method stub
		dao.board_update(dto);
	}

	@Override
	public void board_delete(int num) throws Exception{
		// TODO Auto-generated method stub
		dao.board_delete(num);
	}

	@Override
	public List<BoardDTO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.countPaging(cri);
	}

}
