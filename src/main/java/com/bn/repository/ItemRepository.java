package com.bn.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bn.entity.Item;

public interface ItemRepository extends JpaRepository<Item, Long> {
	
	public Item findByItemName(String itemName);

}
