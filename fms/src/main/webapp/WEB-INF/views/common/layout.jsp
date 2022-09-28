<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title><tiles:insertAttribute name="title"/></title>
    <meta name="description" content="...">

    <meta name="viewport" content="width=device-width, maximum-scale=5, initial-scale=1">
    <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->

    <!-- up to 10% speed up for external res -->
    <link rel="dns-prefetch" href="https://fonts.googleapis.com/">
    <link rel="dns-prefetch" href="https://fonts.gstatic.com/">
    <link rel="preconnect" href="https://fonts.googleapis.com/">
    <link rel="preconnect" href="https://fonts.gstatic.com/">
    <!-- preloading icon font is helping to speed up a little bit -->
    <link rel="preload" href="${contextPath }/resources/html_frontend/assets/fonts/flaticon/Flaticon.woff2" as="font" type="font/woff2" crossorigin>

    <link rel="stylesheet" href="${contextPath }/resources/html_frontend/assets/css/core.min.css">
    <link rel="stylesheet" href="${contextPath }/resources/html_frontend/assets/css/vendor_bundle.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;700&display=swap" rel="stylesheet">

    <!-- favicon -->
    <link rel="shortcut icon" href="${contextPath }/resources/html_frontend/favicon.ico">
    <link rel="apple-touch-icon" href="${contextPath }/resources/html_frontend/demo.files/logo/icon_512x512.png">

    <link rel="manifest" href="${contextPath }/resources/html_frontend/assets/images/manifest/manifest.json">
    <meta name="theme-color" content="#377dff">

  </head>

  <!--
     +++ +++ +++ +++ +++ +++ +++ +++ +++ +++ +++ +++ +++ +++ +++ +++ +++ +++ +++
      USED PLUGINS:

        SOW : Countdown timer
        /documentation/plugins-sow-timer-countdown.html

        Vendor : Swiper Slider
        /documentation/plugins-vendor-swiper.html

        Vendor : Typed
        /documentation/plugins-vendor-typed.html

     +++ +++ +++ +++ +++ +++ +++ +++ +++ +++ +++ +++ +++ +++ +++ +++ +++ +++ +++
  -->
  <body>

    <div id="wrapper">


      <!-- Header -->
    	<tiles:insertAttribute name="header"/>
      <!-- /Header -->

	  <!-- Header -->
      <!-- /Header -->

     <!-- Main(직접만듬) -->
     	<tiles:insertAttribute name="body"/>
     <!-- /Main -->



      <!-- Footer -->
 		<tiles:insertAttribute name="footer"/>
      <!-- /Footer -->


    </div><!-- /#wrapper -->


    <!-- 
      SHOP AJAX MODAL : ON LOAD 

      Note: #onload_modal_shop is also used inside the modal
      for the button "stop showing" to set a cookie!
    
    <div id="onload_modal_shop" class="hide js-onload js-ajax-modal" 
        data-href="${contextPath }/resources/html_frontend/_ajax/modal_shop.html" 
        data-ajax-modal-delay="3000" 
        data-ajax-modal-size="modal-lg" 
        data-ajax-modal-centered="true" 
        data-ajax-modal-backdrop=""></div>

	-->
    <script src="${contextPath }/resources/html_frontend/assets/js/core.min.js"></script>
    
  </body>
</html>
    