package com.bn.service;

import com.bn.dto.OrdersRequestDTO;
import com.bn.entity.Orders;
import com.bn.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderRepository orderRepo;

    @PersistenceContext
    private EntityManager entityManager;

    public String generateOrderNumber() {
        Long seqVal = ((Number) entityManager
                .createNativeQuery("SELECT COUNT(*)+1 FROM ORDERS")
                .getSingleResult())
                .longValue();
        return "ORD-" + String.format("%09d", seqVal);
    }

    @Transactional
    public void saveOrder(List<OrdersRequestDTO> items, String orderNumber) {

        double subtotal = 0;
        for (OrdersRequestDTO o : items) {
            subtotal += o.getPrice() * o.getQuantity();
        }
        double gst   = subtotal * 0.05;
        double grand = subtotal + gst;

        List<Orders> orders = new ArrayList<>();

        for (OrdersRequestDTO item : items) {
            Orders order = new Orders();
            order.setOrderNumber(orderNumber);
            order.setItemName(item.getItemName());
            order.setPrice(item.getPrice());
            order.setQuantity(item.getQuantity());
            order.setSubtotal(item.getPrice() * item.getQuantity());
            order.setGst(gst);
            order.setGrandTotal(grand);
            order.setOrderDate(LocalDateTime.now());
            orders.add(order);
        }

        orderRepo.saveAll(orders);
    }
}