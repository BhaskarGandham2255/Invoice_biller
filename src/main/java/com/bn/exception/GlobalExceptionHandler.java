package com.bn.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class GlobalExceptionHandler 
{
	 @ExceptionHandler(Exception.class)
	    public String handleException(Exception ex,Model model) {
		 System.out.println("Exception caught:\n\n\n\n" + ex.getMessage());
	        model.addAttribute("errorMsg", ex.getMessage());
	        return "error";
	    }

	@ExceptionHandler(NoHandlerFoundException.class)
    public String handle404() {
        return "404";
    }
}
