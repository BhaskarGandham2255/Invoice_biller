package com.bn.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "orders")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Orders {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long orderId;

    private String orderNumber;

    private String itemName;

    private Double price;

    private Long quantity;

    private Double subtotal;

    private Double gst;

    private Double grandTotal;

    private LocalDateTime orderDate;
}