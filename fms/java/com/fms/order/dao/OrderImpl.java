package com.fms.order.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fms.member.dto.MemberDto;
import com.fms.order.dto.OrderDto;
import com.fms.products.dto.ProductDto;
@Repository
public class OrderImpl implements OrderDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberDto selectOrdererInfo(String memberId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper_order.selectOrdererInfo", memberId);
	}

	@Override
	public ProductDto selectProductsInfo(String productsId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper_order.selectProductsInfo", productsId);
	}

	@Override
	public void insertNewOrder(OrderDto orderDto) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("mapper_order.insertNewOrder", orderDto);
	}

}
