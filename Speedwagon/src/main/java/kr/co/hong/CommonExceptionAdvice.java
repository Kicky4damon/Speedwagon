package kr.co.hong;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/*import org.slf4j.Logger;
import org.slf4j.LoggerFactory;*/
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
/*import org.springframework.web.servlet.ModelAndView;*/
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class CommonExceptionAdvice {

	private static final Logger logger = LoggerFactory.getLogger(CommonExceptionAdvice.class);
	
	/* 에러코드만 출력 할 시
	 * 
	 * @ExceptionHandler(Exception.class)
	public String common(Exception e) {
		
		logger.info(e.toString());
		
		return "error_common";
	}*/
	
	/*에러코드를 ModelAndView형태로 출력 할 시
	 * 
	@ExceptionHandler(Exception.class)
	private ModelAndView errorModelAndView(Exception ex) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/error_common");
		modelAndView.addObject("exception",ex);
		return modelAndView;
	}*/
	/*에러코드 대신 리다이렉트로 목록으로 돌아가게하기 */
	@ExceptionHandler(Exception.class)
	private ModelAndView errorModelAndView(Exception ex) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/error_common");
		mav.addObject("exception", ex);
		
		return mav;
	}
}
