package kr.co.hong;

import java.text.DateFormat;
import java.util.Date;
import java.util.Formatter;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.hong.DTO.BoardDTO;
import kr.co.hong.Service.BoardService;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

@Inject
private BoardService service;

@RequestMapping(value = "/submit", method = RequestMethod.GET)
public String BoardSubmitGET(BoardDTO board, Model model) throws Exception {
	
	logger.info("register get ...........");
	return "Board_Submit";
	
}

@RequestMapping(value = "/submit", method = RequestMethod.POST)
public String BoardSubmitPOST(BoardDTO board, Model model) throws Exception {
	board.setMember_nickname("koko");
	logger.info("register post ...........");
	logger.info(board.toString());
	service.board_write(board);
	
	return "redirect:/listAll";
	
	
}
@RequestMapping(value = "/listAll", method = RequestMethod.GET)
public String listAll(Locale locale, Model model) {
	logger.info("Welcome home! The client locale is {}.", locale);
	
	Date date = new Date();
	DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	
	String formattedDate = dateFormat.format(date);
	
	model.addAttribute("serverTime", formattedDate );
	model.addAttribute("list",service.board_ListAll());
	return "listAll";
}	
	

}
