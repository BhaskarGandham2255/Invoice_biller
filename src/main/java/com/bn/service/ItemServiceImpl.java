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
						item.getCategory().getCategoryName(),item.getCategory().getCategoryId());
				items.add(itemWithCategoryDTO);
			}
		}
		return items;
	}

	@Override
	public void saveItem(AddItemRequestDTO item) 
	{
		Optional<Category> byId = catRepo.findById(item.getCategoryId());
		itemRepo.save(new Item(null, item.getItemName(), item.getItemPrice(), item.getItemDescription(), (item.getAvailable() != null ? true : false), byId.get()));
	}

	@Override
	public void deleteItem(Long itemId) 
	{
		itemRepo.findById(itemId).orElseThrow(() -> new RuntimeException("Item not found with id: " + itemId));
		itemRepo.deleteById(itemId);
	}

	@Override
	public ItemWithCategoryDTO getItemById(Long itemId) {
		Optional<Item> byId = itemRepo.findById(itemId);
		if(byId.isPresent())
		{
			Item item = byId.get();
			return new ItemWithCategoryDTO(item.getItemId(), item.getItemName(),
					item.getPrice(), item.getDescription(), item.getAvailable(),
					item.getCategory().getCategoryName(),item.getCategory().getCategoryId());
		}
		else
		{
			throw new RuntimeException("Item not found with id: " + itemId);
		}
	}

	@Override
	public void updateItem(ItemWithCategoryDTO item) 
	{
		// getting the item from the database using the itemId from the DTO
		Item existingItem = itemRepo.findById(item.getItemId())
		        .orElseThrow(() -> new RuntimeException("Item not found with id: " + item.getItemId()));
		
		// getting the category from the database using the categoryId from the DTO
		Category category = catRepo.findById(item.getCategoryId())
		        .orElseThrow(() -> new RuntimeException("Category not found with id: " + item.getCategoryId()));

		// updating the existing item with the new values from the DTO
		existingItem.setItemName(item.getItemName());
		existingItem.setPrice(item.getPrice());
		existingItem.setDescription(item.getDescription());
		existingItem.setAvailable((item.getAvailable() != null ? true : false));
		existingItem.setCategory(category);
		
		itemRepo.save(existingItem);
	}


}
