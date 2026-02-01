package com.bn.entity;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Item 
{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long itemId;
	
	private String itemName;
	
	private Double price;
	
	@Column(length = 500)
	private String description;
	
	@Column(nullable = false)
	private Boolean available = true;

	// Many menu items belong to one category
    @ManyToOne
    @JoinColumn(name = "category_id", referencedColumnName = "categoryId")
    private Category category;
	
}
