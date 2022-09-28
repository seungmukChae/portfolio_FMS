package com.fms.products.service;

import java.util.List;
import java.util.Map;

import com.fms.products.dto.ProductDto;

public interface ProductsService {
	
	public List<ProductDto> productsList(String productsStatus) throws Exception;
	public ProductDto productsDetail(String productsId) throws Exception;
	public List<ProductDto> getSearchBoard(Map<String, Object> searchInfo) throws Exception;
}
