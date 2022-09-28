package com.fms.admin.products.service;

import java.util.List;
import java.util.Map;

import com.fms.products.dto.ProductDto;

public interface AdminProductsService {

	public List<ProductDto> newProductsList() throws Exception;
	public void addNewProducts(ProductDto productDto) throws Exception;
	public ProductDto productsDetail(String productsId) throws Exception;
	public void modifyProductsInfo(Map<String, Object> productsMap) throws Exception;
}