package com.bn.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class OrdersRequestDTO 
{
	private String itemName;
	private Long quantity;
	private Double price;
}
