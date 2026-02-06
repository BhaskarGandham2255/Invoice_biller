package com.bn.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bn.dto.ItemWithCategoryDTO;
import com.bn.service.ItemService;

@Controller
@RequestMapping("/menu")
public class ItemController {
	@Autowired
	private ItemService iterSer;

	@GetMapping("/items")
	public String getAllItems(Map<String, Object> model) {
		List<ItemWithCategoryDTO> allItems = iterSer.getAllItems();
		model.put("items", allItems);
		allItems.forEach(i -> System.out.println(i));
		return "items";
	}

}
