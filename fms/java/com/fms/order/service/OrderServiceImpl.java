package com.fms.order.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fms.member.dto.MemberDto;
import com.fms.order.dao.OrderDao;
import com.fms.order.dto.OrderDto;
import com.fms.products.dto.ProductDto;
@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao orderDao;
	
	@Override
	public MemberDto getOrdererInfo(String memberId) throws Exception {
		// TODO Auto-generated method stub
		return orderDao.selectOrdererInfo(memberId);
	}

	@Override
	public ProductDto getProductsInfo(String productsId) throws Exception {
		// TODO Auto-generated method stub
		return orderDao.selectProductsInfo(productsId);
	}

	@Override
	public void addNewOrder(OrderDto orderDto) throws Exception {
		// TODO Auto-generated method stub
		orderDao.insertNewOrder(orderDto);
	}

}
