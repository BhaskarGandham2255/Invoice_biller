	package com.bn.service;
	
	import java.util.List;
	import java.util.Optional;
	import java.util.Set;
	import java.util.stream.Collectors;
	
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Service;
	
	import com.bn.dto.CategoryDTO;
	import com.bn.entity.Category;
	import com.bn.repository.CategoryRepository;
	
	@Service
	public class CategoryServiceImpl implements CategoryService {
	
		@Autowired
		private CategoryRepository categoryRepo;
	
		@Override
		public Set<CategoryDTO> getAllCategory() 
		{
				List<Category> categories = categoryRepo.findAll();
	
				Set<CategoryDTO> categoryDTOs = categories.stream()
						.map(cat -> new CategoryDTO(cat.getCategoryId(), cat.getCategoryName()))
						.collect(Collectors.toSet());
	
//				System.out.println("Categories retrieved: " + categories.size());
				return categoryDTOs;
		}
	
		@Override
		public Category getCategoryById(Long categoryId) {
				Category category=null;
				 Optional<Category> categoryOptional = categoryRepo.findById(categoryId);
				 if (categoryOptional.isPresent()) {
					category= categoryOptional.get();
				 }
				return category;
		}
	
		@Override
		public void updateCategory(Category category) 
		{
				String categoryName = category.getCategoryName();
				Optional<Category> CategoryOptional = categoryRepo.findById(category.getCategoryId());
				if(CategoryOptional.isPresent())
				{
					Category existingCategory = CategoryOptional.get();
					existingCategory.setCategoryName(categoryName);
					categoryRepo.save(existingCategory);
				}
				else {
					throw new RuntimeException("Category not found with id: " + category.getCategoryId());
				}
		}

		@Override
		public void deleteCategory(Long categoryId) 
		{
				Optional<Category> byId = categoryRepo.findById(categoryId);
				if(byId.isPresent())
				{
					categoryRepo.deleteById(categoryId);
				}
				else {
					throw new RuntimeException("Category not found with id: " + categoryId);
				}
		}
	
	}
