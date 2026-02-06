package com.bn.exception;

import java.util.Map;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler 
{
	 @ExceptionHandler(Exception.class)
	    public String handleException(Exception ex,Map<String, Object> model) {
	        model.put("errorMsg", ex.getMessage());
	        return "error";
	    }
}
