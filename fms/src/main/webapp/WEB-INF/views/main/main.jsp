<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<body>

	 <!-- SWIPER -->
      <div class="section p-0 position-relative overflow-hidden">

        <!--
          Height
            .vh-50
            .vh-75
            .vh-100
        -->
        <div class="swiper-container swiper-btn-group swiper-btn-group-end text-white vh-75 overflow-hidden"
          data-swiper='{
            "slidesPerView": 1,
            "spaceBetween": 0,
            "autoplay": { "delay" : 6500, "disableOnInteraction": true },
            "loop": true,
            "effect": "fade",
            "pagination": { "type": "bullets" }
          }'>

          <div class="swiper-wrapper h-100">

            <!-- slide 1 (new Item) -->
          <c:forEach var="item" items="${mainBanner }" >
            <div class="h-100 swiper-slide d-middle overlay-dark overlay-opacity-5 bg-cover text-decoration-none text-white" style="background-image:url('${contextPath }/resources/images/루이비통.png')">
              <div class="position-absolute container z-index-10 text-white text-center" data-aos="fade-in" data-aos-delay="150" data-aos-offset="0">

                <h1 class="display-3 mb-4 fw-bold" data-swiper-parallax="-300">
                  New Item!
                </h1>
				
                <div data-swiper-parallax="-100"><!-- parallax directly on button will cancel hover fade -->
                  <a href="${contextPath}/products/productsDetail?productsId=${item.productsId }" class="btn btn-lg btn-outline-light shadow-none transition-hover-top">
                    Shop now
                    <svg width="18px" height="18px" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-arrow-right-short" viewBox="0 0 16 16">  
                      <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5A.5.5 0 0 1 4 8z"></path>
                    </svg>
                  </a>
                </div>
              
              </div>
            </div>
	      </c:forEach>
            <!-- /slide 1 (button link) -->
          
          <!-- slide 2 (full link) -->
            <a href="${contextPath}/products/productsCategory" class="h-100 swiper-slide d-middle overlay-dark overlay-opacity-5 bg-cover text-decoration-none text-white lazy" style="background-image:url('${contextPath }/resources/images/mainpic.png')">
              <div class="position-relative container z-index-10 text-white text-center" data-aos="fade-in" data-aos-delay="150" data-aos-offset="0">

                <h2 class="display-3 mb-4 fw-bold" data-swiper-parallax="-300">
                  Fashion collection
                </h2>

                <div data-swiper-parallax="-100"><!-- parallax directly on button will cancel hover fade -->
                  <span class="btn btn-lg btn-outline-light shadow-none transition-hover-top">
                    View collection
                  </span>
                </div>

              </div>
            </a>
            <!-- /slide 2 (full link) -->
          
          </div>
          		
		  
		  
          <!-- Add Arrows -->
          <div class="swiper-button-next swiper-button-black"></div>
          <div class="swiper-button-prev swiper-button-black"></div>

          <!-- Add Pagination -->
          <div style="height: 30px;" class="swiper-pagination top-0 mt-4"></div>

          <!-- v shape : .bg-light, .shape-xs (remove .shape-xs for .vh-100 container) -->
          <div class="shape-v shape-xs bottom-0"></div>

        </div>

      </div>
      <!-- /SWIPER -->

      <!-- OFFER BLOCK -->
      <div class="section">
        <div class="container">


          <div class="mb-7 text-center px-3">
            <h2 class="h1 text-center-xs fw-bold">
              <span class="text-danger">30% OFF</span>
            </h2>
            
            <p class="lead max-w-600 mx-auto">
              이번주 30% Super Sale 이벤트를 진행합니다.
            </p>
          </div>

        </div>
      </div>
      <!-- /OFFER BLOCK -->




      <!-- SUBSCRIBE -->
      <div class="bg-light py-5 py-lg-4">
        <div class="container">

          <div class="row g-4 align-items-center">

            <div class="col-10 mx-auto col-lg-8 text-center-md text-center-xs">
              <h3 class="m-0">지금 바로 <strong>이메일</strong> 등록을 하세요!</h3>
              <p class="m-0">좋은 가격으로 선정된 상품 목록을 보내드립니다!</p>
            </div>

            <div class="col-10 mx-auto col-lg-4">

              <form novalidate="" method="post" action="#subscribe_url" class="bs-validate py-3 mt-1 input-group-over input-group-pill"> 
                  
                <input required="" class="form-control form-control-lg fw-light text-center-md text-center-xs" name="subscriber_email" type="email" value="" placeholder="email address..." aria-label="email address...">

                <button aria-label="subscribe" type="submit" class="btn bg-transparent shadow-none"> 
                  <i class="fi fi-send fs-4"></i> 
                </button>

              </form>

            </div>

          </div>

        </div>
      </div>
      <!-- /SUBSCRIBE -->




      <!-- BRANDS -->
      <div class="section">
        <div class="container">

          <div class="mb-7 text-center px-3">
            <h2 class="h1 text-center-xs fw-normal">
              <strong>Top Sale Brands</strong>
            </h2>

            <p class="lead max-w-600 mx-auto">
              갖고 싶은 브랜드를 찾아보세요.
            </p>
          </div>

          <!-- BRANDS : GRID : LAZYLOAD -->
          <div class="bg-white shadow-3d rounded overflow-hidden rounded">
            <div class="bg-white overflow-hidden"><!-- negative classes - hide bordered edges -->
              
              <div class="row row-grid mt-n1 mb--n1">

                <div class="col-6 col-md-5th d-flex align-items-center text-center">
                  <a href="#" class="w-100">
                    <img style="max-height:60px;max-width:180px;" class="mx-3 my-5 lazy" data-src="${contextPath }/resources/html_frontend/demo.files/svg/brands/adidas.svg" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="...">
                  </a>
                </div>

                <div class="col-6 col-md-5th d-flex align-items-center text-center">
                  <a href="#" class="w-100">
                    <img style="max-height:60px;max-width:180px;" class="mx-3 my-5 lazy" data-src="${contextPath }/resources/html_frontend/demo.files/svg/brands/xing.svg" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="...">
                  </a>
                </div>

                <div class="col-6 col-md-5th d-flex align-items-center text-center">
                  <a href="#" class="w-100">
                    <img style="max-height:60px;max-width:180px;" class="mx-3 my-5 lazy" data-src="${contextPath }/resources/html_frontend/demo.files/svg/brands/chanel.svg" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="...">
                  </a>
                </div>

                <div class="col-6 col-md-5th d-flex align-items-center text-center">
                  <a href="#" class="w-100">
                    <img style="max-height:60px;max-width:180px;" class="mx-3 my-5 lazy" data-src="${contextPath }/resources/html_frontend/demo.files/svg/brands/jordan.svg" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="...">
                  </a>
                </div>

                <div class="col-6 col-md-5th d-flex align-items-center text-center">
                  <a href="#" class="w-100">
                    <img style="max-height:60px;max-width:180px;" class="mx-3 my-5 lazy" data-src="${contextPath }/resources/html_frontend/demo.files/svg/brands/levis.svg" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="...">
                  </a>
                </div>

                <div class="col-6 col-md-5th d-flex align-items-center text-center">
                  <a href="#" class="w-100">
                    <img style="max-height:60px;max-width:180px;" class="mx-3 my-5 lazy" data-src="${contextPath }/resources/html_frontend/demo.files/svg/brands/lacoste.svg" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="...">
                  </a>
                </div>

                <div class="col-6 col-md-5th d-flex align-items-center text-center">
                  <a href="#" class="w-100">
                    <img style="max-height:60px;max-width:180px;" class="mx-3 my-5 lazy" data-src="${contextPath }/resources/html_frontend/demo.files/svg/brands/hm.svg" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="...">
                  </a>
                </div>

                <div class="col-6 col-md-5th d-flex align-items-center text-center">
                  <a href="#" class="w-100">
                    <img style="max-height:60px;max-width:180px;" class="mx-3 my-5 lazy" data-src="${contextPath }/resources/html_frontend/demo.files/svg/brands/american-apparel.svg" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="...">
                  </a>
                </div>

                <div class="col-6 col-md-5th d-flex align-items-center text-center">
                  <a href="#" class="w-100">
                    <img style="max-height:60px;max-width:180px;" class="mx-3 my-5 lazy" data-src="${contextPath }/resources/html_frontend/demo.files/svg/brands/nike-4.svg" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="...">
                  </a>
                </div>

                <div class="col-6 col-md-5th d-flex align-items-center text-center">
                  <a href="#" class="w-100">
                    <img style="max-height:60px;max-width:180px;" class="mx-3 my-5 lazy" data-src="${contextPath }/resources/html_frontend/demo.files/svg/brands/bike.svg" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="...">
                  </a>
                </div>

              </div>

            </div>
          </div>
          <!-- BRANDS : GRID : LAZYLOAD -->


          <div class="text-center pt-5">

            <!-- view all button -->
            <a href="#" class="btn btn-sm btn-dark">
              all brands
              <svg width="18px" height="18px" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-arrow-right-short" viewBox="0 0 16 16">  
                <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5A.5.5 0 0 1 4 8z"></path>
              </svg>
            </a>

          </div>

        </div>
      </div>
      <!-- /BRANDS -->

	
	
</body>
</html>