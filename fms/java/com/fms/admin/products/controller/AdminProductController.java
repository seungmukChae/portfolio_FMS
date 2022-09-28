package com.fms.admin.products.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fms.admin.products.service.AdminProductsService;
import com.fms.products.dto.ProductDto;

@Controller
@RequestMapping("/admin/products")
public class AdminProductController {

	//private static final String CURR_IMAGE_REPO_PATH = "C:\\file_repo";
	//String seperatorPath = "\\";	// window
	
	private static final String CURR_IMAGE_REPO_PATH = "/var/lib/tomcat8/file_repo";
	String seperatorPath = "/";		// linux
	
	@Autowired
	private AdminProductsService adminProductsService;
	
	@RequestMapping(value="/adminMain", method = RequestMethod.GET)
	public ModelAndView adminProductsMain(HttpServletRequest request)throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/products/adminMain");
		
		HttpSession session = request.getSession();
		session.setAttribute("sideMenu", "adminMode");
		
		mv.addObject("newProductsList", adminProductsService.newProductsList());
		
		return mv;
	}
	
	@RequestMapping(value="/addNewProducts", method = RequestMethod.GET)
	public String addNewProductsForm() {
		return "/admin/products/addNewProductsForm";
	}
	
	@RequestMapping(value="/addNewProducts", method = RequestMethod.POST)
	public ResponseEntity<String> addNewProducts(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		
		ProductDto productDto = new ProductDto();
		
		productDto.setProductsId(multipartRequest.getParameter("productsId"));
		productDto.setProductsName(multipartRequest.getParameter("productsName"));
		productDto.setProductsBrand(multipartRequest.getParameter("productsBrand"));
		productDto.setProductsStatus(multipartRequest.getParameter("productsStatus"));
		productDto.setProductsColor(multipartRequest.getParameter("productsColor"));
		int originalPrice = Integer.parseInt(multipartRequest.getParameter("originalPrice"));
		productDto.setOriginalPrice(originalPrice);
		int salePrice = Integer.parseInt(multipartRequest.getParameter("salePrice"));
		productDto.setSalePrice(salePrice);
		//int pageView = Integer.parseInt(multipartRequest.getParameter("pageView"));
		//productDto.setPageView(pageView);
		productDto.setPublishedDate(fm.parse(multipartRequest.getParameter("publishedDate")));
		int deliveryPrice = Integer.parseInt(multipartRequest.getParameter("deliveryPrice"));
		productDto.setDeliveryPrice(deliveryPrice);
		productDto.setProductsSort(multipartRequest.getParameter("productsSort"));
		productDto.setDeliveryMethod(multipartRequest.getParameter("deliveryMethod"));
		productDto.setDeliveryDate(fm.parse(multipartRequest.getParameter("deliveryDate")));
		productDto.setBrandIntro(multipartRequest.getParameter("brandIntro"));
		productDto.setProductsIntro(multipartRequest.getParameter("productsIntro"));
		//int reviewCnt = Integer.parseInt(multipartRequest.getParameter("reviewCnt"));
		//productDto.setReviewCnt(reviewCnt);
		productDto.setProductsSize(multipartRequest.getParameter("productsSize"));
		int productsPoint = Integer.parseInt(multipartRequest.getParameter("productsPoint"));
		productDto.setProductsPoint(productsPoint);
		
		Iterator<String> file = multipartRequest.getFileNames();
		String originalFileName = "";
		if (file.hasNext()) {
			
			MultipartFile uploadFile = multipartRequest.getFile(file.next()); 	
			
			if(!uploadFile.getOriginalFilename().isEmpty()) {
			
				File f = new File(CURR_IMAGE_REPO_PATH + seperatorPath + uploadFile.getOriginalFilename());	
				uploadFile.transferTo(f); 
				productDto.setProductsImage(uploadFile.getOriginalFilename());
			}
		
		}
	
		adminProductsService.addNewProducts(productDto);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		String message= "<script>";
			   message += "alert('성공적으로 등록되었습니다.');";
			   message +="location.href='" + multipartRequest.getContextPath() + "/admin/products/adminMain';";
			   message +="</script>";
		
	
		return new ResponseEntity<String>(message, responseHeaders, HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/modifyProductsForm", method = RequestMethod.GET)
	public ModelAndView modifyProductsForm(@RequestParam("productsId") String productsId) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/products/modifyProductsForm");
		mv.addObject("products", adminProductsService.productsDetail(productsId));
		return mv;
	}
	
	@RequestMapping(value="/modifyProductInfo", method = RequestMethod.POST)
	public ResponseEntity<String> modifyProductsInfo(@RequestParam("productsId") String productsId,
														@RequestParam("attribute") String attribute,
														@RequestParam("value") String value) throws Exception{
		
		Map<String, Object> productsMap = new HashMap<String, Object>();
		productsMap.put("productsId", productsId);
		productsMap.put(attribute, value);
		adminProductsService.modifyProductsInfo(productsMap);
		return new ResponseEntity<String>(HttpStatus.OK);
	}
	
	@RequestMapping(value="/modifyProductsImageInfo" , method=RequestMethod.POST)
	public ResponseEntity<String> modifyProductsImageInfo(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception {
		
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String originalFileName = "";
		Iterator<String> file = multipartRequest.getFileNames();
		if (file.hasNext()) {
			
			MultipartFile uploadFile = multipartRequest.getFile(file.next()); 	
			File f = new File(CURR_IMAGE_REPO_PATH + seperatorPath + uploadFile.getOriginalFilename());	
			uploadFile.transferTo(f); 

			originalFileName = uploadFile.getOriginalFilename();
		}
		Map<String,Object> productsMap = new HashMap<String,Object>();
		String productsId = multipartRequest.getParameter("productsId");
		productsMap.put("productsId" , productsId);
		productsMap.put("productsImage" , originalFileName);
		adminProductsService.modifyProductsInfo(productsMap);
		
		return new ResponseEntity<String>(HttpStatus.OK);
		
	}
	
}
	

