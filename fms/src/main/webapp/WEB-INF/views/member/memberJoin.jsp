<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberJoin</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

	function formValidationCheck() {
		
		var memberName = document.getElementById("memberName");
		if (memberName.value == ""){
			alert("이름을 반드시 입력해야 합니다.");
			memberName.focus();
			return false;
		}
		
		var memberId = document.getElementById("memberId");
		if (memberId.value == ""){
			alert("아이디를 반드시 입력해야 합니다.");
			memberId.focus();
			return false;
		}
		
		var memberPw = document.getElementById("memberPw");
		if (memberPw.value == ""){
			alert("비밀번호를 반드시 입력해야 합니다.");
			memberPw.focus();
			return false;
		}
		
		var hp2 = document.getElementById("hp2");
		if (hp2.value == ""){
			alert("핸드폰번호를 반드시 입력해야 합니다.");
			hp2.focus();
			return false;
		}
		
		var hp3 = document.getElementById("hp3");
		if (hp3.value == ""){
			alert("핸드폰번호를 반드시 입력해야 합니다.");
			hp3.focus();
			return false;
		}
		
		var email = document.getElementById("email");
		if (email.value == ""){
			alert("이메일을 반드시 입력해야 합니다.");
			email.focus();
			return false;
		}
		
		var zipcode = document.getElementById("zipcode");
		if (zipcode.value == ""){
			alert("주소를 반드시 입력해야 합니다.");
			zipcode.focus();
			return false;
		}
		
	}
	
	function execDaumPostcode() {
	    	new daum.Postcode({
	        	oncomplete: function(data) {
	
	            var fullRoadAddr = data.roadAddress; 
	            var extraRoadAddr = ''; 
	
	            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            if (data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            if (extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	            if (fullRoadAddr !== ''){
	                fullRoadAddr += extraRoadAddr;
	            }
	
	            document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('roadAddress').value = fullRoadAddr;
	            document.getElementById('jibunAddress').value = data.jibunAddress;
	          
	        }
	    }).open();
	}

	$().ready(function() {
		
	$("#btnOverlapped").click(function(){
			
		    var memberId = $("#memberId").val();
		   
		    if (memberId == ''){
		   		alert("ID를 입력하세요");
		   		return;
		    }
		   
		    $.ajax({
		       type : "get",
		       url  : "${contextPath}/member/overlapped",
		       data : {"memberId" : memberId},
		       success : function (data){
		          if (data == 'false'){
					  alert("사용할 수 있는 ID입니다.");
		          }
		          else {
		          	  alert("사용할 수 없는 ID입니다.");
		          }
		       }
		    });
		    
		 });
				
				$("#memberPw").keyup(function() {
					$("#pwCheck").html('');
				});
				
				$("#memberPwChk").keyup(function(){
					
					if($('#memberPw').val() != $('#memberPwChk').val()) {
						$('#pwCheck').html("불일치<br><br>");
						$('#chkNotice').attr('color', '#f82a2aa3');
					}
					else {
						$('#pwCheck').html("일치<br><br>");
						$('#chkNotice').attr('color', '#199894b3');
					}
					
				});
	});
	
	
</script>
</head>
<body>
 <!-- PAGE TITLE -->
      <div class="section">
        <div class="px-2 max-w-800 mx-auto text-center">

          <h1 class="display-4 fw-bold">
            회원가입
          </h1>
        </div>
      </div>
      <!-- /PAGE TITLE -->

      <!-- -->
      <div class="section pt-0">
        <div class="container">

          <div class="row g-4 g-xl-5 justify-content-between">

            <div class="col-12 col-sm-10 col-md-8 col-xl-6 order-1 order-xl-2 mx-auto mb-5">


              <!-- form -->
              <form class="bs-validate p-4 p-md-5 card rounded-xl" novalidate method="post" action="${contextPath }/member/addMember" method="post" enctype="multipart/form-data" onsubmit="return formValidationCheck()">

				<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">이름</label>
                  <input required placeholder="이름" id="memberName" name="memberName" type="text" class="form-control">
                </div>

                <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">아이디</label>
                  <input required placeholder="아이디" id="memberId" name="memberId" type="text" class="form-control">
               		<input type="button" id="btnOverlapped" class="btn btn-outline-primary btn-sm" value="중복확인" />
                </div>

                <div class="input-group-over mb-3">
                <label for="exampleFormControlInput1" class="form-label">비밀번호</label>
                  <div class="form-floating">
                    <input required placeholder="비밀번호" id="memberPw" type="password" class="form-control" name="memberPw">
                  </div>
                </div>
                
                <div class="input-group-over mb-3">
                  <div class="form-floating">
                    <input required placeholder="비밀번호 재확인" id="memberPwChk" type="password" class="form-control">
                    <font id="pwCheck" size = "2"></font>
                  </div>
                </div>
				
				<div>
				<label for="exampleFormControlInput1" class="form-label">성별</label>
				<div class="form-check mb-2">
                      <input class="form-check-input form-check-input-primary" type="radio" name="memberGender" id="g1" checked>
                      <label class="form-check-label" for="g1">
                        남성
                      </label>
                      
                    </div>
				<div class="form-check mb-2">
                      <input class="form-check-input form-check-input-primary" type="radio" name="memberGender" id="g2">
                      <label class="form-check-label" for="g2">
                        여성
                      </label>
                    </div>
                </div>
                <br>
				
				<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">핸드폰 번호</label>
                  <select id="hp1" name="hp1" class="form-select">
                  	<option value="010" selected>010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
                  </select> - 
                   <input id="hp2" name="hp2" type="text" class="form-control"/> -
                   <input id="hp3" name="hp3" type="text" class="form-control"/>
                <input id="smsstsYn" type="checkbox" name="smsstsYn"  value="Y" checked/> SMS 소식 수신
                </div>
                
				<div class="mb-3">
                  <label for="exampleFormControlInput1" class="form-label">Email address</label>
                  <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com">
                  <input id="smsstsYn" type="checkbox" name="smsstsYn"  value="Y" checked/> EMAIL 소식 수신
                </div>
                
                <div class="주소">
                <label for="exampleFormControlInput1" class="form-label">주소</label>
                <label class="small mb-1" for="zipcode"></label>
                <input class="form-control"  size="70px"  type="text" placeholder="우편번호" id="zipcode" name="zipcode" >
                <input type="button" class="btn btn-outline-primary btn-sm" onclick="javascript:execDaumPostcode()" value="검색">
                <div></div>
                <input type="text" class="form-control" id="roadAddress"  name="roadAddress" placeholder="도로명 주소"> 
				<input type="text" class="form-control" id="jibunAddress" name="jibunAddress" placeholder="지번 주소"> 
				<input type="text" class="form-control" name="namujiAddress" placeholder="나머지 주소"> <br>
                </div>
                
                <!-- GDPR CONSENT 
                <div class="mb-3 border p-3 rounded">

                  <div class="form-check">
                    <input required class="form-check-input" id="contact_gdpr1" name="contact_gdpr" type="checkbox" value="1">
                    <label class="form-check-label" for="contact_gdpr">
                    <a class="text-decoration-none" href="shop-page-terms.html" target="_blank">이용약관</a>동의
                    </label>
                  </div>
                  <div class="form-check">
                    <input required class="form-check-input" id="contact_gdpr2" name="contact_gdpr" type="checkbox" value="1">
                    <label class="form-check-label" for="contact_gdpr">
                    <a class="text-decoration-none" href="shop-page-terms.html" target="_blank">개인정보 수집 및 이용정보</a>동의
                    </label>
                  </div>
                  <div class="form-check">
                    <input required class="form-check-input" id="contact_gdpr3" name="contact_gdpr" type="checkbox" value="1">
                    <label class="form-check-label" for="contact_gdpr">
                    <a class="text-decoration-none" href="shop-page-terms.html" target="_blank">위치기반 서비스</a>동의
                    </label>
                  </div>

                </div>
                
                
                -->

                <div class="row">

                  <div class="col-12 col-md-6">
                    <input type="submit" value="가입하기" class="btn btn-primary w-100 fw-medium">
                  </div>


                </div>

              </form>


              <!-- alternate -->
              <div class="px-4 px-md-5 pb-4 pb-md-5 pt-4 bg-white card rounded-xl mt-3">

                <div class="d-flex align-items-center justify-content-between w-100 max-w-250 mx-auto mb-3 small text-muted">
                  <hr class="w-100">
                  <span class="flex-none px-4">OR</span>
                  <hr class="w-100">
                </div> 

                <div class="row">

                  <div class="col-6">
                    <a href="#" class="btn btn-sm w-100 btn-facebook transition-hover-top mt-1" rel="noopener">
                      facebook
                    </a>
                  </div>

                  <div class="col-6">
                    <a href="#" class="btn btn-sm w-100 bg-googleplay transition-hover-top mt-1 text-white" rel="noopener">
                      google
                    </a>
                  </div>

                </div>

              </div> 

            </div>

          </div>

        </div>
      </div>
      <!-- / -->




      <!-- INFO BOX -->
      <div class="bg-gray-200">
        <div class="container py-3">

          <div class="row g-4">

            <div class="col-12 col-sm-6 col-lg-3 d-flex py-2 py-sm-3 py-lg-4">

              <img width="60" height="60" class="lazy" data-src="demo.files/svg/ecommerce/money_bag.svg" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="...">
              <div class="ps-3">
                <h3 class="fs-5 mb-1">Money Back</h3>
                <p class="m-0">Love it! Use it! Reuse it!</p>
              </div>

            </div>

            <div class="col-12 col-sm-6 col-lg-3 d-flex py-2 py-sm-3 py-lg-4">

              <img width="60" height="60" class="lazy" data-src="demo.files/svg/ecommerce/free-delivery-truck.svg" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="...">
              <div class="ps-3">
                <h3 class="fs-5 mb-1">Free Shipping</h3>
                <p class="m-0">Shipping is on us</p>
              </div>

            </div>

            <div class="col-12 col-sm-6 col-lg-3 d-flex py-2 py-sm-3 py-lg-4">

              <img width="60" height="60" class="lazy" data-src="demo.files/svg/ecommerce/24-hours-phone-service.svg" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="...">
              <div class="ps-3">
                <h3 class="fs-5 mb-1">Free Support</h3>
                <p class="m-0">24/24 available</p>
              </div>

            </div>

            <div class="col-12 col-sm-6 col-lg-3 d-flex py-2 py-sm-3 py-lg-4">

              <!-- link example -->
              <a href="#" class="text-dark text-decoration-none d-flex">

                <img width="60" height="60" class="lazy" data-src="demo.files/svg/ecommerce/handshake.svg" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="...">
                <div class="ps-3">
                  <h3 class="fs-5 mb-1">Best Deal</h3>
                  <p class="m-0">Quality guaranteed</p>
                </div>

              </a>

            </div>

          </div>

        </div>
      </div>
      <!-- /INFO BOX -->

</body>
</html>