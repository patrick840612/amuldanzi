package com.amuldanzi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor
public class OrderItemsEntity {
	
	private Integer orderId;
    private Integer commerceId;
    private Integer count;
    private Integer price;
    private Integer cartId;
}
