package com.bn.repository;

import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.bn.dto.CategoryDTO;
import com.bn.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Long>
{
    @Query("select c.categoryName from Category c order by c.categoryName")
    public Set<CategoryDTO> findAllCategoryName();
    
    public Category findByCategoryName(String categoryName);
}
