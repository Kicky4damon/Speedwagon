package kr.co.hong;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class CommonExceptionAdvice {

	private static final Logger logger = LoggerFactory.getLogger(CommonExceptionAdvice.class);
	
	
	/* 에러코드만 출력 할 시
	 * @ExceptionHandler(Exception.class)
	public String common(Exception e) {
		
		logger.info(e.toString());
		
		return "error_common";
	}*/
	@ExceptionHandler(Exception.class)
	private 
}
