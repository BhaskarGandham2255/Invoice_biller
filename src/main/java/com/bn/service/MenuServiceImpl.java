package com.bn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bn.entity.Item;
import com.bn.repository.ItemRepository;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private ItemRepository itemRepo;

	@Override
	public List<Item> getAllItems() {
		List<Item> allItems = itemRepo.findAll();
		return allItems;
	}

}
