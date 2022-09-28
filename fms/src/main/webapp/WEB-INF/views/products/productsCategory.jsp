<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div id="wrapper">
			<!-- page title -->
			<div class="container py-5">

				<nav aria-label="breadcrumb">
					<ol class="breadcrumb small">
						<li class="breadcrumb-item"><a href="${contextPath }/main/main">Home</a></li>
					</ol>
				</nav>

				<h1 class="h2 fw-bold">반팔티셔츠</h1>

			</div>
			<!-- /page title -->

			<!-- -->
			<div class="container pb-6">
			<c:forEach var="category" items="${category }" >
				<div class="row g-4">
					
					<!-- sidebar -->
					<div class="col-12 col-lg-3">

						<!-- categories & filters -->
						<nav class="card nav-deep nav-deep-light mb-2 mb-lg-3 bg-white shadow-none-md shadow-none-xs p-lg-4">

							<!-- mobile trigger : categories -->
							<button class="clearfix btn btn-toggle btn-sm w-100 py-3 text-align-left shadow-md border rounded d-flex d-lg-none align-items-center" data-bs-target="#nav_responsive" data-toggle-container-class="d-none d-sm-block bg-white shadow-md border animate-fadein rounded p-3">
								<span class="group-icon float-start px-2">
									<i class="fi fi-bars-2"><!-- icon --></i>
									<i class="fi fi-close"><!-- icon --></i>
								</span>
								<span class="mx-0 fw-medium float-start">카테고리</span>
							</button>

							<!-- desktop only -->
							<h5 class="h6 d-none d-lg-block">
								카테고리
							</h5>

							<!-- navbar : navigation -->
							<ul id="nav_responsive" class="nav flex-column d-none d-lg-block mt-1">

								<li class="nav-item active">
									<a class="nav-link px-0" href="#">
										<span class="group-icon">
											<i class="fi fi-arrow-end"></i>
											<i class="fi fi-arrow-down"></i>
										</span>

										<span class="px-2 d-inline-block">
											상의 
										</span>

										<span class="badge bg-warning text-dark float-end fw-normal">
											New
										</span>

									</a>

									<ul class="nav flex-column px-3">
										<li class="nav-item active"><a class="nav-link" href="#">반팔티셔츠</a></li>
										<li class="nav-item"><a class="nav-link" href="#">긴팔티셔츠</a></li>
										<li class="nav-item"><a class="nav-link" href="#">반팔셔츠</a></li>
										<li class="nav-item"><a class="nav-link" href="#">긴팔셔츠</a></li>
									</ul>
								</li>
								<li class="nav-item">
									<a class="nav-link px-0" href="#">
										<i class="fi fi-arrow-end m-0 smaller"></i> 
										<span class="px-2 d-inline-block">
											하의
										</span>
									</a>
									<ul class="nav flex-column px-3">
										<li class="nav-item active"><a class="nav-link" href="#">반바지</a></li>
										<li class="nav-item"><a class="nav-link" href="#">긴바지</a></li>
										<li class="nav-item"><a class="nav-link" href="#">치마</a></li>
										<li class="nav-item"><a class="nav-link" href="#">청바지</a></li>
									</ul>
								</li>

								<li class="nav-item">
									<a class="nav-link px-0" href="#">
										<i class="fi fi-arrow-end m-0 smaller"></i> 
										<span class="px-2 d-inline-block">
											신발
										</span>
									</a>
									<ul class="nav flex-column px-3">
										<li class="nav-item active"><a class="nav-link" href="#">운동화</a></li>
										<li class="nav-item"><a class="nav-link" href="#">구두</a></li>
										<li class="nav-item"><a class="nav-link" href="#">슬리퍼</a></li>
										<li class="nav-item"><a class="nav-link" href="#">부츠</a></li>
									</ul>
								</li>
								
								<li class="nav-item">
									<a class="nav-link px-0" href="#">
										<i class="fi fi-arrow-end m-0 smaller"></i> 
										<span class="px-2 d-inline-block">
											액세서리
										</span>
									</a>
									<ul class="nav flex-column px-3">
										<li class="nav-item active"><a class="nav-link" href="#">가방</a></li>
										<li class="nav-item"><a class="nav-link" href="#">팔찌</a></li>
										<li class="nav-item"><a class="nav-link" href="#">반지</a></li>
										<li class="nav-item"><a class="nav-link" href="#">귀걸이</a></li>
									</ul>
								</li>

							</ul>

						</nav>
						<!-- /categories & filters -->



						</form>

					</div>
					<!-- /sidebar -->
					
					

					<!-- products -->
					<div class="col-12 col-lg-9">
					


						<!-- product list -->
						
						
						<div class="row g-2 g-xl-3">


							<!-- item -->
							<div class="col-6 col-md-4">

								<div class="bg-white shadow-sm shadow-3d-hover transition-all-ease-250 transition-hover-top rounded show-hover-container p-3 h-100">

									<!-- badges, countdown -->
									<div class="position-absolute top-0 start-0 m-1 m-lg-3 z-index-1">
										
										<!-- 

											SOW : Timer Countdown

												Backgrounds:
													.bg-primary 
													.bg-secondary 
													.bg-danger 
													.bg-warning 
													.bg-info
													etc

										-->
										<div class="bg-danger text-white hide animate-fadein smaller opacity-9 px-2 py-1 mb-1 rounded timer-countdown timer-countdown-inline" 
											data-timer-countdown-from="11/21/2030 16:00:00" 
											data-timer-countdown-end-hide-self="true" 
											data-timer-countdown-end-hide-target="">

											<strong>Limited offer:</strong> 

											<span class="d-block d-xl-inline-block">
												<span class="d"></span> days, 
												<span class="h"></span>:<span class="m"></span>:<span class="s"></span>
											</span>

										</div>

										<!-- badge -->
										<div class="clearfix"><!-- RTL: change me-1 to ms-1 -->
											<span class="float-start badge bg-danger text-white mb-1 me-1">-12%</span>
											<span class="float-start badge bg-warning text-dark mb-1 me-1">+ gift</span>
											<span class="float-start badge bg-success text-white mb-1 me-1">new</span>
										</div>

									</div>
									<a href="${contextPath}/products/productsDetail?productsId=${category.productsId }" class="d-block text-gray-800">

										<!-- regular image -->
										<figure class="text-center">
											<img class="img-fluid" src="${contextPath}/thumbnails?productsImage=${category.productsImage}" alt="..."> 
										</figure>

										<!-- OR : background image -->
										<!-- ratio-1x1, ratio-4x3, ratio-16x9 -->
										<!-- <figure class="ratio ratio-1x1 bg-cover" style="background-image:url(demo.files/images/unsplash/products/speakers/1-min.jpg)"></figure> -->
										<!-- lazy load -->
										<!-- <figure class="ratio ratio-1x1 bg-cover lazy" data-background-image="demo.files/images/unsplash/products/speakers/1-min.jpg"></figure> -->

										<span class="d-block fs-6">

											<!-- title -->
											<span class="d-block fw-medium">${category.productsName }</span>

											<!-- price -->
											<span class="d-block fw-medium">
												<del class="text-muted">${category.originalPrice }</del> 
												<span class="text-dark">${category.salePrice }</span>
											</span>

										</span>

									</a>

								</div>

							</div>
							<!-- /item -->


						</div>
						<!-- /product list -->


								
					</div>
					<!-- /products -->


				</div>

			</c:forEach>
			</div>
			<!-- / -->
			</div>
</body>
</html>