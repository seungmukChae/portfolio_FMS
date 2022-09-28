package com.fms.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fms.order.dto.OrderDto;
import com.fms.order.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value="/orderEachProducts", method = RequestMethod.GET)
	public ModelAndView orderEachProducts(@RequestParam("productsId") String productsId, @RequestParam("orderProductsQty") int orderProductsQty, HttpServletRequest request)throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/order/orderEachProducts");
		
		HttpSession session = request.getSession();
		
		mv.addObject("orderer", orderService.getOrdererInfo((String)session.getAttribute("memberInfo")));
		mv.addObject("productsInfo", orderService.getProductsInfo(productsId));
		mv.addObject("orderProductsQty", orderProductsQty);
		
		return mv;
	}
	
	@RequestMapping(value="/payToOrderProducts" , method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Object> payToOrderProducts(OrderDto orderDto , HttpServletRequest request) throws Exception{
	    orderService.addNewOrder(orderDto);
		return new ResponseEntity<Object>(HttpStatus.OK);
	}
}
