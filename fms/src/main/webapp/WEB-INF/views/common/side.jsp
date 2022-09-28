<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>side bar</title>
</head>
<body>

	<aside id="aside-main" class="aside-start aside-secondary fw-light aside-hide-xs shadow-xs d-flex align-items-stretch justify-content-lg-between align-items-start flex-column">


			<!-- 
				OPTIONAL LOGO 
				visibility : desktop only
				.d-none + .d-sm-block
			-->
			<div class="clearfix px-3 py-4 mb-1 text-center border-bottom">
				<i class="fi fi-shield-ok fs-1"></i>
				<h2 class="h5">관리자 모드</h2>
			</div>
			<!-- /LOGO -->



			<div class="aside-wrapper scrollable-vertical scrollable-styled-dark align-self-baseline h-100 w-100">

				<!--

					All parent open navs are closed on click!
					To ignore this feature, add .js-ignore to .nav-deep

					Links height (paddings):
						.nav-deep-xs
						.nav-deep-sm
						.nav-deep-md  	(default, ununsed class)

					.nav-deep-hover 	hover background slightly different
					.nav-deep-bordered	bordered links
				-->
				<nav class="nav-deep nav-deep-light">
					<ul class="nav flex-column">
					<c:when test="${sideMenu == 'adminMode'}">
						<li class="nav-item active">
							<a class="nav-link" href="${contextPath}/admin/member/adminMemberMain">
								<i class="fi fi-home"></i>
								<b>회원관리</b>
							</a>
						</li>

						<li class="nav-item">
							<a class="nav-link" href="${contextPath}/admin/products/adminMain">
								<i class="fi fi-share"></i>
								상품관리
							</a>
						</li>

						<li class="nav-item">
							<a class="nav-link" href="${contextPath}/admin/order/adminOrderMain">
								<i class="fi fi-share"></i>
								주문관리
							</a>
						</li>
					</c:when>
					</ul>
				</nav>
			</div>
		</aside>
		<!-- /SIDEBAR -->
		<div class="clear"></div>
</body>
</html>