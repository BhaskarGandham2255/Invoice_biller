package com.bn.controller;

import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bn.dto.CategoryDTO;
import com.bn.entity.Category;
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

	@GetMapping("/categoryUpdate")
	public String getCategoryForEdit(@RequestParam Long categoryId,Map<String, Object> model) 
	{
		try{
			Category category=categorySer.getCategoryById(categoryId);
			model.put("category", category);
			return "category-edit";
		}catch(Exception e){
			e.printStackTrace();
			model.put("errorMsg", e.getMessage());
			return "error";
		}
	}


	@PostMapping("/categoryUpdate")
	public String updateCategory(@ModelAttribute Category category,Map<String, Object> model) 
	{
		try{
			System.out.println("Updating category: " + category);
			categorySer.updateCategory(category);
			return "redirect:/category/categories";
		}catch(Exception e){
			e.printStackTrace();
			model.put("errorMsg", e.getMessage());
			return "error";
		}
	}
	
}
