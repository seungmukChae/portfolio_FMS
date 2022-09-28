<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
</head>
<script>
	
	function fn_modify_order_state(orderId , selectId) {
		
		$.ajax({
			type : "get",
			url : "${contextPath}/admin/order/modifyDeliveryState",
			data : {
				"orderId" : orderId,
				"deliveryState" : document.getElementById(selectId).value
			},
			success : function() {
				alert("주문 정보를 수정했습니다.");
				location.href = "${contextPath}/admin/order/adminOrderMain";
			}
					
		}); 		
	}

</script>
<body>
	 <div id="wrapper_content" class="d-flex flex-fill">

        <!-- main -->
        <main id="middle" class="flex-fill mx-auto">


          <!-- PAGE TITLE -->
          <header>
            
            <div class="row g-1 align-items-center">
              <div class="col">

                <h1 class="h4" align="center">Order list</h1>

              </div>
            </div>

          </header>


          <div class="section p-0">
            <div class="card-header p-4">

              <div class="row g-3">

                <!-- options -->
                <div class="order-1 order-md-2 col-md-auto">
                  <div class="btn-group w-100" role="group" aria-label="Product options">
                    <input type="button" class="btn btn-sm small btn-secondary" value="Excel" onclick="location.href='${contextPath}/admin/order/orderExcelExport'"/>
                  </div>
                </div>

              </div>

              <!-- item list -->
              <div class="table-responsive-md">

                <table class="table table-align-middle" role="grid" aria-describedby="mobile-page-info">
                  <thead>
                    <tr>
                      <th scope="col" style="width:46px">
                        <div class="form-check"><!-- check all -->
                          <input data-checkall-container="#checkall-list" class="form-check-input" type="checkbox" value="1">
                        </div>
                      </th>
                      <th scope="col" class="small text-muted">주문번호</th>
                      <th scope="col" class="small text-muted">주문시간</th>
                      <th scope="col" class="small text-muted">주문내역</th>
                      <th scope="col" class="small text-muted">배송상태</th>
                      <th scope="col" class="small text-muted">배송수정</th>
                      <th scope="col" class="small text-muted" style="width:60px"><!-- options --></th>
                    </tr>
                  </thead>
                  <tbody id="checkall-list">
                  <c:choose>
    				<c:when test="${empty newOrderList }">			
					<tr>
				       <td colspan="8" class="fixed"><strong>주문한 상품이 없습니다.</strong></td>
				    </tr>
			 	</c:when>
			 	<c:otherwise>
     				<c:forEach var="item" items="${newOrderList}" varStatus="i">
                    <!-- item -->
                    <tr>
                      <th scope="row"><!-- check -->
                        <div class="form-check"><!-- item -->
                          <input class="form-check-input form-check-input-primary" type="checkbox" value="">
                        </div>
                      </th>
                      <td class="position-relative"><!-- orderId -->
                       ${item.orderId}
                      </td>
                      <td class="position-relative"><!-- payOrderTime -->
                       <fmt:formatDate value="${item.payOrderTime}" pattern="yyyy-MM-dd HH:mm"/> 
                      </td>
                      <td class="position-relative"><!-- PRODUCTSTATUS -->
                        <a href="${contextPath}/admin/order/orderDetail?orderId=${item.orderId}">
						     <strong>주문자 : ${item.ordererName}</strong><br>
						     <strong>주문자 연락처 : ${item.ordererHp}</strong><br><br>
						     <strong>수령자 : ${item.receiverName}</strong><br>
						     <strong>수령자 전화번호 : ${item.receiverHp1}-${item.receiverHp2}-${item.receiverHp3}</strong><br>
						     <strong>주문상품명(수량) : ${item.productsName}(${item.orderProductsQty})</strong><br>
			    		 </a> 
                      </td>
                      <td><!-- 배송 -->
                        <c:if test="${item.deliveryState == 'deliveryPrepared'}"> 
						<div class="position-relative">배송준비중</div>
						</c:if>
						<c:if test="${item.deliveryState == 'delivering'}"> 
						<div class="position-relative">배송중</div>
						</c:if>
						<c:if test="${item.deliveryState == 'finishedDelivering'}"> 
							<div class="position-relative">배송완료</div>
						</c:if>
						<c:if test="${item.deliveryState == 'cancelOrder'}"> 
							<div class="position-relative">주문취소</div>
						</c:if>
						<c:if test="${item.deliveryState == 'returningProducts'}"> 
							<div class="position-relative">반품</div>
						</c:if>
                      </td>
                      <td>
                        <select id="deliveryState${i.index }">
						<option value="deliveryPrepared" <c:if test="${item.deliveryState=='deliveryPrepared' }"> selected </c:if>>배송준비중</option>
						<option value="delivering" <c:if test="${item.deliveryState=='delivering' }"> selected </c:if>>배송중</option>
						<option value="finishedDelivering" <c:if test="${item.deliveryState=='finishedDelivering' }"> selected </c:if>>배송완료</option>
						<option value="cancelOrder" <c:if test="${item.deliveryState=='cancelOrder' }"> selected </c:if>>주문취소</option>
						<option value="returningGoods" <c:if test="${item.deliveryState=='returningGoods' }"> selected </c:if>>반품</option>
						</select>
						<input type="button" value="배송수정" class="btn btn-outline-blue btn-xs" onclick="fn_modify_order_state('${item.orderId}' ,'deliveryState${i.index}')" />
                      </td>
                    </tr>
                    <!-- end item -->

                    
							</c:forEach>
						</c:otherwise>
  					</c:choose>	
                  </tbody>
                </table>

              </div>

            </div>
          </div>


        </main>
        <!-- /main -->

      </div>
      <!-- /content -->



</body>
</html>