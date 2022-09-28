package com.fms.admin.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fms.admin.order.dao.AdminOrderDao;
import com.fms.order.dto.OrderDto;
@Service
public class AdminOrderServiceImpl implements AdminOrderService {
	
	@Autowired
	private AdminOrderDao adminOrderDao;
	
	@Override
	public List<OrderDto> listNewOrder() throws Exception {
		// TODO Auto-generated method stub
		return adminOrderDao.selectNewOrderList();
	}

	@Override
	public void modifyDeliveryState(Map<String, String> deliveryMap) throws Exception {
		// TODO Auto-generated method stub
		adminOrderDao.updateDeliveryState(deliveryMap);
	}

	@Override
	public Map<String, Object> orderDetail(int orderId) throws Exception {
		// TODO Auto-generated method stub
		return adminOrderDao.selectOrderDetail(orderId);
	}

}
