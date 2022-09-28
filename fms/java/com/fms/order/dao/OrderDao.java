package com.fms.order.dao;

import com.fms.member.dto.MemberDto;
import com.fms.order.dto.OrderDto;
import com.fms.products.dto.ProductDto;

public interface OrderDao {
	
	public MemberDto selectOrdererInfo(String memberId) throws Exception;
	public ProductDto selectProductsInfo(String productsId) throws Exception;
	public void insertNewOrder(OrderDto orderDto) throws Exception;
}
