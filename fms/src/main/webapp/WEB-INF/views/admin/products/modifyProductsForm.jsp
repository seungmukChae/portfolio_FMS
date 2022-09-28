<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="${contextPath}/resources/ckeditor/ckeditor.js"></script> 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

	function fn_modify_products(productsId, attribute){
		
		var frm_mod_products = document.frm_mod_products;
		
		var value = "";
		
		if 	    (attribute == 'productsSort')				value = frm_mod_products.productsSort.value;
		else if (attribute == 'productsId')				 	value = frm_mod_products.productsId.value;
		else if (attribute == 'productsName')			 	value = frm_mod_products.productsName.value;   
		else if (attribute == 'productsColor')			 	value = frm_mod_products.productsColor.value;   
		else if (attribute == 'productsBrand')		 	 	value = frm_mod_products.productsBrand.value;
		else if (attribute == 'originalPrice')			 	value = frm_mod_products.originalPrice.value;
		else if (attribute == 'salePrice')		 			value = frm_mod_products.salePrice.value;
		else if (attribute == 'productsPoint')			 	value = frm_mod_products.productsPoint.value;
		else if (attribute == 'publishedDate')	{
			var temp1 = frm_mod_products.publishedDate.value;
			var temp2 = temp1.split("-");
			value = temp2[0] + temp2[1] + temp2[2];
		}
		else if (attribute == 'productsStatus')		 	 value = frm_mod_products.productsStatus.value;
		else if (attribute == 'deliveryPrice')				 value = frm_mod_products.deliveryPrice.value;
		else if (attribute == 'productsSort')	 	 value = frm_mod_products.productsSort.value;
		else if (attribute == 'deliveryDate')	{
			var temp1 = frm_mod_products.deliveryDate.value;
			var temp2 = temp1.split("-");
			value = temp2[0] + temp2[1] + temp2[2];
		}
		else if (attribute == 'deliveryMethod')		 value = frm_mod_products.deliveryMethod.value;
		else if (attribute == 'productsIntro')	 	 value = CKEDITOR.instances.productsIntro.getData();
		else if (attribute == 'productsSize')		 value = CKEDITOR.instances.productsSize.getData();
		
		$.ajax({
			type : "post",
			url : "${contextPath}/admin/products/modifyProductInfo",
			data : {
				"productsId"   : productsId,
				"attribute" : attribute,
				"value"     : value
			},
			success : function() {
				alert("정보를 수정했습니다.");
			}
		});
	 }

	 function fn_modify_products_image(productsId){
	  	
		 var form = $('form')[0];
	     var formData = new FormData(form);
	     
	     formData.append("productsId" , productsId);
	     formData.append("productsImage" , $("#productsImage").val());
	     
	     $.ajax({
	     	url: '${contextPath}/admin/products/modifyProductsImageInfo',
	     	processData: false,
	     	contentType: false,
	     	data: formData,
	     	type: 'POST',
	     	success: function(result){
	         	alert("이미지를 수정했습니다.");
	       	}
	     });
	     
	 }
	
</script>
<style>
	td:first-child {
		text-align: center;
		font-weight: bold;
	}
