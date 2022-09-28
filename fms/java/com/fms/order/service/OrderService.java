package com.fms.order.service;

import com.fms.member.dto.MemberDto;
import com.fms.order.dto.OrderDto;
import com.fms.products.dto.ProductDto;

public interface OrderService {
	
	public MemberDto getOrdererInfo(String memberId) throws Exception;
	public ProductDto getProductsInfo(String productsId) throws Exception;
	public void addNewOrder(OrderDto orderDto) throws Exception;
}
