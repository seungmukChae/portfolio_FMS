package com.fms.admin.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fms.order.dto.OrderDto;

@Repository
public class AdminOrderDaoImpl implements AdminOrderDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<OrderDto> selectNewOrderList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper_admin_order.selectNewOrderList" );
	}

	@Override
	public void updateDeliveryState(Map<String, String> deliveryMap) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("mapper_admin_order.updateDeliveryState" , deliveryMap);
	}

	@Override
	public Map<String, Object> selectOrderDetail(int orderId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper_admin_order.selectOrderDetail" , orderId);
	}

}
