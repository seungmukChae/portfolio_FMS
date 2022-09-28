<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
</head>
<body>
	 <div id="wrapper_content" class="d-flex flex-fill">



        <!-- main -->
        <main id="middle" class="flex-fill mx-auto">


          <!-- PAGE TITLE -->
          <header>
            
            <div class="row g-1 align-items-center">
              <div class="col">

                <h1 class="h4" align="center">Product list</h1>

              </div>

              <div class="col-auto">
                <a href="${contextPath}/admin/products/addNewProducts" role="button" class="btn btn-sm btn-primary d-inline-flex align-items-center">
                  <svg width="18px" height="18px" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <line x1="12" y1="5" x2="12" y2="19"></line>
                    <line x1="5" y1="12" x2="19" y2="12"></line>
                  </svg>
                  <span class="d-none d-sm-inline-block ps-2">Product</span>
                </a>
              </div>
            </div>

          </header>


          <div class="section p-0">
            <div class="card-header p-4">

              <div class="row g-3">

                <!-- options -->
                <div class="order-1 order-md-2 col-md-auto">
                  <div class="btn-group w-100" role="group" aria-label="Product options">
                    <input type="button" class="btn btn-sm small btn-secondary" value="Excel" onclick="location.href='${contextPath}/admin/products/productsExcelExport'"/>
                  </div>
                </div>

              </div>

            </div>

            <div class="card-body pt-1">
              
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
                      <th scope="col" class="small text-muted">PRODUCT_ID</th>
                      <th scope="col" class="small text-muted">PRODUCT_NAME</th>
                      <th scope="col" class="small text-muted">PRODUCT_STATUS</th>
                      <th scope="col" class="small text-muted text-center" style="width:150px">
                        <a href="#!" class="d-flex link-muted" title="order by inventory" aria-label="order by inventory">
                          <span class="d-flex flex-column lh-1">
                            <svg class="lh-1 text-primary" width="13px" height="13px" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">  
                              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 15l7-7 7 7"></path>
                            </svg>

                            <svg class="lh-1 mt-n1 text-muted" width="13px" height="13px" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">  
                              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                            </svg>
                          </span>
                          <span class="ms-2">SALE_PRICE</span>
                        </a>
                      </th>
                      <th scope="col" class="small text-muted" style="width:150px">
                        <a href="#!" class="d-flex link-muted" title="order by price" aria-label="order by price">
                          <span class="d-flex flex-column lh-1">
                            <svg class="lh-1 text-primary" width="13px" height="13px" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">  
                              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 15l7-7 7 7"></path>
                            </svg>

                            <svg class="lh-1 mt-n1 text-muted" width="13px" height="13px" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">  
                              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                            </svg>
                          </span>
                          <span class="ms-2">ORIGINAL_PRICE</span>
                        </a>
                      </th>
                      <th scope="col" class="small text-muted" style="width:60px"><!-- options --></th>
                    </tr>
                  </thead>
                  <tbody id="checkall-list">
                <c:choose>
    				<c:when test="${empty newProductsList }">			
					<tr>
				       <td colspan="8" class="fixed" align="center"><strong>조회된 상품이 없습니다.</strong></td>
				    </tr>
			 	</c:when>
			 	<c:otherwise>
     				<c:forEach var="products" items="${newProductsList}">
                    <!-- item -->
                    <tr>
                      <th scope="row"><!-- check -->
                        <div class="form-check"><!-- item -->
                          <input class="form-check-input form-check-input-primary" type="checkbox" value="">
                        </div>
                      </th>
                      <td class="position-relative"><!-- productId -->
                        ${products.productsId }
                      </td>
                      <td class="position-relative"><!-- productName -->
                        ${products.productsName }
                      </td>
                      <td class="text-left"><!-- PRODUCTSTATUS -->
                        ${products.productsStatus }
                      </td>
                      <td><!-- saleprice -->
                        <span class="d-block text-success">${products.salePrice }</span>
                      </td>
                      <td><!-- originalprice -->
                        ${products.originalPrice }
                      </td>
                      <td class="dropstart"><!-- options -->
                        <a class="btn btn-sm btn-light btn-icon btn-ghost text-muted rounded-circle dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" data-bs-offset="0,0">
                          <span class="group-icon">
                            <svg height="18px" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg" fill="currentColor"><path fill-rule="evenodd" d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"></path></svg>
                            <svg xmlns="http://www.w3.org/2000/svg" width="18px" height="18px" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                          </span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-clean">
                          <li>
                            <a class="dropdown-item" href="${contextPath}/admin/products/modifyProductsForm?productsId=${products.productsId}">
                              <svg class="text-muted" width="18px" height="18px" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M12 20h9"></path>
                                <path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path>
                              </svg>
                              <span>Edit</span>
                            </a>
                          </li>
                          <li>
                            <a class="dropdown-item" href="${contextPath}/admin/products/boardDelete">
                              <svg class="text-danger" width="18px" height="18px" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <polyline points="3 6 5 6 21 6"></polyline>
                                <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                <line x1="10" y1="11" x2="10" y2="17"></line>
                                <line x1="14" y1="11" x2="14" y2="17"></line>
                              </svg>
                              <span class="w-100">Delete</span>
                            </a>
                          </li>
                        </ul>
                      </td>
                    </tr>
                    <!-- end item -->

                    
							</c:forEach>
						</c:otherwise>
  					</c:choose>	
                  </tbody>
                </table>

              </div>

              <!-- pagination, selected items -->
              <div class="row">
                <div class="col py-3 text-center text-md-start">
                  
                  <!-- selected items -->
                  <div class="d-grid d-md-inline-block dropup">
                    <a class="btn btn-sm btn-primary dropdown-toggle" href="#" role="button" id="ddSelected" data-bs-toggle="dropdown" aria-expanded="false" data-bs-offset="0,0">
                      <span class="group-icon">
                        <svg height="18px" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg" fill="currentColor"><path fill-rule="evenodd" d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"></path></svg>
                        <svg xmlns="http://www.w3.org/2000/svg" width="18px" height="18px" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                      </span>
                      <span>Selected items</span>
                    </a>

                    <ul class="dropdown-menu dropdown-menu-clean my-2" aria-labelledby="ddSelected">
                      <li>
                        <a class="dropdown-item" href="#">
                          <svg class="text-danger" width="18px" height="18px" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <polyline points="3 6 5 6 21 6"></polyline>
                            <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                            <line x1="10" y1="11" x2="10" y2="17"></line>
                            <line x1="14" y1="11" x2="14" y2="17"></line>
                          </svg>
                          <span class="w-100">Delete</span>
                        </a>
                      </li>
                    </ul>

                  </div>

                </div>

              </div>

            </div>
          </div>


        </main>
        <!-- /main -->

      </div>
      <!-- /content -->



</body>
</html>