<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<c:if test='${invalidMember eq true}'>
	<script>
		$().ready(function(){
			alert("아이디와 비밀번호를 확인하세요.");
		});
	</script>
</c:if>
</head>
<body>
<!-- PAGE TITLE -->
      <div class="section">
        <div class="px-2 max-w-800 mx-auto text-center">

          <h1 class="display-4 fw-bold">
            로그인
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
              <form novalidate action="${contextPath}/member/login" method="POST" class="bs-validate p-4 p-md-5 card rounded-xl">


                
                <p class="text-danger">
                  앗! 다시 확인해주세요.
                </p>
                


                <div class="form-floating mb-3">
                  <input required placeholder="아이디를 입력해주세요." id="memberId" name="memberId" type="text" class="form-control">
                  <label for="memberId">아이디</label>
                </div>

                <div class="input-group-over mb-3">
                  <div class="form-floating">
                    <input required placeholder="비밀번호를 입력해주세요." id="memberPw" name="memberPw" type="password" class="form-control">
                    <label for="memberPw">비밀번호</label>
                  </div>

                  <a href="shop-page-password.html" class="btn smaller link-normal">
                    <span class="fw-bold">재설정</span>
                  </a>

                </div>



                <div class="row">

                  <div class="col-12 col-md-6 mt-4">
                    <button type="submit" class="btn btn-primary w-100 fw-medium">
                      로그인
                    </button>
                  </div>

                  <div class="col-12 col-md-6 mt-4 text-align-end text-center-xs">
                    <a href="${contextPath}/member/memberJoin" class="btn px-0 link-normal">
                      계정이 없으신가요?
                    </a>
                  </div>

                </div>

              </form>


              <!-- alternate -->
              <div class="px-4 px-md-5 pb-4 pb-md-5 pt-4 bg-white card rounded-xl mt-3">

                <div class="d-flex align-items-center justify-content-between w-100 max-w-250 mx-auto mb-3 small text-muted">
                  <hr class="w-100">
                  <span class="flex-none px-4">간편 로그인</span>
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

            <div class="col-12 col-sm-10 col-md-8 col-xl-5 order-2 order-xl-1 mx-auto">

              <h2 class="h5 fw-bold mb-4">가입 혜택!</h2>

              <!-- 1 -->
              <div class="d-flex align-items-center mb-2">
                <svg class="text-primary" width="34" height="34" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 16">  
                  <path d="M3 2v4.586l7 7L14.586 9l-7-7H3zM2 2a1 1 0 0 1 1-1h4.586a1 1 0 0 1 .707.293l7 7a1 1 0 0 1 0 1.414l-4.586 4.586a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 2 6.586V2z"></path>  
                  <path d="M5.5 5a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm0 1a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3zM1 7.086a1 1 0 0 0 .293.707L8.75 15.25l-.043.043a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 0 7.586V3a1 1 0 0 1 1-1v5.086z"></path>
                </svg>
                <h3 class="h5 px-1 mb-0 mx-2">
                  쿠폰
                </h3>
              </div>

              <p class="mb-4">
               	우리는 정기적으로 회원들에게 쿠폰을 드리고 있습니다.
              </p>


              <!-- 2 -->
              <div class="d-flex align-items-center mb-2">
                <svg class="text-primary" width="34" height="34" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 16">  
                  <path d="M0 3.5A1.5 1.5 0 0 1 1.5 2h9A1.5 1.5 0 0 1 12 3.5V5h1.02a1.5 1.5 0 0 1 1.17.563l1.481 1.85a1.5 1.5 0 0 1 .329.938V10.5a1.5 1.5 0 0 1-1.5 1.5H14a2 2 0 1 1-4 0H5a2 2 0 1 1-3.998-.085A1.5 1.5 0 0 1 0 10.5v-7zm1.294 7.456A1.999 1.999 0 0 1 4.732 11h5.536a2.01 2.01 0 0 1 .732-.732V3.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5v7a.5.5 0 0 0 .294.456zM12 10a2 2 0 0 1 1.732 1h.768a.5.5 0 0 0 .5-.5V8.35a.5.5 0 0 0-.11-.312l-1.48-1.85A.5.5 0 0 0 13.02 6H12v4zm-9 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm9 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"></path>
                </svg>
                <h3 class="h5 px-1 mb-0 mx-2">
                  
                </h3>
              </div>

              <p class="mb-4">
                우리는 지속적으로 배송을 트래킹하여 <br>
                회원들이 쉽게 확인할 수 있게 도와줍니다.
              </p>


              <!-- 3 -->
              <div class="d-flex align-items-center mb-2">
                <svg class="text-primary" width="34" height="34" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 16">  
                  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"></path>
                </svg>
                <h3 class="h5 px-1 mb-0 mx-2">
                  좋은 상품
                </h3>
              </div>

              <p class="mb-4">
                우리는 최상의 컨디션 상품을 정직하게 선별하여
                회원들에게 최고의 만족감을 선사하고 있습니다.
              </p>

            </div>

          </div>

        </div>
      </div>
      <!-- / -->



</body>
</html>