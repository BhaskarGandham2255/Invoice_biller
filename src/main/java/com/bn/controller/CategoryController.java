package com.bn.controller;

import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bn.dto.CategoryDTO;
import com.bn.service.CategoryService;


@Controller
@RequestMapping("/category")
public class CategoryController {
	@Autowired
	private CategoryService categorySer;

	@GetMapping("/categories")
	public String getAllCategories(Map<String, Object> model) 
	{
		try{
			Set<CategoryDTO> categories = categorySer.getAllCategory();
			model.put("categories", categories);
			return "category";
		}catch(Exception e){
			e.printStackTrace();
			model.put("errorMsg", e.getMessage());
			return "error";
		}
		
	}
	
}
