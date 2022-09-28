<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    
	function reset_all() {
		$("#receiverName").val("");
		$("#hp1").val(0);
		$("#hp2").val("");
		$("#hp3").val("");
		$("#zipcode").val("");
		$("#roadAddress").val("");
		$("#jibunAddress").val("");
		$("#namujiAddress").val("");
		
	}

	
	function restore_all() {
		
		$("#receiverName").val($("#h_receiver_name").val());
		$("#hp1").val($("#h_hp1").val());
		$("#hp2").val($("#h_hp2").val());
		$("#hp3").val($("#h_hp3").val());
		$("#zipcode").val($("#h_zipcode").val());
		$("#roadAddress").val($("#h_roadAddress").val());
		$("#jibunAddress").val($("#h_jibunAddress").val());
		$("#namujiAddress").val($("#h_namujiAddress").val());
		
	}
	
	
	function fn_set_pay_method(method) {
		
		if (method == 'card') {
			$("#payOrderTel1").prop("disabled" , true);
			$("#payOrderTel2").prop("disabled" , true);
			
			$("#cardComName").prop("disabled"  , false);
			$("#cardPayMonth").prop("disabled" , false);
		}
		else {
			$("#payOrderTel1").prop("disabled" , false);
			$("#payOrderTel2").prop("disabled" , false);
			
			$("#cardComName").prop("disabled"  , true);
			$("#cardPayMonth").prop("disabled" , true);
		}
		
	}
	
	function fn_process_pay_order(){
		
		var deliveryAddress = "우편번호:" + $("#zipcode").val() + "<br>"+
							  "도로명 주소:" + $("#roadAddress").val() + "<br>" +
							  "[지번 주소:" + $("#jibunAddress").val() + "]<br>" + $("#namujiAddress").val();
		
		var payOrdererHpNum = "해당없음";
	  
	    if ( $("#payMethod").val() == "휴대폰결제"){
	    	payOrdererHpNum = $("#payOrderTel1").val(); + "-" + $("#payOrderTel2").val(); + "-" + $("#payOrderTel3").val(); 
	    }
		
	    var deliveryMessage = "";
	    if ($("#deliveryMessage").val() != "") {
	    	deliveryMessage = $("#deliveryMessage").val();
	    }
	    
	    var ordererHp = $("#ordererHp1").val() + "-" + $("#ordererHp2").val() + "-" + $("#ordererHp3").val();
	    
		var datas = {
				
			"memberId" 		  : $("#memberId").val(),
			"ordererName" 	  : $("#ordererName").val(),
			"ordererHp" 	  : ordererHp,
			"productsId" 	  : $("#productsId").val(),
			"productsName" 	  : $("#productsName").val(),
			"salePrice"	  	  : $("#salePrice").val(),
			"receiverName"    : $("#receiverName").val(),
		    "receiverHp1"     : $("#hp1").val(),
		    "receiverHp2"     : $("#hp2").val(),
		    "receiverHp3"     : $("#hp3").val(),
		    "deliveryAddress" : deliveryAddress,
		    "deliveryMessage" : deliveryMessage,
		    "deliveryMethod"  : $("#deliveryMethod").val(),
		    "orderProductsQty": $("#orderProductsQty").val(),
		    "payMethod"       : $("#payMethod").val(),
		    "cardComName"     : $("#cardComName").val(),
		    "cardPayMonth"    : $("#cardPayMonth").val(),
		    "payOrdererHpNum" : payOrdererHpNum,
		}
		
		$.ajax({
			type : "POST",
			url  : "${contextPath}/order/payToOrderProducts",
			data : datas ,
			success : function(){
				alert("주문이 성공적으로 완료 되었습니다.");
				location.href = "${contextPath}/main/main";
			}
		});
		
		
	}
</script>
</head>
<body>
<form data-s2t-disable="true">

		<div id="wrapper">

			<!-- CHECKOUT -->
			<div class="container pb-7 pt-5">

        <div class="row g-4">

          <div class="col-lg-7"><!-- account, address, payment -->

            <!-- 
              Checkout form -->
                          
				<input type="hidden" id="memberId" value="${orderer.memberId}">
				<input type="hidden" id="ordererName" value="${orderer.memberName}">
				<input type="hidden" id="ordererHp1" value="${orderer.hp1}" >
				<input type="hidden" id="ordererHp2" value="${orderer.hp2}" >
				<input type="hidden" id="ordererHp3" value="${orderer.hp3}" >
				<input type="hidden" id="productsId" value="${productsInfo.productsId}">
				<input type="hidden" id="productsName" value="${productsInfo.productsName}">
				<input type="hidden" id="salePrice" value="${productsInfo.salePrice}">
                
                <div class="card mb-3">
                  <div class="card-header fs-4 fw-bold py-3">Delivery</div>
                  <div class="card-body p-md-4">
                  
                  <!-- preview items -->

                <div class="card mb-3">
                  <div class="card-header fs-5 fw-bold">상품 정보</div>
                  <div class="card-body p-md-4">
                                          
                    <ul class="list-unstyled p-0 m-0">
														
