package com.bn.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bn.dto.ItemWithCategoryDTO;
import com.bn.entity.Item;
import com.bn.repository.ItemRepository;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	private ItemRepository itemRepo;

	@Override
	public List<ItemWithCategoryDTO> getAllItems() {
		try {
			List<ItemWithCategoryDTO> items = new ArrayList<ItemWithCategoryDTO>();
			List<Item> allItems = itemRepo.findAll();
			if (allItems.size() > 0) {
				for (int i = 0; i < allItems.size(); i++) {
					Item item = allItems.get(i);
					ItemWithCategoryDTO itemWithCategoryDTO = new ItemWithCategoryDTO(item.getItemId(),
							item.getItemName(), item.getPrice(), item.getDescription(), item.getAvailable(),
							item.getCategory().getCategoryName());
					items.add(itemWithCategoryDTO);
				}
			}
			return items;

		} catch (Exception e) 
		{
			e.printStackTrace();
			throw e;
		}
	}

}
