package kr.co.hong.DAOImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.hong.DAO.BoardDAO;
import kr.co.hong.DTO.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired 
	private SqlSession sqlsession;
	private final static String namespace = "kr.co.hong.mappers.BoardMapper";

	@Override
	public List<BoardDTO> board_ListAll() {
		// TODO Auto-generated method stub
		List<BoardDTO> list = sqlsession.selectList(namespace + ".board_listAll");
		return list;
	}

	@Override
	public BoardDTO board_detail(int num) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace + ".board_detail", num);
	}

	@Override
	public void board_write(BoardDTO bDTO) {
		// TODO Auto-generated method stub
		sqlsession.insert(namespace + ".board_write", bDTO);
		
	}

	@Override
	public void board_update(int num) {
		// TODO Auto-generated method stub
		sqlsession.update(namespace + ".board_update", num);
		
	}

	@Override
	public void board_delete(int num) {
		// TODO Auto-generated method stub
		sqlsession.delete(namespace + ".board_delete", num);
		
	}

	

}