<!-- item -->               
                      <li class="row align-items-center mb-2 pb-2">

                        <!-- image -->
                        <div class="col-3 col-md-2">
                          <div class="ratio ratio-1x1">
                            <span class="d-flex justify-content-center align-items-center">
                              <span class="d-flex justify-content-center align-items-center">
                              	<a href="${contextPath}/products/productsDetail?productsId=${productsInfo.productsId }">
					   		 		<img class="img-fluid rounded" alt="thumbnails" src="${contextPath}/thumbnails?productsImage=${productsInfo.productsImage}">
					 			 </a>
                              </span>
                            </span>
                          </div>
                        </div>

                        <div class="col-9 col-md-10">
                          <p class="mb-0 fw-medium text-truncate ">${orderProductsQty } &times; ${productsInfo.productsName }
                          	<input type="hidden" id="productsName" name="productsName" value="${productsInfo.productsName }" />
                          </p>
                          
                          
                          <p class="mb-0 d-flex align-items-center small">
                            <del class="fw-normal text-muted me-2">${productsInfo.originalPrice} 원</del>
                            <span class="fw-medium me-2">${productsInfo.salePrice} 원</span>
                         	</p>
							
                          <small class="d-block text-muted">배송비 : ${productsInfo.deliveryPrice} 원</small>
                        </div>

                      </li>
                      <!-- /item -->   

                    </ul>

                  </div>
                </div>

                    <div class="mb-5">

                    <div class="fs-5 mb-3 fw-bold">배송정보</div>
                      <div id="checkout-shipping" class="position-relative">

			                <div id="checkout-shipping-form" class="row g-3">

	                        <div class="col-sm-6">
	                          <div class="form-floating">
	                            <input type="text" class="form-control shadow-none" value="${orderer.memberName}" readonly>
	                          </div>
	                        </div>

	                        <div class="col-sm-6">
	                          <div class="form-floating">
	                            <input type="text" class="form-control shadow-none" value="${orderer.hp1} - ${orderer.hp2} - ${orderer.hp3}" readonly>
	                          </div>
	                        </div>
	                        
	                        <div class="col-sm-6">
	                          <div class="form-floating">
	                            <input type="text" class="form-control shadow-none" value="${orderer.email}" readonly>
	                          </div>
	                        </div>
	                        
	                        <hr class="bg-gray-300">
	                        
	                 <!-- 배송방법 -->
	                <div class="mb-1">
                	<div class="fs-5 mb-3 fw-bold">배송방법</div>
                                                    
                        <div class="form-check mb-2">
                          <input type="radio" name="deliveryMethod" id="deliveryMethod" value="당일배송" class="form-check-input form-check-input-primary" checked>
                          <label class="form-check-label user-select-none" for="rate-1">
                            당일배송
                            <small class="d-block text-muted">1-2일 소요</small>
                          </label>
                        </div>
                      
                        	<div class="form-check mb-2">
                          <input required type="radio" name="deliveryMethod" id="deliveryMethod" value="일반배송" class="form-check-input form-check-input-primary">
                          <label class="form-check-label user-select-none" for="rate-2">
                            일반배송
                            <small class="d-block text-muted">3일 이상 소요</small>
                          </label>
                        	</div>
                	</div>
                	
                	<!-- 배송메세지 -->
                  	<div class="mb-1">
                  	<div class="fs-5 mb-3 fw-bold">배송메세지</div>
                  		<div class="col-sm-6">
	                     <div class="form-floating">
	                         <input type="text" class="form-control shadow-none" name="deliveryMessage" id="deliveryMessage" />
	                     </div>
	                	</div>
	                </div>
                	
                	
                		
                  	<!-- 배송지 확인 -->
                    <div class="mb-1">
                	<div class="fs-5 mb-3 fw-bold">배송지 선택</div>
                                                    
                        <div class="form-check mb-2">
                          <input type="radio" name="deliveryPlace" id="userPlace" value="기본배송지" class="form-check-input form-check-input-primary" onClick="restore_all()" checked>
                          <label class="form-check-label user-select-none" for="rate-1">
                            기본배송지
                          </label>
                        </div>
                      
                        <div class="form-check mb-2">
                          <input required type="radio" name="deliveryPlace" id="newPlace" value="신규배송지" class="form-check-input form-check-input-primary" onClick="reset_all()">
                          <label class="form-check-label user-select-none" for="rate-2">
                            신규배송지
                          </label>
                        </div>
                  	</div>
                  	
                  	<!-- 배송지 확인 : 받는 사람 -->
                  	<div class="mb-1">
                  	<div class="fs-5 mb-3 fw-bold">받으시는 분</div>
                  		<div class="col-sm-6">
	                     <div class="form-floating">
	                         <input type="text" class="form-control shadow-none" value="${orderer.memberName}">
	                         <input type="hidden" id="h_orderer_name" name="h_orderer_name"  value="${orderer.memberName }" /> 
						     <input type="hidden" id="h_receiver_name" name="h_receiver_name"  value="${orderer.memberName }" />
	                     </div>
	                	</div>
	                </div>
                  	
                  	<!-- 배송지확인 : 핸드폰번호 -->
                	<div class="mb-1">
                		<div class="fs-5 mb-3 fw-bold">핸드폰 번호</div>
                      	<div id="checkout-shipping-rate" class="position-relative">
                      		<div class="col-sm-6">
	                          <div class="form-floating">
	                          <select id="hp1" name="hp2" class="form-select form-select-sm mb-3">
	                          	<option>없음</option>
								<option value="010" selected>010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
	                          </select>
	                          - <input class="form-control shadow-none" type="text" id="hp2" name="hp2" value="${orderer.hp2 }">
	                          - <input class="form-control shadow-none" type="text" id="hp3" name="hp3" value="${orderer.hp3 }">
	                         	<input type="hidden" id="h_hp1" name="h_hp1" value="${orderer.hp1 }" /> 
								<input type="hidden" id="h_hp2" name="h_hp2" value="${orderer.hp2 }" />
								<input type="hidden" id="h_hp3" name="h_hp3" value="${orderer.hp3 }" />
								<c:set  var="orderer_hp" value="${orderer.hp1}-${orderer.hp2}-${orderer.hp3}"/>
	                          </div>
	                   	 	</div>
                  		</div>
                  	</div>
                  	
                  	
                  	<!-- 배송지확인 : 주소 -->
                	<div class="mb-1">
                  		<div class="fs-5 mb-3 fw-bold">주소</div>
                      	<div id="checkout-shipping-rate" class="position-relative">
                      		<div class="col-sm-6">
	                          <div class="form-floating">
	                          	<input type="text" id="zipcode" name="zipcode" class="form-control shadow-none" value="${orderer.zipcode}">
	                          	<a href="javascript:execDaumPostcode()">우편번호 검색</a> <br>
	                          </div>
	                          
	                          <p class="bg-gray-200"> </p>
	                          <div class="form-floating">
	                          지번 주소 : <br>
	                          	<input type="text" id="roadAddress" name="roadAddress" class="form-control shadow-none" value="${orderer.roadAddress}">
	                          </div>
	                          
	                          <p class="bg-gray-200"> </p>
	                          <div class="form-floating">
	                          도로명 주소 : <br>
	                          	<input type="text" id="jibunAddress" name="jibunAddress" class="form-control shadow-none" value="${orderer.jibunAddress}">
	                          </div>
	                          
	                          <p class="bg-gray-200"> </p>
	                          <div class="form-floating">
	                          나머지 주소 : <br>
	                          	<input type="text" id="namujiAddress" name="namujiAddress" class="form-control shadow-none" value="${orderer.namujiAddress}">
	                          </div>
	                          	<input type="hidden" id="h_zipcode" name="h_zipcode" value="${orderer.zipcode }" /> 
								<input type="hidden"  id="h_roadAddress" name="h_roadAddress"  value="${orderer.roadAddress }" /> 
							 	<input type="hidden"  id="h_jibunAddress" name="h_jibunAddress" value="${orderer.jibunAddress }" /> 
							 	<input type="hidden"  id="h_namujiAddress" name="h_namujiAddress" value="${orderer.namujiAddress }" />
	                   	 	</div>
                  		</div>
                  	</div>

                </div>
                </div>
                </div>
                </div>
                </div>

                <!-- 
                  
                  Submit
                  desktop only 

                -->

                <!-- 
                  
                  Submit
                  mobile only 

                -->
                <div class="d-flex d-lg-none align-items-center position-fixed w-100 bottom-0 start-0 end-0 z-index-2 bg-white border-top p-2">

                  <div class="w-100 fw-medium lh-1">
                  	<span class="small d-block">전체금액</span>
                    <span class="h5 d-block">${productsInfo.salePrice * orderProductsQty + productsInfo.deliveryPrice} 원</span>
                  </div>

                  <button type="submit" class="btn btn-sm btn-primary flex-none" data-form-submit='{"id":"action","value":"checkout:process","delay":800}'>
                    주문하기
                  </button>

                </div>


          </div>
          
          <!-- order summary -->
          <div class="col-lg-5 mb-4">

            <div class="sticky-kit z-index-0">

            <!-- #cart-summary -->
            <div class="card text-gray-800">
              <div class="card-header border-light fs-5 fw-bold mx-3 px-0 py-4">주문서</div>
              <div class="card-body p-md-4">
                              
	              <div id="cart-summary">

	                <div class="d-flex justify-content-between">
	                  <span>상품 가격:</span>
	                  <span class="text-end">${productsInfo.salePrice} 원</span>
	                </div>

	                <!-- shipping -->
	                <div class="clearfix">
	                  배송비: 
	                  <span id="shipping-amount" class="float-end">${productsInfo.deliveryPrice} 원</span>
	                  <!-- <span id="shipping-free" class="float-end text-success fw-medium">Free</span> -->
	                  <!-- <span id="shipping-undefined" class="float-end text-muted">&ndash;</span> -->
	                </div>

	                <hr class="bg-gray-300">

	                <div class="fw-medium lh-1 mt-4">
	                  <span class="fs-6 d-block">Total :</span> 
	                  <span class="h3 d-block">${productsInfo.salePrice * orderProductsQty + productsInfo.deliveryPrice} 원
					  	<input type="hidden" id="totalOrderProductsPrice" value="${productsInfo.salePrice * orderProductsQty + productsInfo.deliveryPrice}"></span>
	                </div>

	                <small class="d-block text-gray-600">
	                  <span>예상 적립금 : </span> <span class="text-primary">${productsInfo.productsPoint }</span>  
	                </small>

	              </div>

              </div>
            </div>
            <hr class="bg-gray-300">
            
            <!-- #결재창 -->
            <div class="card text-gray-800">
              <div class="card-header border-light fs-5 fw-bold mx-3 px-0 py-4">결제정보</div>
              <div class="card-body p-md-4">
                              
	              <div id="cart-summary">

	                <div class="form-check mb-2"> 신용카드 결제
	                  <input type="radio" name="payMethod" id="payMethod" value="신용카드" class="form-check-input form-check-input-primary" onclick="fn_set_pay_method('card')" checked>
                          <p class="bg-gray-300"> </p>
                          <label class="form-check-label user-select-none" for="rate-1">
                          카드선택 : 
                          </label>
                         	<p class="bg-gray-200"> </p>
	                  		<div class="form-floating">
	                  			<select id="cardComName" name="cardComName" class="form-select form-select-sm mb-3">
	                  				<option value="삼성" selected>삼성</option>
									<option value="하나SK">하나SK</option>
									<option value="현대">현대</option>
									<option value="KB">KB</option>
									<option value="신한">신한</option>
									<option value="롯데">롯데</option>
									<option value="BC">BC</option>
									<option value="시티">시티</option>
									<option value="NH농협">NH농협</option>
	                  			</select>	
	                  		</div>
	                  		
	                      <label class="form-check-label user-select-none" for="rate-1">
                          할부기간 : 
                          </label>
                          <p class="bg-gray-200"> </p>
                          <div class="form-floating">
                          	<select id="cardPayMonth" name="cardPayMonth" class="form-select form-select-sm mb-3">
                          		<option value="일시불" selected>일시불</option>
								<option value="2개월">2개월</option>
								<option value="3개월">3개월</option>
								<option value="4개월">4개월</option>
								<option value="5개월">5개월</option>
								<option value="6개월">6개월</option>
                          	</select>
                          </div>
	                </div>
	                
	                <div class="form-check mb-2"> 모바일 결재
	                	<input type="radio" name="payMethod" id="payMethod" value="핸드폰결제(간편결제)" class="form-check-input form-check-input-primary" onclick="fn_set_pay_method('phone')" >
                          <p class="bg-gray-300"> </p>
                          <label class="form-check-label user-select-none" for="rate-1">
                          핸드폰 번호 입력 : 
                          </label>
                         	<p class="bg-gray-200"> </p>
	                		<input class="form-control shadow-none" type="text" id="payOrderTel1" name="payOrderTel1" > -
	                		<input class="form-control shadow-none" type="text" id="payOrderTel2" name="payOrderTel2" > -
	                		<input class="form-control shadow-none" type="text" id="payOrderTel3" name="payOrderTel3" >
	                </div>
	              </div>

              </div>
            </div>
             <!-- /#결재창 -->
	
			<!-- 결제 버튼 -->
			<div align="center">
			<br>
			<a href="javascript:fn_process_pay_order();">  
				<img width="125" alt="" src="${contextPath}/resources/images/btn_gulje.jpg">
			</a> 
		</div>
				
            </div>

          </div>
          
          </div>

        </div>
			</div>
			<!-- /CHECKOUT -->
</form>	
</body>
</html>