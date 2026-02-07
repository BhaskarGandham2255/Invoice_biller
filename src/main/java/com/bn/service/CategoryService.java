package com.bn.service;

import java.util.Set;

import com.bn.dto.CategoryDTO;
import com.bn.entity.Category;

public interface CategoryService
{
	public Set<CategoryDTO> getAllCategory();

	public Category getCategoryById(Long categoryId);

	public void updateCategory(Category category);
	
	public void deleteCategory(Long categoryId);

	public void saveCategory(Category category);
}
