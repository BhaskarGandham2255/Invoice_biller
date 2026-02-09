package com.bn.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class AddItemRequestDTO {
    private String itemName;
    private Double itemPrice;
    private String itemDescription;
    private Boolean available;
    private Long categoryId;
}
