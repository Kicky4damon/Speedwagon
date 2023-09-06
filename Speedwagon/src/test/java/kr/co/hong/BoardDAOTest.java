package kr.co.hong;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.hong.DAO.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardDAOTest {

	@Inject
	private BoardDAO dao;
	
	@Test
	public void TestBoardDetail() {
		System.out.println("Test...............................");
		System.out.println(dao.board_detail(1));
	}
	

	
}
