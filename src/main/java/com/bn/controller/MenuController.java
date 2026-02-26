package com.bn.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bn.entity.Item;
import com.bn.service.MenuService;

@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@Autowired
	private MenuService menuSer;
	
	@RequestMapping({"/","/home"})
	public String loadHomePage(Map<String, Object> model) {
		List<Item> allItems = menuSer.getAllItems();
		model.put("items", allItems);
		return "index";
	}
}
