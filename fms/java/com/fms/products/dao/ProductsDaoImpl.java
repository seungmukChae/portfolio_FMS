package com.fms.products.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fms.products.dto.ProductDto;


@Repository
public class ProductsDaoImpl implements ProductsDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ProductDto> selectProductList(String productsStatus) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper_products.selectProductList", productsStatus);
	}

	@Override
	public ProductDto productsDetail(String productsId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper_products.selectProductsDetail", productsId);
	}

	@Override
	public List<ProductDto> getSearchBoard(Map<String, Object> searchInfo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper_products.getSearchBoard", searchInfo);
	}

}
