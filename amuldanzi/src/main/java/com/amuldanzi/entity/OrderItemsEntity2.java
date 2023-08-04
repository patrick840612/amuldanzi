package com.amuldanzi.entity;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor
public class OrderItemsEntity2 {
	
	private Integer count;
    private Integer price;
    private String trackingNumber;
    private Timestamp payDate;
    private String commerceName;
    private String img;
}
