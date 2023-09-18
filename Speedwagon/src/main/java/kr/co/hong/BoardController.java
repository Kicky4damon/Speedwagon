package kr.co.hong;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.hong.DTO.BoardDTO;
import kr.co.hong.DTO.Criteria;
import kr.co.hong.DTO.PageMaker;
import kr.co.hong.Service.BoardService;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

@Inject
private BoardService service;

//글 작성 불러오기
@RequestMapping(value = "/submit", method = RequestMethod.GET)
public String BoardSubmitGET(BoardDTO board, Model model) throws Exception {
	
	logger.info("register get ...........");
	return "board_submit";
}
//글 작성 하기
@RequestMapping(value = "/submit", method = RequestMethod.POST)
public String BoardSubmitPOST(BoardDTO board, RedirectAttributes rttr) throws Exception {
	board.setMember_nickname("koko");
	logger.info("register post ...........");
	logger.info(board.toString());
	service.board_write(board);
	
	rttr.addFlashAttribute("msg", "success");
	
	return "redirect:/listPage";
	
	
}
//글 목록 불러오기
@RequestMapping(value = "/listAll", method = RequestMethod.GET)
public String listAll(Locale locale, Model model) throws Exception {
	logger.info("Welcome home! The client locale is {}.", locale);
	
	Date date = new Date();
	DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	
	String formattedDate = dateFormat.format(date);
	
	model.addAttribute("serverTime", formattedDate );
	model.addAttribute("list",service.board_ListAll());
	return "listPage";
}	
// 글 상세 확인하기

@RequestMapping(value = "/detail_page", method = RequestMethod.GET)
public void detail(@RequestParam("num") int num, Model model, @ModelAttribute("cri") Criteria cri) throws Exception {
	BoardDTO dto = service.board_detail(num);
	dto.setCnt(dto.getCnt()+1);
	service.board_update(dto);
	
	model.addAttribute("board", service.board_detail(num));
}
//글 상세 확인 -> 돌아가기

//글 삭제하기

@RequestMapping(value = "/board_delete", method = RequestMethod.GET)
public String boardDelete(@RequestParam("num") int num, RedirectAttributes rttr, Criteria cri) throws Exception{
	
	logger.info("delete post.............");
	
	service.board_delete(num);
	rttr.addAttribute("page", cri.getPage());
	rttr.addAttribute("perPageNum", cri.getPerPageNum());
	rttr.addFlashAttribute("msg", "delete");
	System.out.println(cri);
	
	return "redirect:/listPage";
}

/*//글 수정 불러오기

@RequestMapping(value= "/board_modify", method = RequestMethod.GET)
public void modifyGET(int num, Model model) throws Exception{
	
	model.addAttribute(service.board_detail(num));
}
//글 수정 후 불러오기
@RequestMapping(value= "/board_modify", method = RequestMethod.POST)
public String modifyPOST(BoardDTO dto,RedirectAttributes rttr) throws Exception{
	logger.info("mod post.....");
	
	service.board_update(dto);
	
	rttr.addFlashAttribute("msg", "modify");
	
	return "redirect:/listPage";
}*/

// 글 수정 불러오기 Ver.2

@RequestMapping(value = "/modifyPage" , method = RequestMethod.GET)
public void modifyPagingGET(@RequestParam("num")int num, Model model)throws Exception{
	
model.addAttribute(service.board_detail(num));
}

// 글 업데이트 Ver.2
@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
 public String modifyPagingPOST(BoardDTO dto , Criteria cri, RedirectAttributes rttr)throws Exception{
	
	
	service.board_update(dto);
	rttr.addAttribute("page" , cri.getPage());
	rttr.addAttribute("perPageNum", cri.getPerPageNum());
	rttr.addFlashAttribute("msg", "modify");
	
	return "redirect:/listPage";
}

// 글 페이지 번호 확인
@RequestMapping(value = "/listCri", method = RequestMethod.GET)
public void listAll(Criteria cri, Model model) throws Exception {
	
	logger.info("show list page with Criteria............");
	
	model.addAttribute("list", service.listCriteria(cri));
}

// 페이지 카운트 
@RequestMapping(value = "/listPage", method = RequestMethod.GET)
public void listPage(@ModelAttribute("cri")Criteria cri, Model model) throws Exception{
	
	logger.info(cri.toString());
	
	model.addAttribute("list", service.listCriteria(cri));
	PageMaker pageMaker = new PageMaker();
	pageMaker.setCri(cri);
	//pageMaker.setTotalCount(131);
	
	pageMaker.setTotalCount(service.listCountCriteria(cri));
	
	
	model.addAttribute("pageMaker", pageMaker);
}

}
