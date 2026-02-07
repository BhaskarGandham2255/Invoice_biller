package com.bn.controller;

import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bn.dto.CategoryDTO;
import com.bn.entity.Category;
import com.bn.service.CategoryService;
import org.springframework.web.bind.annotation.RequestBody;



@Controller
@RequestMapping("/category")
public class CategoryController {
	@Autowired
	private CategoryService categorySer;

	@GetMapping("/categories")
	public String getAllCategories(Map<String, Object> model) 
	{
			Set<CategoryDTO> categories = categorySer.getAllCategory();
			model.put("categories", categories);
			return "category";
	}

	@GetMapping("/categoryUpdate")
	public String getCategoryForEdit(@RequestParam Long categoryId,Map<String, Object> model) 
	{
			Category category=categorySer.getCategoryById(categoryId);
			model.put("category", category);
			return "category-edit";
	}


	@PostMapping("/categoryUpdate")
	public String updateCategory(@ModelAttribute Category category,RedirectAttributes redirectAttributes) 
	{
			categorySer.updateCategory(category);
			redirectAttributes.addFlashAttribute("message", "Category updated successfully");
			return "redirect:/category/categories";
	}
	
	@GetMapping("/categoryDelete")
	public String deleteCategory(@RequestParam Long categoryId,RedirectAttributes redirectAttributes) 
	{
		categorySer.deleteCategory(categoryId);
		redirectAttributes.addFlashAttribute("message", "Category deleted successfully");
		return "redirect:/category/categories";
	}

	@GetMapping("/categoryAdd")
	public String addCategoryForm()
	{
		return "category-add";
	}

	@PostMapping("/categoryAdd")
	public String addCategory(@ModelAttribute Category category,RedirectAttributes redirectAttributes) 
	{
			categorySer.saveCategory(category);
			redirectAttributes.addFlashAttribute("message", "Category added successfully");
			return "redirect:/category/categories";
	}
	
	
}
