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
				alert("????????? ??????????????????.");
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
	         	alert("???????????? ??????????????????.");
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
			<h1>?????? ??????</h1>
		<div class="tab_container" id="container">
			<ul class="tabs">
				<li><a href="#tab1">?????? ??????</a></li>
				<li><a href="#tab2">?????? ?????????</a></li>
				<li><a href="#tab3">????????? ??????</a></li>
				<li><a href="#tab4">?????? ??????</a></li>
			</ul>
			<div class="tab_container">
				<div class="tab_content" id="tab1"> ?????? ??????
					<table class="table table-bordered table-hover">			
						<tr>
							<td width=200>?????? ??????</td>
							<td width=500>
								<select name="productsSort" class="form-control" style="padding-bottom:0; padding-top:0; height:35px">
									<option value="??????" <c:if test="${products.productsSort=='??????' }">selected </c:if>>??????
									<option value="??????" <c:if test="${products.productsSort=='??????' }">selected </c:if>>??????
									<option value="?????????" <c:if test="${products.productsSort=='?????????' }">selected </c:if>>?????????
									<option value="??????" <c:if test="${products.productsSort=='??????' }">selected </c:if>>??????
									<option value="????????????" <c:if test="${products.productsSort=='????????????' }">selected </c:if>>????????????
								</select>
							</td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="??????" onClick="fn_modify_products('${products.productsId }','productsSort')" /></td>
						</tr>
						<tr>
							<td>?????? ??????</td>
							<td>
								<select name="productsStatus" class="form-control" style="padding-bottom:0; padding-top:0; height:35px">
									<option value="newProducts" <c:if test="${products.productsStatus=='?????????' }">selected </c:if>>?????????</option>
									<option value="restocked" <c:if test="${products.productsStatus=='?????????' }">selected </c:if>>?????????</option>
									<option value="invalid" <c:if test="${products.productsStatus=='????????????' }">selected </c:if>>????????????</option>
									<option value="mainBanner" <c:if test="${products.productsStatus=='??????' }">selected </c:if>>??????</option>
								</select>
							</td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="??????" onClick="fn_modify_products('${products.productsId }','productsStatus')" /></td>
						 </tr>
						<tr>
							<td>?????? ??????</td>
							<td><input name="productsId" type="text" class="form-control" value="${products.productsId}" readonly="readonly"/></td>
						</tr>
						<tr>
							<td >?????????</td>
							<td><input name="productsName" type="text" class="form-control" value="${products.productsName}"/></td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="??????" onClick="fn_modify_products('${products.productsId }','productsName')" /></td>
						</tr>
						<tr>
							<td>?????? ??????</td>
							<td><input name="productsColor" type="text" class="form-control" value="${products.productsColor}"/></td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="??????" onClick="fn_modify_products('${products.productsId }','productsColor')" /></td>
						</tr>
						<tr>
							<td>?????????</td>
							<td><input name="productsBrand" type="text" class="form-control" value="${products.productsBrand}"/></td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="??????" onClick="fn_modify_products('${products.productsId }','productsBrand')" /></td>
						</tr>
						<tr>
							<td>?????? ??????</td>
							<td><input name="originalPrice" type="text" class="form-control" value="${products.originalPrice}"/></td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="??????" onClick="fn_modify_products('${products.productsId }','originalPrice')" /></td>
						</tr>
						<tr>
							<td>?????? ????????????</td>
							<td><input name="salePrice" type="text" class="form-control" value="${products.salePrice}"/></td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="??????" onClick="fn_modify_products('${products.productsId }','salePrice')" /></td>
						</tr>
						<tr>
							<td>?????? ???????????????</td>
							<td><input name="productsPoint" type="text" class="form-control" value="${products.productsPoint}"/></td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="??????" onClick="fn_modify_products('${products.productsId }','productsPoint')" /></td>
						</tr>
						<tr>
							<td>?????? ?????????</td>
							<td><input  name="publishedDate" type="date" class="form-control" value="<fmt:formatDate value='${products.publishedDate}' pattern='yyyy-MM-dd'/>"/></td>
							<td><input type="button" value="??????" class="btn btn-outline-primary btn-sm" onClick="fn_modify_products('${goods.goodsId}','publishedDate')" /></td>
						</tr>
						<tr>
							<td>????????????</td>
							<td>
								<select name="deliveryMethod" class="form-control" style="padding-bottom:0; padding-top:0; height:35px">
									<option value="fast" <c:if test="${products.deliveryMethod=='????????????' }">selected </c:if>>????????????</option>
									<option value="staDel" <c:if test="${products.deliveryMethod=='????????????' }">selected </c:if>>????????????</option>
								</select>
							</td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="??????" onClick="fn_modify_products('${products.productsId }','deliveryMethod')" /></td>
						 </tr>
						<tr>
							<td>?????? ?????????</td>
							<td><input name="deliveryPrice" type="text" class="form-control" value="${products.deliveryPrice}"/></td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="??????" onClick="fn_modify_products('${products.productsId }','deliveryPrice')" /></td>
						</tr>
						<tr>
							<td>?????? ?????? ?????????</td>
							<td><input name="deliveryDate" type="date" class="form-control" value="<fmt:formatDate value='${products.deliveryDate}' pattern='yyyy-MM-dd'/>"/></td>
							<td><input type="button" value="??????" class="btn btn-outline-primary btn-sm" onClick="fn_modify_products('${products.productsId }','deliveryDate')" /></td>
						</tr>
						<tr>
							<td>?????? ?????????</td>
							<td>????????? : ${products.productsImage} / <input name="productsImage" id="productsImage" type="file" /></td>
							<td><input type="button" value="??????" class="btn btn-outline-primary btn-sm" onClick="fn_modify_products_image('${products.productsId}')" /></td>
						</tr>
					</table>	
				</div>
				<div class="tab_content" id="tab2">?????? ?????????
					<div class="form-group">
						<textarea rows="50" cols="80" class="form-control" id="productsSize" name="productsSize"></textarea>
				    	<script>CKEDITOR.replace('productsSize');</script>
						<p align="left">
					    	<input type="button" value="??????" class="btn btn-outline-primary btn-sm" onClick="fn_modify_products('${products.productsId}','productsSize')" />
					    </p>				   
				    </div>
				</div>
				<div class="tab_content" id="tab3">????????? ??????
					<div class="form-group">
						<textarea rows="50" cols="80" class="form-control" id="brandIntro" name="brandIntro"></textarea>
				    	<script>CKEDITOR.replace('brandIntro');</script>
				    	<p align="left">
					    	<input type="button" value="??????" class="btn btn-outline-primary btn-sm" onClick="fn_modify_products('${products.productsId}','brandIntro')" />
					    </p>
				    </div>
				</div>
				<div class="tab_content" id="tab4">?????? ??????
					<div class="form-group">
						<textarea rows="50" cols="80" class="form-control" id="productsIntro" name="productsIntro"></textarea>
				    	<script>CKEDITOR.replace('productsIntro');</script>
				    	<p align="left">
					    	<input type="button" value="??????" class="btn btn-outline-primary btn-sm" onClick="fn_modify_products('${products.productsId}','brandIntro')" />
					    </p>
				    </div>
				
			</div>
			<p align="left">
				<a class="btn btn-sm btn-light btn-pill" href="${contextPath }/admin/products/adminMain">
								<i class="fi fi-arrow-start-slim"></i>
								????????????
							</a>
			</p>
			</div>
		</div>
		</form>
	</div>
</body>
</html>