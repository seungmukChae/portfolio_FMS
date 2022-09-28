package com.fms.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fms.products.dto.ProductDto;
import com.fms.products.service.ProductsService;


@Controller
public class MainController {

	@Autowired
	private ProductsService productsService;
	
	@RequestMapping(value="/" , method=RequestMethod.GET)
	public ModelAndView home() throws Exception{
		return new ModelAndView("redirect:/main/main");
	}
	
	@RequestMapping(value="/main/main", method = RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/main/main");
		
		HttpSession session = request.getSession();
		session.setAttribute("sideMenu", "user");
		
		List<ProductDto> mainBanner = productsService.productsList("mainBanner");
		mv.addObject("mainBanner" , mainBanner);
		return mv;
	}
	
	@RequestMapping(value="search", method = RequestMethod.GET)
	public ModelAndView search(@RequestParam(name = "searchKeyword", defaultValue = "total") String searchKeyword,
							   @RequestParam(name = "searchWord", defaultValue = "")      String searchWord) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/products/productsCategory");
		
		Map<String, Object> searchInfo = new HashMap<String, Object>();
		searchInfo.put("searchKeyword", searchKeyword);
		searchInfo.put("searchWord", searchWord);
		List<ProductDto> search = productsService.getSearchBoard(searchInfo);
		mv.addObject("searchKeyword", searchKeyword);
		mv.addObject("searchWord", searchWord);
		mv.addObject("search", search);
		return mv;
	}
	
}
