package com.fms.products.dao;

import java.util.List;
import java.util.Map;

import com.fms.products.dto.ProductDto;

public interface ProductsDao {
	public List<ProductDto> selectProductList(String productsStatus) throws Exception;
	public ProductDto productsDetail(String productsId) throws Exception;
	public List<ProductDto> getSearchBoard(Map<String, Object> searchInfo) throws Exception;
}
