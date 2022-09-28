package com.fms.admin.products.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fms.products.dto.ProductDto;
@Repository
public class AdminProductsDaoImpl implements AdminProductsDao {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<ProductDto> selectNewProductsList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper_admin_products.selectNewProductsList");
	}

	@Override
	public void insertNewProducts(ProductDto productDto) throws Exception {
		sqlSession.insert("mapper_admin_products.insertNewProducts", productDto);
		
	}

	@Override
	public ProductDto selectProductsDetail(String productsId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper_admin_products.selectProductsDetail", productsId);
	}

	@Override
	public void updateProductsInfo(Map<String, Object> productsMap) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("mapper_admin_products.updateProductsInfo", productsMap);
		
	}


}
