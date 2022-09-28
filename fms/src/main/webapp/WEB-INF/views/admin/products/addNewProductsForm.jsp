<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<meta charset="utf-8">
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${contextPath}/resources/ckeditor/ckeditor.js"></script> 
<script>

	function formValidationCheck(){
		
		var productsId = document.f.productsId;
		if (productsId.value == ""){
			alert("상품 번호를 반드시 입력해야 합니다.");
			productsId.focus();
			return false;
		}
		
		var productsName = document.f.productsName;
		if (productsName.value == ""){
			alert("상품명을 반드시 입력해야 합니다.");
			productsName.focus();
			return false;
		}
		
		var productsBrand = document.f.productsBrand;
		if (productsBrand.value == ""){
			alert("상품 브랜드를 반드시 입력해야 합니다.");
			productsBrand.focus();
			return false;
		}
		
		var productsColor = document.f.productsColor;
		if (productsColor.value == ""){
			alert("상품 색상을 반드시 입력해야 합니다.");
			productsColor.focus();
			return false;
		}
		
		var originalPrice = document.f.originalPrice;
		if (originalPrice.value == ""){
			alert("상품 정가는 반드시 입력해야 합니다.");
			originalPrice.focus();
			return false;
		}
		
		var salePrice = document.f.salePrice;
		if (salePrice.value == ""){
			alert("상품 판매가격 반드시 입력해야 합니다.");
			salePrice.focus();
			return false;
		}
		
		var productsPoint = document.f.productsPoint;
		if (productsPoint.value == ""){
			alert("상품 구매 포인트는 반드시 입력해야 합니다.");
			productsPoint.focus();
			return false;
		}
		
		var publishedDate = document.f.publishedDate;
		if (publishedDate.value == ""){
			alert("상품 출시일은 반드시 입력해야 합니다.");
			publishedDate.focus();
			return false;
		}
		
		var deliveryPrice = document.f.deliveryPrice;
		if (deliveryPrice.value == ""){
			alert("배송비는 반드시 입력해야 합니다.");
			deliveryPrice.focus();
			return false;
		}
		
		var deliveryDate = document.f.deliveryDate;
		if (deliveryDate.value == ""){
			alert("상품 도착 예정일은 반드시 입력해야 합니다.");
			deliveryDate.focus();
			return false;
		}
		
		var productsImage = document.f.productsImage;
		if (document.f.productsImage.value == ""){
			alert("상품 이미지는 반드시 첨부해야 합니다.");
			productsImage.focus();
			return false;
		}
		
		if (CKEDITOR.instances.brandIntro.getData() == ""){
			alert("상품 브랜드 소개는 반드시 입력해야 합니다.");
			CKEDITOR.instances.brandIntro.focus();
			return false;
		}
		
		if (CKEDITOR.instances.productsIntro.getData() == ""){
			alert("상품 소개는 반드시 입력해야 합니다.");
			CKEDITOR.instances.productsIntro.focus();
			return false;
		}
		
	};
	
	$().ready(function(){
		
		var cnt = 1;
		$("#append").click(function(){
			
			cnt++;
			
			var addText = '<div><input style="padding-bottom:0; padding-top:0; height:35px" type="radio" name="productsSize" value="free" checked>free <input style="padding-bottom:0; padding-top:0; height:35px" type="radio" name="productsSize" value="34" >34 <input style="padding-bottom:0; padding-top:0; height:35px" type="radio" name="productsSize" value="36" >36 <input style="padding-bottom:0; padding-top:0; height:35px" type="radio" name="productsSize" value="38" >38 <input style="padding-bottom:0; padding-top:0; height:35px" type="radio" name="productsSize" value="40" >40 <input style="padding-bottom:0; padding-top:0; height:35px" type="radio" name="productsSize" value="42" >42 <input style="padding-bottom:0; padding-top:0; height:35px" type="radio" name="productsSize" value="44" >44</div>';
			
			$("#productsSize").append(addText);
			
		});
		
		$("#delete").click(function(){
			
			if(cnt == 1) return;
			
			$("#productsSize > p:last-child").remove();
			cnt--;
			
		});
		
	});
</script>
<style>
	td:first-child {
		text-align: center;
		font-weight: bold;
	}
