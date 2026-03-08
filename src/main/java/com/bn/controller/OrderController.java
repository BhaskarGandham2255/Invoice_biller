package com.bn.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bn.dto.OrdersRequestDTO;
import com.bn.service.OrderService;

import jakarta.servlet.http.HttpSession;
import tools.jackson.core.type.TypeReference;
import tools.jackson.databind.ObjectMapper;

@RequestMapping("/order")
@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderSer;
	
	@PostMapping("/placeOrder")
	@ResponseBody
	public Map<String, Object> placeOrder(@RequestParam("orders") String ordersJson,
	                                       HttpSession session) throws Exception {

	    Map<String, Object> result = new HashMap<>();
	    try {
	        ObjectMapper mapper = new ObjectMapper();
	        List<OrdersRequestDTO> orderList = mapper.readValue(ordersJson,
	                                           new TypeReference<List<OrdersRequestDTO>>(){});

	        String orderNumber = orderSer.generateOrderNumber();
	        orderSer.saveOrder(orderList, orderNumber);

	        result.put("status",      "success");
	        result.put("orderNumber", orderNumber);
	        result.put("message",     "Order placed successfully");

	    } catch (Exception e) {
	        e.printStackTrace();
	        result.put("status",  "error");
	        result.put("message", e.getMessage());
	    }
	    
	    return result;
	}
}
