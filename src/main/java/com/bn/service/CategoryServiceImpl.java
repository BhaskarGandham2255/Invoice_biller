package com.bn.service;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bn.dto.CategoryDTO;
import com.bn.repository.CategoryRepository;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryRepository categoryRepo;

	@Override
	public Set<CategoryDTO> getAllCategory() 
	{
		try{
			Set<CategoryDTO> categories = categoryRepo.findAllCategoryName();
			System.out.println("Categories retrieved: " + categories.size());
			return categories;
		}
		catch(Exception e)
		{
			throw e;
		}
	}

}
