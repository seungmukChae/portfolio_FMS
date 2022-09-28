<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$().ready(function(){
		$("#getSearchBoard").click(function(){
			
			var searchKeyword    = $("#searchKeyword").val();
			var searchWord       = $("#searchWord").val();
			
			var url = "${contextPath}/products/productsCategory?";
				url += "&searchKeyword=" + searchKeyword;
				url += "&searchWord=" + searchWord;
			
				location.href=url;
		});

	});

</script>
</head>
<body>

	  <header id="header" class="shadow-xs">

        <!-- TOP BAR -->
        <div id="top_bar" class="bg-light"> <!-- optional if body.header-sticky is present: add .js-ignore class to ignore autohide and stay visible all the time -->
          <div class="container">

            <div class="text-nowrap"><!-- change with .scrollable-horizontal to horizontally scroll, if -only- no dropdown is present -->
              <div class="d-flex justify-content-between">

                <div class="d-inline-block float-start">
                  <ul class="list-inline m-0">
                  </ul>
                </div>


                <div class="d-inline-block float-end">

                  <ul class="list-inline m-0">

                    <li class="dropdown list-inline-item">

                      <a href="tel:+82-010-8545-5003" class="p-2 d-inline-block fw-medium">
                        <i class="float-start fi fi-phone"></i> 고객센터
                      </a>
                    </li>  
                    <li class="dropdown list-inline-item">
                      <a>
                      	<i class="float-start fi fi-send"></i>배송안내
                      </a>

                    

                  </ul>

                </div>

              </div>
            </div>

          </div>
        </div>
        <!-- /TOP BAR -->

        <!-- Navbar -->
        <div class="container position-relative">

          <nav class="navbar navbar-expand-lg navbar-light justify-content-lg-between justify-content-md-inherit">

            <div class="align-items-start">

              <!-- mobile menu button : show -->
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMainNav" aria-controls="navbarMainNav" aria-expanded="false" aria-label="Toggle navigation">
                <svg width="25" viewBox="0 0 20 20">
                  <path d="M 19.9876 1.998 L -0.0108 1.998 L -0.0108 -0.0019 L 19.9876 -0.0019 L 19.9876 1.998 Z"></path>
                  <path d="M 19.9876 7.9979 L -0.0108 7.9979 L -0.0108 5.9979 L 19.9876 5.9979 L 19.9876 7.9979 Z"></path>
                  <path d="M 19.9876 13.9977 L -0.0108 13.9977 L -0.0108 11.9978 L 19.9876 11.9978 L 19.9876 13.9977 Z"></path>
                  <path d="M 19.9876 19.9976 L -0.0108 19.9976 L -0.0108 17.9976 L 19.9876 17.9976 L 19.9876 19.9976 Z"></path>
                </svg>
              </button>

              <!-- 
                Logo : height: 70px max
              -->
              <a class="navbar-brand m-0" href="${contextPath }/main/main">
                <img src="${contextPath }/resources/images/fms_logo.png" width="120" height="40" alt="...">
              </a>

            </div>


            <!-- 

              [SOW] SEARCH SUGGEST PLUGIN
              ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++
              PLEASE READ DOCUMENTATION
              documentation/plugins-sow-search-suggest.html
              ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++

            -->
            
            <table>
            <tr>
			<td colspan="5" align="center">	
				<select id="searchKeyword" class="form-control" style="width: 150px; display: inline;">
						<option <c:if test="${searchKeyword eq 'total'}"> selected</c:if> value="total">total</option>
						<option <c:if test="${searchKeyword eq 'productsName'}"> selected</c:if> value="productsName">상품명</option>
						<option <c:if test="${searchKeyword eq 'productsBrand'}"> selected</c:if> value="productsBrand">브랜드</option>
				</select>
			<input type="text" style="width: 300px; display: inline;" class="form-control" id="searchWord" name="searchWord" value="${searchWord}" >
			<input type="button" class="btn btn-outline-secondary" value="Search" id="getSearchBoard">
			</td>
			</tr>
			</table>



            <!-- OPTIONS -->
            <ul class="list-inline list-unstyled mb-0 d-flex align-items-end">

              <!-- mobile : search toggler -->
              <li class="list-inline-item mx-1 dropdown d-inline-block d-lg-none">

                <a href="#" aria-label="Search" data-bs-toggle="dropdown" aria-expanded="false" aria-haspopup="true" class="btn-sow-search-toggler d-inline-block text-center text-dark">
                  <i class="fi fi-search fs-5"></i>
                  <span class="d-block small">search</span>
                </a>

              </li>

              <!-- Login -->
				<c:choose>
				<c:when test="${isLogOn == true and memberInfo == 'admin' }">  
				   <li>
				   <a href="${contextPath}/admin/products/adminMain" aria-label="Login" id="dropdownAccountOptions" aria-expanded="false" aria-haspopup="true" class="d-inline-block text-center text-dark">
				   		<i class="fi fi-folder-full fs-4"></i>
				   		<span class="d-block small">관리자화면</span>
				   </a>
				   &emsp;
				   <a href="${contextPath}/member/logout" aria-label="Login" id="dropdownAccountOptions" aria-expanded="false" aria-haspopup="true" class="d-inline-block text-center text-dark">
				   		<i class="fi fi-users fs-4"></i>
				   		<span class="d-block small">로그아웃</span>
				   </a>
				   
				   
				   </li>
				</c:when>
			     <c:when test="${isLogOn == true and not empty memberInfo }">
				   <li>
				   <a href="${contextPath}/member/logout" aria-label="Login" id="dropdownAccountOptions" aria-expanded="false" aria-haspopup="true" class="d-inline-block text-center text-dark">
				   		<i class="fi fi-users fs-4"></i>
				   		<span class="d-block small">로그아웃</span>
				   </a>
				   <a href="account-favourites.html" aria-label="My Favourites" class="d-inline-block text-center text-dark">
                  		<i class="fi fi-heart-empty fs-4"></i>
                 	 	<span class="d-block small">찜목록</span>
                	</a>
                	<a href="#" aria-label="My Cart" data-bs-toggle="dropdown" aria-expanded="false" aria-haspopup="true" class="d-inline-block text-center text-dark">
                  		<i class="fi fi-cart-1 fs-4"></i>
                 		<span class="d-block small">장바구니</span>
                	</a>
				   
				   </li>
				 </c:when>
				 <c:otherwise>
 	             <li class="list-inline-item mx-1 dropdown">
	                <a href="${contextPath}/member/loginForm" aria-label="Login" id="dropdownAccountOptions" aria-expanded="false" aria-haspopup="true" class="d-inline-block text-center text-dark">
	                  <i class="fi fi-users fs-4"></i>
	                  <span class="d-block small">로그인</span>
	                </a>
	                 <a href="account-favourites.html" aria-label="My Favourites" class="d-inline-block text-center text-dark">
                  		<i class="fi fi-heart-empty fs-4"></i>
                 	 	<span class="d-block small">찜목록</span>
                	</a>
                	<a href="#" aria-label="My Cart" data-bs-toggle="dropdown" aria-expanded="false" aria-haspopup="true" class="d-inline-block text-center text-dark">
                  		<i class="fi fi-cart-1 fs-4"></i>
                 		<span class="d-block small">장바구니</span>
                	</a>
	              </li>
				 </c:otherwise>
				</c:choose>


              <!-- favourites button : visible : desktop only -->
              <li class="list-inline-item mx-1 dropdown d-none d-sm-block">

               

              </li>


              <!-- cart -->
              <li class="list-inline-item mx-1 dropdown">
                
                

                <!-- dropdown -->
                <div aria-labelledby="dropdownAccount" id="dropdownAccount" class="dropdown-menu dropdown-menu-clean dropdown-menu-invert dropdown-click-ignore mt-2 p-0 rounded-xl" style="width:300px"> 
                  <div class="dropdown-header p-3 fw-medium">Cart Products</div> 

                  <!--
                  <div class="py-5 text-center bg-light">
                    Your cart is empty!
                  </div>
                  -->


                  <!-- item list -->
                  <div class="max-vh-50 scrollable-vertical">

                    <!-- item -->
                    <div class="p-3 border-top border-light">

                      <!-- image -->
                      <div class="ratio ratio-1x1 float-start mt-1 bg-cover" 
                        style="width:40px; background-image:url(demo.files/images/unsplash/products/thumb_330/barrett-ward-fYYUgvHYgpU-unsplash-min.jpg)"> </div> 

                      <a href="#" class="small d-block link-normal">
                        <span class="d-block text-truncate">
                          1 &times; Product title comes here
                        </span>
                      </a>

                      <span class="d-block small mt-1">$196.00</span>
                    </div>
                    <!-- /item -->


                    <!-- item -->
                    <div class="p-3 border-top border-light">

                      <div class="ratio ratio-1x1 float-start mt-1 bg-cover" 
                        style="width:40px; background-image:url(demo.files/images/unsplash/products/thumb_330/hardik-sharma-CrPAvN29Nhs-unsplash-min.jpg)"> </div> 

                      <a href="#" class="small d-block link-normal">
                        <span class="d-block text-truncate">
                          1 &times; Product title comes here
                        </span>
                      </a>

                      <span class="d-block small mt-1">$56.99</span>
                    </div>
                    <!-- /item -->


                  </div>
                  <!-- /item list -->


                  <!-- subtotal -->
                  <div class="fs-6 text-align-start border-top border-light px-3 py-2">
                    Subtotal: <span class="float-end">$196.00</span>
                  </div>


                  <!-- go to cart button -->
                  <div class="border-top border-light p-3">
                    
                    <a href="shop-page-cart-1.html" class="btn btn-primary w-100">
                      <span>Go to Cart</span>
                      <i class="fi fi-arrow-end smaller"></i>
                    </a>

                  </div>


                </div>


              </li>

            </ul>
            <!-- /OPTIONS -->


          </nav>

        </div>
        <!-- /Navbar -->




        <div class="clearfix">
          
          <!-- line -->
          <hr class="m-0 bg-gray-500 opacity-25">
          
          <div class="container">

            <nav class="navbar h-auto navbar-expand-lg navbar-light justify-content-lg-between justify-content-md-inherit">


              <!-- Menu -->
              <!--

                Dropdown Classes (should be added to primary .dropdown-menu only, dropdown childs are also affected)
                  .dropdown-menu-dark     - dark dropdown (desktop only, will be white on mobile)
                  .dropdown-menu-hover    - open on hover
                  .dropdown-menu-clean    - no background color on hover
                  .dropdown-menu-invert     - open dropdown in oposite direction (left|right, according to RTL|LTR)
                  .dropdown-menu-uppercase  - uppercase text (font-size is scalled down to 13px)
                  .dropdown-click-ignore    - keep dropdown open on inside click (useful on forms inside dropdown)

                  Repositioning long dropdown childs (Example: Pages->Account)
                    .dropdown-menu-up-n100    - open up with top: -100px
                    .dropdown-menu-up-n100    - open up with top: -150px
                    .dropdown-menu-up-n180    - open up with top: -180px
                    .dropdown-menu-up-n220    - open up with top: -220px
                    .dropdown-menu-up-n250    - open up with top: -250px
                    .dropdown-menu-up       - open up without negative class


                  Dropdown prefix icon (optional, if enabled in variables.scss)
                    .prefix-link-icon .prefix-icon-dot    - link prefix
                    .prefix-link-icon .prefix-icon-line   - link prefix
                    .prefix-link-icon .prefix-icon-ico    - link prefix
                    .prefix-link-icon .prefix-icon-arrow  - link prefix

                  .nav-link.nav-link-caret-hide   - no dropdown icon indicator on main link
                  .nav-item.dropdown-mega     - required ONLY on fullwidth mega menu

                  Mobile animation - add to .navbar-collapse:
                  .navbar-animate-fadein
                .navbar-animate-fadeinup
                  .navbar-animate-bouncein

              -->
              <div class="collapse navbar-collapse navbar-animate-fadein" id="navbarMainNav">


                <!-- navbar : mobile menu -->
                <div class="navbar-xs d-none"><!-- .sticky-top -->

                  <!-- mobile menu button : close -->
                  <button class="navbar-toggler pt-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMainNav" aria-controls="navbarMainNav" aria-expanded="false" aria-label="Toggle navigation">
                    <svg width="20" viewBox="0 0 20 20">
                      <path d="M 20.7895 0.977 L 19.3752 -0.4364 L 10.081 8.8522 L 0.7869 -0.4364 L -0.6274 0.977 L 8.6668 10.2656 L -0.6274 19.5542 L 0.7869 20.9676 L 10.081 11.679 L 19.3752 20.9676 L 20.7895 19.5542 L 11.4953 10.2656 L 20.7895 0.977 Z"></path>
                    </svg>
                  </button>

                  <!-- 
                    Mobile Menu Logo 
                    Logo : height: 70px max
                  -->
                  <a class="navbar-brand" href="#">
                    <img src="${contextPath }/resources/html_frontend/assets/images/logo/logo_dark.svg" width="110" height="38" alt="...">
                  </a>

                </div>
                <!-- /navbar : mobile menu -->



                <!-- navbar : navigation -->
                <ul class="navbar-nav navbar-sm">
                  <!-- Menu -->
                  <!--

                    Dropdown Classes (should be added to primary .dropdown-menu only, dropdown childs are also affected)
                      .dropdown-menu-dark     - dark dropdown (desktop only, will be white on mobile)
                      .dropdown-menu-hover    - open on hover
                      .dropdown-menu-clean    - no background color on hover
                      .dropdown-menu-invert     - open dropdown in oposite direction (left|right, according to RTL|LTR)
                      .dropdown-menu-uppercase  - uppercase text (font-size is scalled down to 13px)
                      .dropdown-click-ignore    - keep dropdown open on inside click (useful on forms inside dropdown)

                      Repositioning long dropdown childs (Example: Pages->Account)
                        .dropdown-menu-up-n100    - open up with top: -100px
                        .dropdown-menu-up-n100    - open up with top: -150px
                        .dropdown-menu-up-n180    - open up with top: -180px
                        .dropdown-menu-up-n220    - open up with top: -220px
                        .dropdown-menu-up-n250    - open up with top: -250px
                        .dropdown-menu-up       - open up without negative class


                      Dropdown prefix icon (optional, if enabled in variables.scss)
                        .prefix-link-icon .prefix-icon-dot    - link prefix
                        .prefix-link-icon .prefix-icon-line   - link prefix
                        .prefix-link-icon .prefix-icon-ico    - link prefix
                        .prefix-link-icon .prefix-icon-arrow  - link prefix

                      .nav-link.nav-link-caret-hide   - no dropdown icon indicator on main link
                      .nav-item.dropdown-mega     - required ONLY on fullwidth mega menu

                  -->
                 
                  <!-- pages -->
                  <c:choose>
				  <c:when test="${isLogOn == true and memberInfo == 'admin' }">
                  	<li class="nav-item">
	                    <a href="${contextPath}/admin/products/adminMain" id="mainNavPages" class="nav-link">
	                      상품관리
	                    </a>
                 	</li>
                 	
                 	<li class="nav-item">
	                    <a href="${contextPath}/admin/member/adminMemberMain" id="mainNavPages" class="nav-link">
	                      고객관리
	                    </a>
                 	</li>
                 	
                 	<li class="nav-item">
	                    <a href="${contextPath}/admin/order/adminOrderMain" id="mainNavPages" class="nav-link">
	                      주문관리
	                    </a>
                 	</li>
                  </c:when>
                  <c:otherwise>
                  
                  <li class="nav-item dropdown">

                    <a href="#" id="mainNavPages" class="nav-link dropdown-toggle" 
                      data-bs-toggle="dropdown" 
                      aria-haspopup="true" 
                      aria-expanded="false">
                      HOME
                    </a>

                    <div aria-labelledby="mainNavPages" class="dropdown-menu dropdown-menu-hover dropdown-menu-clean dropdown-fadeindown rounded-xl rounded-top-0">
                      <ul class="list-unstyled m-0 p-0">
                        <li class="dropdown-item dropdown"><a href="#" class="dropdown-link" data-bs-toggle="dropdown">내 계정</a>
                          <ul class="dropdown-menu dropdown-menu-hover dropdown-menu-block-md shadow-lg rounded-xl border-0 m-0">
                            <li class="dropdown-item"><a href="account-index.html" class="dropdown-link">MY홈</a></li>
                            <li class="dropdown-item"><a href="shop-page-cart-1.html" class="dropdown-link">장바구니</a></li>
                            <li class="dropdown-item"><a href="account-orders.html" class="dropdown-link">주문현황</a></li>
                            <li class="dropdown-item"><a href="account-favourites.html" class="dropdown-link">찜목록</a></li>
                            <li class="dropdown-item"><a href="account-reward.html" class="dropdown-link">MY포인트</a></li>
                            <li class="dropdown-item"><a href="account-coupons.html" class="dropdown-link">MY쿠폰</a></li>
                            <li class="dropdown-item"><a href="account-reviews.html" class="dropdown-link">My리뷰</a></li>
                            <li class="dropdown-item"><a href="account-addresses.html" class="dropdown-link">배송지</a></li>
                            <li class="dropdown-item"><a href="account-settings.html" class="dropdown-link">설정</a></li>
                          </ul>
                        </li>
                        <li class="dropdown-item"><a href="${contextPath}/member/memberJoin" class="dropdown-link">회원가입</a></li>
                        <li class="dropdown-item"><a href="${contextPath}/member/loginForm" class="dropdown-link">로그인</a></li>
                        <li class="dropdown-item"><a href="shop-page-faq.html" class="dropdown-link">고객센터</a></li>
                        <li class="dropdown-item"><a href="shop-page-contact.html" class="dropdown-link">Contact us</a></li>
                      </ul>
                    </div>

                  </li>
				<!-- 
				<li class="dropdown-item dropdown"><a href="#" class="dropdown-link" data-bs-toggle="dropdown">카테고리</a>
                          <ul class="dropdown-menu dropdown-menu-hover dropdown-menu-block-md shadow-lg rounded-xl border-0 m-0">
                            <li class="dropdown-item"><a href="shop-page-category-1.html" class="dropdown-link">전체</a></li>
                            <li class="dropdown-divider"></li>
                            <li class="dropdown-item"><a href="shop-page-category-1.html" class="dropdown-link">상의</a></li>
                            <li class="dropdown-item"><a href="shop-page-category-2.html" class="dropdown-link">바지</a></li>
                            <li class="dropdown-item"><a href="shop-page-category-3.html" class="dropdown-link">신발</a></li>
                            <li class="dropdown-item"><a href="shop-page-category-4.html" class="dropdown-link">액세사리</a></li>
                          </ul>
                        </li>
                        <li class="dropdown-item dropdown"><a href="#" class="dropdown-link" data-bs-toggle="dropdown">브랜드</a>
                          <ul class="dropdown-menu dropdown-menu-hover dropdown-menu-block-md shadow-lg rounded-xl border-0 m-0">
                            <li class="dropdown-item"><a href="shop-page-product-1.html" class="dropdown-link">전체</a></li>
                            <li class="dropdown-divider"></li>
                            <li class="dropdown-item"><a href="shop-page-product-1.html" class="dropdown-link">gucci</a></li>
                            <li class="dropdown-item"><a href="shop-page-product-2.html" class="dropdown-link">chanel</a></li>
                            <li class="dropdown-item"><a href="shop-page-product-3.html" class="dropdown-link">Louis Vuitton</a></li>
                            <li class="dropdown-item"><a href="shop-page-product-4.html" class="dropdown-link">AMI</a></li>
                          </ul>
                        </li>
				
				 -->

                  <!-- Catalog -->
                  <li class="nav-item dropdown dropdown-mega">

                    <a href="#" id="mainNavCatalog" class="nav-link dropdown-toggle" 
                      data-bs-toggle="dropdown" 
                      aria-haspopup="true" 
                      aria-expanded="false">
                      카테고리
                    </a>

                    <div aria-labelledby="mainNavCatalog" class="dropdown-menu dropdown-menu-hover dropdown-menu-clean dropdown-fadeindown rounded-xl rounded-top-0">
                      <ul class="list-unstyled m-0 p-0">
                        <li class="dropdown-item bg-transparent">

                          <div class="row g-lg-4">

                            <div class="col-12 col-md-3">

                              <h3 class="fs-6 fw-bold mb-3">상의</h3>
                              <ul class="list-unstyled">
                                <li class="dropdown-item"><a class="dropdown-link py-1" href="${contextPath}/products/productsCategory">반팔티셔츠</a></li>
                                <li class="dropdown-item"><a class="dropdown-link py-1" href="#">긴팔티셔츠(준비중)</a></li>
                                <li class="dropdown-item"><a class="dropdown-link py-1" href="#">반팔셔츠(준비중)</a></li>
                                <li class="dropdown-item"><a class="dropdown-link py-1" href="#">긴팔셔츠(준비중)</a></li>
                              </ul>

                            </div>

                            <div class="col-12 col-md-3">

                              <h3 class="fs-6 fw-bold mb-3">하의</h3>
                              <ul class="list-unstyled">
                                <li class="dropdown-item"><a class="dropdown-link py-1" href="#">반바지</a></li>
                                <li class="dropdown-item"><a class="dropdown-link py-1" href="#">긴바지(준비중)</a></li>
                                <li class="dropdown-item"><a class="dropdown-link py-1" href="#">치마(준비중)</a></li>
                                <li class="dropdown-item"><a class="dropdown-link py-1" href="#">청바지(준비중)</a></li>
                              </ul>

                            </div>

                            <div class="col-12 col-md-3">

                              <h3 class="fs-6 fw-bold mb-3">신발</h3>
                              <ul class="list-unstyled">
                                <li class="dropdown-item"><a class="dropdown-link py-1" href="#">운동화</a></li>
                                <li class="dropdown-item"><a class="dropdown-link py-1" href="#">구두(준비중)</a></li>
                                <li class="dropdown-item"><a class="dropdown-link py-1" href="#">슬리퍼(준비중)</a></li>
                                <li class="dropdown-item"><a class="dropdown-link py-1" href="#">부츠(준비중)</a></li>
                              </ul>

                            </div>

                            <div class="col-12 col-md-3">

                              <h3 class="fs-6 fw-bold mb-3">액세서리</h3>
                              <ul class="list-unstyled">
                                <li class="dropdown-item"><a class="dropdown-link py-1" href="#">가방</a></li>
                                <li class="dropdown-item"><a class="dropdown-link py-1" href="#">팔찌(준비중)</a></li>
                                <li class="dropdown-item"><a class="dropdown-link py-1" href="#">반지(준비중)</a></li>
                                <li class="dropdown-item"><a class="dropdown-link py-1" href="#">귀걸이(준비중)</a></li>
                              </ul>

                            </div>

                          </div>

                        </li>
                      </ul>
                    </div>

                  </li>


                  <!-- Categories -->
                  <li class="nav-item dropdown dropdown-mega">

                    <a href="#" id="mainNavCats" class="nav-link dropdown-toggle" 
                      data-bs-toggle="dropdown" 
                      aria-haspopup="true" 
                      aria-expanded="false">
                      브랜드
                    </a>

                    <div aria-labelledby="mainNavCats" class="dropdown-menu dropdown-menu-hover dropdown-menu-clean dropdown-fadeindown rounded-xl rounded-top-0">
                      <ul class="list-unstyled m-0 p-0">
                        <li class="dropdown-item bg-transparent">

                          <div class="row">

                            <!-- col 1 -->
                            <div class="col-12 col-md-3">

                              <h3 class="fs-6 fw-bold mb-3">gucci</h3>
                              <ul class="list-unstyled">
                                <li class="dropdown-item"><a class="dropdown-link" href="#">가방</a></li>
                                <li class="dropdown-item"><a class="dropdown-link" href="#">신발(준비중)</a></li>
                              </ul>

                            </div>

                            <!-- col 2 -->
                            <div class="col-12 col-md-3">

                              <h3 class="fs-6 fw-bold mb-3">chanel</h3>
                              <ul class="list-unstyled">
                                <li class="dropdown-item"><a class="dropdown-link" href="#">가방</a></li>
                                <li class="dropdown-item"><a class="dropdown-link" href="#">신발(준비중)</a></li>
                              </ul>

                            </div>

                            <!-- col 3 -->
                            <div class="col-12 col-md-3">

                              <h3 class="fs-6 fw-bold mb-3">Louis Vuitton</h3>
                              <ul class="list-unstyled">
                                <li class="dropdown-item"><a class="dropdown-link" href="#">가방</a></li>
                                <li class="dropdown-item"><a class="dropdown-link" href="#">신발(준비중)</a></li>
                              </ul>

                            </div>
                            
                            <div class="col-12 col-md-3">

                              <h3 class="fs-6 fw-bold mb-3">AMI</h3>
                              <ul class="list-unstyled">
                                <li class="dropdown-item"><a class="dropdown-link" href="#">가방</a></li>
                                <li class="dropdown-item"><a class="dropdown-link" href="#">신발(준비중)</a></li>
                              </ul>

                            </div>
                            
                            

                            <div class="col-12 col-md-3">


                            </div>

                          </div>

                        </li>
                      </ul>
                    </div>

                  </li>
				 </c:otherwise>
                 </c:choose>

                  <!-- social icons : mobile only -->
                  <li class="nav-item d-block d-sm-none text-center mb-4">

                    <h3 class="h6 text-muted">Follow Us</h3>

                    <a href="#" class="btn btn-sm btn-facebook transition-hover-top mb-2 rounded-circle text-white" rel="noopener">
                      <i class="fi fi-social-facebook"></i> 
                    </a>

                    <a href="#" class="btn btn-sm btn-twitter transition-hover-top mb-2 rounded-circle text-white" rel="noopener">
                      <i class="fi fi-social-twitter"></i> 
                    </a>

                    <a href="#" class="btn btn-sm btn-linkedin transition-hover-top mb-2 rounded-circle text-white" rel="noopener">
                      <i class="fi fi-social-linkedin"></i> 
                    </a>

                    <a href="#" class="btn btn-sm btn-youtube transition-hover-top mb-2 rounded-circle text-white" rel="noopener">
                      <i class="fi fi-social-youtube"></i> 
                    </a>

                  </li>


                  <!-- Get Smarty : mobile only (d-block d-sm-none)-->
                  <li class="nav-item d-block d-sm-none">
                    <a target="_blank" href="#buy_now" class="btn w-100 btn-primary shadow-none text-white m-0">
                      Get Smarty
                    </a>
                  </li>

                </ul>
                <!-- /navbar : navigation -->


              </div>

            </nav>

          </div>
        </div>

      </header>
	
								
                              
</body>
</html>