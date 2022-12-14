package com.fms.admin.order.service;

import java.util.List;
import java.util.Map;

import com.fms.order.dto.OrderDto;

public interface AdminOrderService {
	public List<OrderDto>listNewOrder() throws Exception;
	public void  modifyDeliveryState(Map<String, String> deliveryMap) throws Exception;
	public Map<String,Object> orderDetail(int orderId) throws Exception;
}
