package com.fms.admin.products.dao;

import java.util.List;
import java.util.Map;

import com.fms.products.dto.ProductDto;

public interface AdminProductsDao {

	public List<ProductDto>selectNewProductsList() throws Exception;
	public void insertNewProducts(ProductDto productDto) throws Exception;
	public ProductDto selectProductsDetail(String productsId) throws Exception;
	public void updateProductsInfo (Map<String, Object> productsMap) throws Exception;
}
