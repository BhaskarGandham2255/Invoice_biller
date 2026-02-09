package com.bn.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bn.dto.AddItemRequestDTO;
import com.bn.dto.ItemWithCategoryDTO;
import com.bn.entity.Category;
import com.bn.entity.Item;
import com.bn.repository.CategoryRepository;
import com.bn.repository.ItemRepository;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	private ItemRepository itemRepo;
	
	@Autowired
	private CategoryRepository catRepo;

	@Override
	public List<ItemWithCategoryDTO> getAllItems() {
		List<ItemWithCategoryDTO> items = new ArrayList<ItemWithCategoryDTO>();
		List<Item> allItems = itemRepo.findAll();
		if (allItems.size() > 0) {
			for (int i = 0; i < allItems.size(); i++) {
				Item item = allItems.get(i);
				ItemWithCategoryDTO itemWithCategoryDTO = new ItemWithCategoryDTO(item.getItemId(), item.getItemName(),
						item.getPrice(), item.getDescription(), item.getAvailable(),
						item.getCategory().getCategoryName());
				items.add(itemWithCategoryDTO);
			}
		}
		return items;
	}

	@Override
	public void saveItem(AddItemRequestDTO item) 
	{
		Optional<Category> byId = catRepo.findById(item.getCategoryId());
		itemRepo.save(new Item(null, item.getItemName(), item.getItemPrice(), item.getItemDescription(), item.getAvailable(), byId.get()));
	}

}