</style>
</head>
<body>
	<div class="clear"></div>
	<div id="container">
		<form name="frm_mod_products" method=post>
			<h1>상품 수정</h1>
		<div class="tab_container" id="container">
			<ul class="tabs">
				<li><a href="#tab1">상품 정보</a></li>
				<li><a href="#tab2">상품 사이즈</a></li>
				<li><a href="#tab3">브랜드 소개</a></li>
				<li><a href="#tab4">상품 소개</a></li>
			</ul>
			<div class="tab_container">
				<div class="tab_content" id="tab1"> 상품 정보
					<table class="table table-bordered table-hover">			
						<tr>
							<td width=200>상품 분류</td>
							<td width=500>
								<select name="productsSort" class="form-control" style="padding-bottom:0; padding-top:0; height:35px">
									<option value="상의" <c:if test="${products.productsSort=='상의' }">selected </c:if>>상의
									<option value="바지" <c:if test="${products.productsSort=='하의' }">selected </c:if>>바지
									<option value="아우터" <c:if test="${products.productsSort=='아우터' }">selected </c:if>>아우터
									<option value="신발" <c:if test="${products.productsSort=='신발' }">selected </c:if>>신발
									<option value="액세서리" <c:if test="${products.productsSort=='액세서리' }">selected </c:if>>액세서리
								</select>
							</td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="수정" onClick="fn_modify_products('${products.productsId }','productsSort')" /></td>
						</tr>
						<tr>
							<td>상품 종류</td>
							<td>
								<select name="productsStatus" class="form-control" style="padding-bottom:0; padding-top:0; height:35px">
									<option value="newProducts" <c:if test="${products.productsStatus=='신상품' }">selected </c:if>>신상품</option>
									<option value="restocked" <c:if test="${products.productsStatus=='재입고' }">selected </c:if>>재입고</option>
									<option value="invalid" <c:if test="${products.productsStatus=='입고예정' }">selected </c:if>>입고예정</option>
									<option value="mainBanner" <c:if test="${products.productsStatus=='베너' }">selected </c:if>>베너</option>
								</select>
							</td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="수정" onClick="fn_modify_products('${products.productsId }','productsStatus')" /></td>
						 </tr>
						<tr>
							<td>상품 번호</td>
							<td><input name="productsId" type="text" class="form-control" value="${products.productsId}" readonly="readonly"/></td>
						</tr>
						<tr>
							<td >상품명</td>
							<td><input name="productsName" type="text" class="form-control" value="${products.productsName}"/></td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="수정" onClick="fn_modify_products('${products.productsId }','productsName')" /></td>
						</tr>
						<tr>
							<td>상품 색상</td>
							<td><input name="productsColor" type="text" class="form-control" value="${products.productsColor}"/></td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="수정" onClick="fn_modify_products('${products.productsId }','productsColor')" /></td>
						</tr>
						<tr>
							<td>브랜드</td>
							<td><input name="productsBrand" type="text" class="form-control" value="${products.productsBrand}"/></td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="수정" onClick="fn_modify_products('${products.productsId }','productsBrand')" /></td>
						</tr>
						<tr>
							<td>상품 정가</td>
							<td><input name="originalPrice" type="text" class="form-control" value="${products.originalPrice}"/></td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="수정" onClick="fn_modify_products('${products.productsId }','originalPrice')" /></td>
						</tr>
						<tr>
							<td>상품 판매가격</td>
							<td><input name="salePrice" type="text" class="form-control" value="${products.salePrice}"/></td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="수정" onClick="fn_modify_products('${products.productsId }','salePrice')" /></td>
						</tr>
						<tr>
							<td>상품 구매포인트</td>
							<td><input name="productsPoint" type="text" class="form-control" value="${products.productsPoint}"/></td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="수정" onClick="fn_modify_products('${products.productsId }','productsPoint')" /></td>
						</tr>
						<tr>
							<td>상품 출시일</td>
							<td><input  name="publishedDate" type="date" class="form-control" value="<fmt:formatDate value='${products.publishedDate}' pattern='yyyy-MM-dd'/>"/></td>
							<td><input type="button" value="수정" class="btn btn-outline-primary btn-sm" onClick="fn_modify_products('${goods.goodsId}','publishedDate')" /></td>
						</tr>
						<tr>
							<td>배송방법</td>
							<td>
								<select name="deliveryMethod" class="form-control" style="padding-bottom:0; padding-top:0; height:35px">
									<option value="fast" <c:if test="${products.deliveryMethod=='당일배송' }">selected </c:if>>당일배송</option>
									<option value="staDel" <c:if test="${products.deliveryMethod=='일반배송' }">selected </c:if>>일반배송</option>
								</select>
							</td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="수정" onClick="fn_modify_products('${products.productsId }','deliveryMethod')" /></td>
						 </tr>
						<tr>
							<td>상품 배송비</td>
							<td><input name="deliveryPrice" type="text" class="form-control" value="${products.deliveryPrice}"/></td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="수정" onClick="fn_modify_products('${products.productsId }','deliveryPrice')" /></td>
						</tr>
						<tr>
							<td>상품 도착 예정일</td>
							<td><input name="deliveryDate" type="date" class="form-control" value="<fmt:formatDate value='${products.deliveryDate}' pattern='yyyy-MM-dd'/>"/></td>
							<td><input type="button" value="수정" class="btn btn-outline-primary btn-sm" onClick="fn_modify_products('${products.productsId }','deliveryDate')" /></td>
						</tr>
						<tr>
							<td>상품 이미지</td>
							<td>파일명 : ${products.productsImage} / <input name="productsImage" id="productsImage" type="file" /></td>
							<td><input type="button" value="수정" class="btn btn-outline-primary btn-sm" onClick="fn_modify_products_image('${products.productsId}')" /></td>
						</tr>
					</table>	
				</div>
				<div class="tab_content" id="tab2">상품 사이즈
					<div class="form-group">
						<textarea rows="50" cols="80" class="form-control" id="productsSize" name="productsSize"></textarea>
				    	<script>CKEDITOR.replace('productsSize');</script>
						<p align="left">
					    	<input type="button" value="수정" class="btn btn-outline-primary btn-sm" onClick="fn_modify_products('${products.productsId}','productsSize')" />
					    </p>				   
				    </div>
				</div>
				<div class="tab_content" id="tab3">브랜드 소개
					<div class="form-group">
						<textarea rows="50" cols="80" class="form-control" id="brandIntro" name="brandIntro"></textarea>
				    	<script>CKEDITOR.replace('brandIntro');</script>
				    	<p align="left">
					    	<input type="button" value="수정" class="btn btn-outline-primary btn-sm" onClick="fn_modify_products('${products.productsId}','brandIntro')" />
					    </p>
				    </div>
				</div>
				<div class="tab_content" id="tab4">상품 소개
					<div class="form-group">
						<textarea rows="50" cols="80" class="form-control" id="productsIntro" name="productsIntro"></textarea>
				    	<script>CKEDITOR.replace('productsIntro');</script>
				    	<p align="left">
					    	<input type="button" value="수정" class="btn btn-outline-primary btn-sm" onClick="fn_modify_products('${products.productsId}','brandIntro')" />
					    </p>
				    </div>
				
			</div>
			<p align="left">
				<a class="btn btn-sm btn-light btn-pill" href="${contextPath }/admin/products/adminMain">
								<i class="fi fi-arrow-start-slim"></i>
								돌아가기
							</a>
			</p>
			</div>
		</div>
		</form>
	</div>
</body>
</html>