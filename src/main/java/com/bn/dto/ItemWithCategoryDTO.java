package com.bn.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ItemWithCategoryDTO {

    private Long itemId;
    private String itemName;
    private Double price;
    private String description;
    private Boolean available;
    private String categoryName;
}
