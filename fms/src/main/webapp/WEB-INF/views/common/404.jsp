<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404</title>
</head>
<body>
	<body class="bg-light">

		<div id="wrapper">

			<div class="section p-0">
				<div class="container text-center">

					<div class="w-100 max-w-500 d-inline-block mt-5 bg-white p-4 p-lg-5 rounded-xl shadow-xs">

						<!-- Logo -->
						<a class="navbar-brand m-0" href="landing-0.html">
							<img src="${contextPath }/resources/html_frontend/assets/images/logo/logo_dark.svg" width="110" height="38" alt="...">
						</a>

						<h1 class="my-5 fw-bold">
							
							<span class="d-block mb-4">
								어머, 아직 준비중 입니다.
							</span>

							<a class="btn btn-sm btn-light btn-pill" href="${contextPath }/main/main">
								<i class="fi fi-arrow-start-slim"></i>
								돌아가기
							</a>

						</h1>

						<!-- image -->
						<img class="opacity-6 max-w-450 img-fluid" src="${contextPath }/resources/html_frontend/demo.files/svg/artworks/undraw_page_not_found_su7k.svg" alt="...">

					</div>

				</div>
			</div>

		</div>

</body>
</body>
</html>