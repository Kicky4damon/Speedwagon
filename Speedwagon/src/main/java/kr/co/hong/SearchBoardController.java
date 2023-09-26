package kr.co.hong;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.hong.DTO.BoardDTO;
import kr.co.hong.DTO.PageMaker;
import kr.co.hong.DTO.SearchCriteria;
import kr.co.hong.Service.BoardService;

@Controller
@RequestMapping("/Search/*")
public class SearchBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchBoardController.class);

	@Inject
	private BoardService service;
	
	
	// 게시판 전체 불러오기
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		
		logger.info(cri.toString());
		
		//model.addAttribute("list", service.listCriteria(cri));
		
		model.addAttribute("list", service.listSearchCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		// pageMaker.setTotalCount(service.listCountCriteria(cri));
		
		pageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	// 게시물 상세 불러오기
	@RequestMapping(value ="/detail_page", method = RequestMethod.GET)
	public void read(@RequestParam("num") int num, @ModelAttribute("cri") SearchCriteria cri, Model model, RedirectAttributes rttr) throws Exception{
		
		model.addAttribute("board", service.board_detail(num));
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		
	}
	
	// 게시물 삭제
	@RequestMapping(value = "/delete_page", method = RequestMethod.GET)
	public String remove(@RequestParam("num") int num, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
				
		service.board_delete(num);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "delete");
		
		return "redirect:list";
		
		}
	
	//게시물 수정
	
	@RequestMapping(value ="/modifyPage", method = RequestMethod.GET)
	public void modifyPagingGET(int num, @ModelAttribute("cri") SearchCriteria cri, Model model, RedirectAttributes rttr) throws Exception{
		model.addAttribute(service.board_detail(num));
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
	
		
	}
	
	@RequestMapping(value ="/modifyPage", method = RequestMethod.POST)
	public String modifyPagingPOST(BoardDTO board, SearchCriteria cri, RedirectAttributes rttr) throws Exception{
		logger.info(cri.toString());
		service.board_update(board);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "modify");
		
		logger.info(rttr.toString());
		
		return "redirect:list";
	}
	
	@RequestMapping(value="/submitPage" , method = RequestMethod.GET)
	public void submitGET() throws Exception{
		
		logger.info("sumbit get ...... ");

	}
	
	@RequestMapping(value = "/submitPage" , method = RequestMethod.POST)
	public String submitPOST(BoardDTO board, RedirectAttributes rttr)throws Exception{
		board.setMember_nickname("koko");
		logger.info("submit post .....");
		logger.info(board.toString());
		
		service.board_write(board);
		
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:list";
	}
}
	


