package com.bn.service;

import java.util.List;

import com.bn.dto.AddItemRequestDTO;
import com.bn.dto.ItemWithCategoryDTO;

public interface ItemService
{
	public List<ItemWithCategoryDTO> getAllItems();
	
	public void saveItem(AddItemRequestDTO item);

	public void deleteItem(Long itemId);
}
