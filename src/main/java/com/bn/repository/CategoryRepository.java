package com.bn.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bn.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Long> {

}
