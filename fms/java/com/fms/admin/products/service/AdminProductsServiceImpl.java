package com.fms.admin.products.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fms.admin.products.dao.AdminProductsDao;
import com.fms.products.dto.ProductDto;
@Service
public class AdminProductsServiceImpl implements AdminProductsService {

	@Autowired
	private AdminProductsDao adminProductsDao;
	
	@Override
	public List<ProductDto> newProductsList() throws Exception {
		// TODO Auto-generated method stub
		return adminProductsDao.selectNewProductsList();
	}

	@Override
	public void addNewProducts(ProductDto productDto) throws Exception {
		adminProductsDao.insertNewProducts(productDto);
		
	}

	@Override
	public ProductDto productsDetail(String productsId) throws Exception {
		// TODO Auto-generated method stub
		return adminProductsDao.selectProductsDetail(productsId);
	}

	@Override
	public void modifyProductsInfo(Map<String, Object> productsMap) throws Exception {
		adminProductsDao.updateProductsInfo(productsMap);
		
	}



}
