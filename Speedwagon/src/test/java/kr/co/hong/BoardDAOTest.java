package kr.co.hong;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import kr.co.hong.DAO.BoardDAO;
import kr.co.hong.DTO.BoardDTO;
import kr.co.hong.DTO.Criteria;
import kr.co.hong.DTO.SearchCriteria;

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
	@Test
	public void testListCriteria()throws Exception{
		
		Criteria cri = new Criteria();
		cri.setPage(2);
		cri.setPerPageNum(20);
		
		List<BoardDTO> list = dao.listCriteria(cri);
		
		for (BoardDTO boardDTO : list) {
			LOGGER.info(boardDTO.getNum() + ":" + boardDTO.getTitle());
		}
	}
	@Test
	public void testURI()throws Exception{
		
		UriComponents uriComponents =
				UriComponentsBuilder.newInstance()
				.path("detail")
				.queryParam("num", 12)
				.queryParam("perPageNum", 20)
				.build();
		
		LOGGER.info("detail?num=12&perPageNum=20");
		LOGGER.info(uriComponents.toString());
	}
	@Test
	public void testURI2()throws Exception{
		
		UriComponents uriComponents2 =
				UriComponentsBuilder.newInstance()
				.path("/{module}/{page}")
				.queryParam("num", 12)
				.queryParam("perPageNum", 20)
				.build()
				.expand("board", "read")
				.encode();
		LOGGER.info("/board/read?num=12&perPageNum=20");
		LOGGER.info(uriComponents2.toString());
			
	}
	@Test
	public void testDynamic1() throws Exception {
		
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(1);
		cri.setKeyword("글");
		cri.setSearchType("t");
		
		LOGGER.info("================================================");
		
		List<BoardDTO> list = dao.listSearch(cri);
		
		for (BoardDTO boarddto : list) {
			LOGGER.info(boarddto.getNum() + ": " + boarddto.getTitle());
		}
		LOGGER.info("================================================");
		LOGGER.info("COUNT: " + dao.listSearchCount(cri));
	}
	
}
