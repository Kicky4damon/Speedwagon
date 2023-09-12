package kr.co.hong;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.hong.DAO.BoardDAO;
import kr.co.hong.DTO.BoardDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardDAOTest {
	private static final Logger LOGGER = LoggerFactory.getLogger(BoardDAOTest.class);
	
	
	@Inject
	private BoardDAO dao;
	
	@Test
	public void TestBoardDetail() {
		System.out.println("Test...............................");
	}
	@Test
	public void testListPage()throws Exception{
		
		int page = 3;
		
		List<BoardDTO> list = dao.listPage(page);
		
		for (BoardDTO boardDTO : list) {
			LOGGER.info(boardDTO.getNum() + ":" + boardDTO.getTitle());
		}
	}

	
}
