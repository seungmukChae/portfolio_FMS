package com.fms.products.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fms.products.dao.ProductsDao;
import com.fms.products.dto.ProductDto;

@Service
public class ProductsServiceImpl implements ProductsService {

	@Autowired
	private ProductsDao productsDao;
	
	@Override
	public List<ProductDto> productsList(String productsStatus) throws Exception {
		// TODO Auto-generated method stub
		return productsDao.selectProductList(productsStatus);
	}

	@Override
	public ProductDto productsDetail(String productsId) throws Exception {
		// TODO Auto-generated method stub
		return productsDao.productsDetail(productsId);
	}

	@Override
	public List<ProductDto> getSearchBoard(Map<String, Object> searchInfo) throws Exception {
		// TODO Auto-generated method stub
		return productsDao.getSearchBoard(searchInfo);
	}


}
