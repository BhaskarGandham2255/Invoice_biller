package com.bn.service;

import java.util.List;

import com.bn.dto.AddItemRequestDTO;
import com.bn.dto.ItemWithCategoryDTO;
import com.bn.entity.Item;

public interface ItemService
{
	public List<ItemWithCategoryDTO> getAllItems();
	
	public void saveItem(AddItemRequestDTO item);

	public void deleteItem(Long itemId);
	
	public ItemWithCategoryDTO getItemById(Long itemId);
	
	public void updateItem(ItemWithCategoryDTO item);
	
	public Item findByName(String itemName);
}