</style>
</head>
<body>
	<form action="${contextPath}/admin/products/addNewProducts" name="f" method="post" enctype="multipart/form-data" onsubmit="return formValidationCheck()" >
		<div class="container" id="container">
		<h1>상품 등록</h1>
			<ul class="tabs">
				<li><a href="#tab1">상품 정보</a></li>
				<li><a href="#tab3">브랜드 소개</a></li>
				<li><a href="#tab4">상품 소개</a></li>
			</ul>
			<hr class="my-0 bg-gray-300">
			<div class="row g-3">
			
			<p></p>
				<div class="col-sm-7" id="tab1" ><h2>상품 정보</h2>
					<table class="table table-bordered table-hover">			
						<tr>
							<td width=200>상품 분류</td>
							<td width=500>
								<select name="productsSort" class="form-control" style="padding-bottom:0; padding-top:0; height:35px">
									<option value="상의" selected>상의
									<option value="바지" >바지
									<option value="아우터" >아우터
									<option value="신발" >신발
									<option value="액세서리" >액세서리
									
								</select>
							</td>
						</tr>
						<tr>
							<td>상품 종류</td>
							<td>
								<select name="productsStatus" class="form-control" style="padding-bottom:0; padding-top:0; height:35px">
									<option value="newProducts" selected>신상품</option>
									<option value="restocked">재입고</option>
									<option value="invalid" >입고예정</option>
									<option value="mainBanner" >베너</option>
								</select>
							</td>
						 </tr>
						<tr>
							<td align="center" >상품 번호</td>
							<td><input name="productsId" type="text" class="form-control" style="padding-bottom:0; padding-top:0; height:35px"/></td>
						</tr>
						<tr>
							<td align="center">상품명</td>
							<td><input name="productsName" type="text" class="form-control" style="padding-bottom:0; padding-top:0; height:35px"/></td>
						</tr>
						<tr>
							<td align="center">색상</td>
							<td><input name="productsColor" type="text" class="form-control" style="padding-bottom:0; padding-top:0; height:35px"/></td>
						</tr>
						<tr>
							<td align="center" >사이즈</td>
							<td id="productsSize">
								<div class="btn-group" role="group" aria-label="Basic outlined example" >
  									<button type="button" class="btn btn-outline-primary" id="append">추가</button>
 								 	<button type="button" class="btn btn-outline-primary" id="delete">삭제</button>
								</div>
							</td>
						</tr>
						<tr>
							<td align="center">브랜드</td>
							<td><input name="productsBrand" type="text" class="form-control" style="padding-bottom:0; padding-top:0; height:35px"/></td>
						</tr>
						<tr>
							<td align="center">상품 정가</td>
							<td><input name="originalPrice" type="text" class="form-control" style="padding-bottom:0; padding-top:0; height:35px"/></td>
						</tr>
						<tr>
							<td align="center">상품 판매가격</td>
							<td><input name="salePrice" type="text" class="form-control" style="padding-bottom:0; padding-top:0; height:35px"/></td>
						</tr>
						<tr>
							<td align="center">상품 구매포인트</td>
							<td><input name="productsPoint" type="text" class="form-control" style="padding-bottom:0; padding-top:0; height:35px"/></td>
						</tr>
						<tr>
							<td align="center">상품 출판일</td>
							<td><input  name="publishedDate" type="date" class="form-control" style="padding-bottom:0; padding-top:0; height:35px"/></td>
						</tr>
						<tr>
							<td align="center">배송방법</td>
							<td>
								<select name="deliveryMethod" class="form-control" style="padding-bottom:0; padding-top:0; height:35px">
									<option value="fast" selected>당일배송</option>
									<option value="staDel" >일반배송</option>
								</select>
							</td>
						 </tr>
						<tr>
							<td align="center">상품 배송비</td>
							<td><input name="deliveryPrice" type="text" class="form-control" style="padding-bottom:0; padding-top:0; height:35px"/></td>
						</tr>
						<tr>
							<td align="center">상품 도착 예정일</td>
							<td><input name="deliveryDate" type="date" class="form-control" style="padding-bottom:0; padding-top:0; height:35px"/></td>
						</tr>
						<tr>
							<td align="center">상품 이미지</td>
							<td><input name="productsImage" type="file" style="padding-bottom:0; padding-top:0; height:35px"/></td>
						</tr>
					</table>	
				</div>
				<div class="tab_content" id="tab3">브랜드 소개
					<div class="form-group">
						<textarea rows="50" cols="80" class="form-control" id="brandIntro" name="brandIntro"></textarea>
				    	<script>CKEDITOR.replace('brandIntro');</script>
				    </div>
				</div>
				<div class="tab_content" id="tab4">상품 소개
					<div class="form-group">
						<textarea rows="50" cols="80" class="form-control" id="productsIntro" name="productsIntro"></textarea>
				    	<script>CKEDITOR.replace('productsIntro');</script>
				    </div>
				
			</div>
			<p align="left">
				<input type="submit" value="등록하기" class="btn btn-outline-primary btn-sm" >
			</p>
			</div>
		</div>
	</form>	
</body>
 