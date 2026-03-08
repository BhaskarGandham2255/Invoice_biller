package com.bn.service;

import java.util.List;

import com.bn.dto.OrdersRequestDTO;

public interface OrderService {
	
	public String generateOrderNumber();
	
	public void saveOrder(List<OrdersRequestDTO> items, String orderNumber); 

}
