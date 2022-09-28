<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	
	function fn_order_each_products(productsId){
		
		var isLogOn = document.getElementById("isLogOn").value;
		var orderProductsQty = document.getElementById("orderProductsQty").value;
		
		if (isLogOn == "" || isLogOn == "false") {
			alert("로그인 후 주문이 가능합니다.");
			location.href = "${contextPath}/member/loginForm";
			return;
		} 
		
		location.href = "${contextPath}/order/orderEachProducts?productsId=" + productsId + "&orderProductsQty=" + orderProductsQty;
		
	}	

</script>
</head>
<body>
	
				<!-- PRODUCT -->
			<div class="section pt-5">
				<div class="container">

					<!-- breadcrumb -->
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb small">
							<li class="breadcrumb-item"><a class="link-muted" href="${contextPath }/main/main">Home</a></li>
							<li class="breadcrumb-item"><a class="link-muted" href="#">${products.productsSort }</a></li>
						</ol>
					</nav>
					<!-- /breadcrumb -->
					<h2></h2>
					<h1 class="h2 fw-bold mb-5">
						${products.productsName }
					</h1>

					<div class="row">

						<!-- images -->
						<div class="col-lg-7 order-1 mb-5">


							<div class="row g-0">

								<!--	

									IMPORTANT NOTE!
									All images below are using .bg-suprime class, that remove white background!

									The first image (most important), looks more "luxury" because of 
									.bg-suprime + combinations of background and slightly "shiny" effect

									In our real ecommerce tests (5-10K visits/day), this converted 
									the best (up to +10%).

									Important note: images should be "ecommerce standard" - meaning: white background!
									The look might be completely different, a lot more "refined", but in fact nothing
									changed to images. Only CSS tricks!

								-->
								<div class="col-12 position-relative z-index-2">
									<a href="${contextPath}/thumbnails?productsImage=${products.productsImage}" data-photoswipe="product-images-group" class="photoswipe d-block m-1">
										<div class="clearfix text-center bg-light bg-gradient-radial-light rounded position-relative">
											<div class="thumbnail-shadow-drop">

												<div class="overflow-hidden position-relative">
													<div class="animate-shine"> 
														
														<img src="${contextPath}/thumbnails?productsImage=${products.productsImage}" alt="..." class="img-fluid max-h-500 max-h-300-xs bg-suprime my-5 mx-4 opacity-9 animate-bounceinup"> 

													</div>
												</div>

											</div>
										</div>
									</a>

								</div>
								<!-- 
								<div class="col-12 col-12 col-md-6 d-none d-lg-block">
									<a href="demo.files/images/unsplash/products/smartwatch_2.jpg" data-photoswipe="product-images-group" class="d-block m-1 bg-light bg-gradient-radial-light text-center photoswipe">
										<img class="img-fluid bg-suprime" src="demo.files/images/unsplash/products/thumb_330/smartwatch_2.jpg" alt="...">
									</a>
								</div>

								<div class="col-12 col-12 col-md-6 d-none d-lg-block">
									<a href="demo.files/images/unsplash/products/smartwatch_1.jpg" data-photoswipe="product-images-group" class="d-block m-1 bg-light bg-gradient-radial-light text-center photoswipe">
										<img class="img-fluid bg-suprime" src="demo.files/images/unsplash/products/thumb_330/smartwatch_1.jpg" alt="...">
									</a>
								</div>
								 -->
								<!-- mobile "view more" indicator -->
								<div class="col-12 d-block d-lg-none pt-4">
									
									<div class="position-relative bg-light clearfix text-center p-3 text-gray-500">
										<i class="arrow arrow-lg arrow-top arrow-center border-light"></i>
										
										<span class="text-gray-500">
											click and slide, for more
										</span>

									</div>

								</div>
								<!-- /mobile "view more" indicator -->

							</div>
							<!-- /IMAGES -->

						</div>

						<!-- options -->
						<div class="col-lg-5 order-2 mb-5">

							<div class="sticky-top z-index-0" style="top:1.2rem"><!-- sticky on scroll -->
							
								<form novalidate class="bs-validate" method="post" action="#" data-error-scroll-up="true">


			            <!-- price -->
			            <div class="mb-4">
			              <p class="mb-0 text-muted text-uppercase">ProductId : ${products.productsId }</p>
			              <h3 class="mb-0 d-inline-grid gap-auto-3">
			                <del class="fw-normal text-muted"><fmt:formatNumber value="${products.originalPrice}" type="number" var="originalPrice" /> ${originalPrice}원</del>
			                <span class="fw-bold text-indigo"><fmt:formatNumber value="${products.salePrice}" type="number" var="salePrice" /> ${salePrice}원</span>
			              </h3>
			            </div>
						
						<!-- option(색상/사이즈) -->
						<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      						<div class="accordion-body">
        						<strong>색상 : </strong> ${products.productsColor }
      						</div>
  						</div>
  						
  						<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      						<div class="accordion-body">
        						<strong>사이즈 : </strong>
        						<c:choose>
        							<c:when test="${not empty products.productsSize }">
        								${products.productsSize }
        							</c:when>
        						</c:choose>
      						</div>
  						</div>
						<!-- /option(색상/사이즈) -->
						
						
			            <!-- shipping/return -->
			            <div class="accordion border border-light bg-white rounded mb-4" id="accordion-product">
			            	
			            	<!-- shipping -->
			              <div class="accordion-item shadow-none border-0">
			                <h2 class="accordion-header" id="accordion-product-1">
			                  <button class="accordion-button collapsed border-0" type="button" data-bs-toggle="collapse" data-bs-target="#accordion-product-collapse-1" aria-expanded="false" aria-controls="accordion-product-collapse-1">
			                    <svg class="text-gray-500" width="2.3rem" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 612 612" fill="currentColor">
			                      <path d="M612 338.19v55.625c0 13.877-11.249 25.125-25.126 25.125h-26.885c-4.857-33.332-33.585-58.961-68.259-58.961-34.59 0-63.317 25.629-68.175 58.961h-228.393c-4.857-33.332-33.585-58.961-68.175-58.961s-63.318 25.629-68.175 58.961h-33.669c-13.876 0-25.125-11.248-25.125-25.125v-55.625h611.982zm-438.933-134.232h-14.313l-5.259 27.155h13.945c9.292 0 16.996-6.363 16.996-17.004 0-6.478-4.277-10.151-11.369-10.151zm370.825 224.949c0 28.729-23.367 52.094-52.095 52.094-28.811 0-52.178-23.367-52.178-52.094 0-28.811 23.367-52.178 52.178-52.178 28.727 0 52.095 23.368 52.095 52.178zm-26.047 0c0-14.404-11.726-26.047-26.047-26.047-14.405 0-26.048 11.643-26.048 26.047 0 14.322 11.643 26.049 26.048 26.049 14.321 0 26.047-11.727 26.047-26.049zm-338.782 0c0 28.729-23.283 52.094-52.094 52.094s-52.094-23.367-52.094-52.094c0-28.811 23.284-52.178 52.094-52.178s52.094 23.368 52.094 52.178zm-26.046 0c0-14.404-11.642-26.047-26.046-26.047-14.406 0-26.047 11.643-26.047 26.047 0 14.322 11.642 26.049 26.047 26.049 14.404 0 26.046-11.727 26.046-26.049zm458.965-104.605h-611.982v-168.177c0-13.903 11.307-25.125 25.125-25.125h379.736c13.903 0 25.126 11.223 25.126 25.125v18.678h49.833c8.794 0 17.253 3.518 23.534 9.715l98.745 97.656c6.281 6.282 9.883 14.824 9.883 23.786v18.342zm-522.798-95.757l4.646-24.586h34.245l2.568-13.577h-49.777l-16.881 86.837h15.655l6.854-35.104h28.863l2.568-13.569h-28.741zm91.588 12.104v-.246c13.086-4.278 19.81-17.118 19.81-28.986 0-8.923-4.4-15.655-11.745-18.837-3.541-1.586-7.828-2.2-12.473-2.2h-30.696l-16.874 86.836h15.769l6.241-32.413h15.655l11.009 32.413h16.874l-11.614-32.168c-1.105-3.172-1.956-4.399-1.956-4.399zm96.341-50.268h-51.854l-16.996 86.837h53.932l2.568-13.577h-38.155l4.523-23.359h29.231l2.691-13.577h-29.231l4.4-22.746h36.201l2.69-13.578zm70.061 0h-51.855l-16.996 86.837h53.933l2.567-13.577h-38.155l4.523-23.359h29.231l2.691-13.577h-29.232l4.401-22.746h36.2l2.692-13.578zm214.557 88.274l-77.305-73.787c-.754-.669-1.759-1.088-2.764-1.088h-18.174c-2.178 0-3.937 1.759-3.937 3.937v73.787c0 2.178 1.759 3.936 3.937 3.936h95.562c3.518-.001 5.277-4.356 2.681-6.785z"></path>
			                    </svg>
			                    <span class="d-inline-block px-3"> 배송비 : 
			                    	<c:choose>
										<c:when test="${products.salePrice >= 19800}">
										<td class="fixed"><strong>무료</strong></td>
									</c:when>
									<c:otherwise>
										<td class="fixed"><strong>${products.deliveryPrice}원</strong></td>
									</c:otherwise>
									</c:choose>
			                    </span>
			                  </button>
			                </h2>
			                <div id="accordion-product-collapse-1" class="accordion-collapse collapse border-0" aria-labelledby="accordion-product-1" data-bs-parent="#accordion-product">
			                  <p class="accordion-body mb-0 py-3">
			                    19,800원 이상 구매시 무료배송
			                  </p>
			                </div>
			              </div>
			              <!-- /shipping -->
			              
			              <hr class="my-0 bg-gray-300">
			              
			              <!-- return -->
			              
			              <!-- /return -->

			            </div>


						<!-- 장바구니 -->
						<div class="py-3 d-lg-flex">

							<div class="w-100 d-flex mb-2 mb-lg-0">
						<!-- quantity -->
				              <input required type="number" value="1" min="1" max="9999" id="orderProductsQty" class="flex-none form-control form-control-lg w-auto text-center float-start mx-0">
				              
				              <!-- add to cart button -->
				              <div class="d-grid w-100 mx-2">
				              <a class="buy" href="javascript:fn_order_each_products('${products.productsId }')">
				                <input type="button" class="btn btn-lg btn-primary flex-none" id="btnClickPurchase" value="구매하기"/>
				              </a>
				              </div>
			              </div>

			            </div>
			            <!-- /add to cart -->
			            
			            <!-- 구매하기 -->
						

			            <!-- help -->
									<div class="py-3 text-end">
			              <p class="d-inline-grid gap-auto-3">
			                <span class="text-gray-600">
			                  <a href="#!" class="link-secondary text-dashed">도움이 필요하신가요? </a>
			                </span>
			                <svg class="text-gray-500" height="28px" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512.052 512.052" fill="currentColor">
			                  <path d="M208.026,16.026c-114.7,0-208,78.9-208,176c0,39.8,15.7,77.9,44.5,108.9l-39.8,39.8c-4.6,4.6-6,11.5-3.5,17.4c2.5,6,8.3,9.9,14.8,9.9h192c114.7,0,208-78.9,208-176S322.726,16.026,208.026,16.026z"></path>
			                  <path opacity="0.5" d="M467.526,428.926c28.8-30.9,44.5-69.1,44.5-108.9c0-49.8-24.6-94.9-64-126.9c-0.9,114.1-108.2,206.9-240,206.9h-89.2c34.5,56.9,104.6,96,185.2,96h192c6.5,0,12.3-3.9,14.8-9.9c2.5-6,1.1-12.9-3.5-17.4L467.526,428.926z"></path>
			                  <path fill="#ffffff" d="M304.026,144.026h-192c-8.8,0-16,7.2-16,16s7.2,16,16,16h192c8.8,0,16-7.2,16-16S312.826,144.026,304.026,144.026z"></path>
			                  <path fill="#ffffff" d="M240.026,208.026h-128c-8.8,0-16,7.2-16,16s7.2,16,16,16h128c8.8,0,16-7.2,16-16S248.826,208.026,240.026,208.026z"></path>
			                </svg>
			              </p>
			            </div>
			            <!-- /help -->

						


								</form>

							</div>

						</div>

					</div>


				</div>
			</div>
			<!-- /PRODUCT -->
			
			<div class="section">
				<div class="container">
					<h2 class="fw-bold mb-4">브랜드</h2>
					<p>${products.brandIntro }</p>
				</div>
			</div>
			
			<!-- DESCRIPTION + SEPCIFICATIONS -->
			<div class="section">
				<div class="container">

					<div class="row g-4 g-xl-5">

						<div class="col-lg-6 mb-5">

							<h2 class="fw-bold mb-4">
								상품상세
							</h2>

							<!--
								.article-format class will add some slightly formattings for a good text visuals. 
								This is because most editors are not ready formatted for bootstrap
								The content should come inside this container, as it is from database!
								src/scss/_core/base/_typography.scss
							-->
							<div class="article-format">
								<p>${products.productsIntro }</p>
							</div>

							<!-- last update info -->
							<div class="fs-6 fw-light mt-1 text-muted"> 
							
							</div>

						</div>
						
						


						<div class="col-lg-6 mb-5">


							<h2 class="fw-bold mb-4">
								필수 표기정보
							</h2>

							<div class="table-responsive">


								<h3 class="h5">
									Video
								</h3>

								<table class="table table-striped">
									<tbody>

										<tr>
											<td class="text-muted w-50">Display Type</td>
											<td>Flat LCD 55"</td>
										</tr>

										<tr>
											<td class="text-muted w-50">Resolution</td>
											<td>
												1200 x 450 <br> 
												1366 x 768 <br> 
												1920 x 768
											</td>
										</tr>

									</tbody>
								</table>





								<h3 class="h5">
									Connectors
								</h3>

								<table class="table table-striped">
									<tbody>

										<tr>
											<td class="text-muted w-50">Network Connector</td>
											<td>No</td>
										</tr>

										<tr>
											<td class="text-muted w-50">USB</td>
											<td>1</td>
										</tr>

										<tr>
											<td class="text-muted w-50">HDMI</td>
											<td>&ndash;</td>
										</tr>

										<tr>
											<td class="text-muted w-50">PCMCIA</td>
											<td>1</td>
										</tr>

									</tbody>
								</table>


							</div>


							<p class="m-0">
								
								<!-- brand logo -->
								
								<span class="d-inline-block px-2"> 
									<a href="#" class="small d-flex align-items-center">
										<img class="float-start" height="50" src="${contextPath }/resources/html_frontend/demo.files/svg/brands/hms.svg" alt="...">
										<span>More by HMS</span>
									</a>
								</span>
							</p>

						</div>

					</div>

				</div>
			</div>
			<!-- /DESCRIPTION + SEPCIFICATIONS -->


</body>
</html>
<input type="hidden" name="isLogOn" id="isLogOn" value="${isLogOn}">