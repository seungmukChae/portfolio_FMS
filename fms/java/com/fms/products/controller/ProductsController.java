package com.fms.products.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fms.admin.products.service.AdminProductsService;
import com.fms.products.service.ProductsService;

@Controller
@RequestMapping("/products")
public class ProductsController {
	
	@Autowired
	private ProductsService productsService;
	
	@Autowired
	private AdminProductsService adminProductsService;
	
	@RequestMapping(value="/productsDetail")
	public ModelAndView productsDetail(@RequestParam("productsId") String productsId)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/products/productsDetail");
		mv.addObject("products", productsService.productsDetail(productsId));
		return mv;
	}
	
	@RequestMapping(value="/productsCategory")
	public ModelAndView category(HttpServletRequest request)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/products/productsCategory");
		
		HttpSession session = request.getSession();
		session.setAttribute("sideMenu", "user");
		mv.addObject("category", adminProductsService.newProductsList());
		return mv;
	}
	
}
