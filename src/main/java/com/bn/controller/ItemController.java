package com.bn.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bn.dto.AddItemRequestDTO;
import com.bn.dto.ItemWithCategoryDTO;
import com.bn.exception.GlobalExceptionHandler;
import com.bn.service.CategoryService;
import com.bn.service.ItemService;

@Controller
@RequestMapping("/item")
public class ItemController {

	@Autowired
	private ItemService itemSer;
	
	@Autowired
	private CategoryService catSer;

	@GetMapping("/items")
	public String getAllItems(Map<String, Object> model) {
		List<ItemWithCategoryDTO> allItems = itemSer.getAllItems();
		model.put("items", allItems);
		allItems.forEach(i -> System.out.println(i));
		return "items";
	}
	
	@GetMapping("/addItem")
	public String addItemForm(Map<String, Object> model)
	{
		model.put("categories", catSer.getAllCategory());
		return "add-item";
	}
	
	@PostMapping("/addItem")
	public String addItem(@ModelAttribute AddItemRequestDTO item,RedirectAttributes redirectAttributes)
	{
	   	itemSer.saveItem(item); 
	   	redirectAttributes.addFlashAttribute("message", "Item added successfully!");
	    return "redirect:/item/items";
	}

	@GetMapping("/deleteItem")
	public String deleteItem(@RequestParam Long itemId, RedirectAttributes redirectAttributes)
	{
	    itemSer.deleteItem(itemId);
	    redirectAttributes.addFlashAttribute("message", "Item deleted successfully!");
		return "redirect:/item/items";
	}

}
