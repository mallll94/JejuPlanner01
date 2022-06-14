<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
   
    <title>제주잇다 게시판</title>

      
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/css/azentaMaster/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/css/azentaMaster/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/css/azentaMaster/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/css/azentaMaster/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="/css/azentaMaster/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/css/azentaMaster/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/css/azentaMaster/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="/css/azentaMaster/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/css/azentaMaster/style.css" type="text/css">

    <!-- Owl Stylesheets -->
    <link rel="stylesheet" href="/css/owlCarousel/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/css/owlCarousel/owl.theme.default.min.css">

    <style>
      .board-sidebar{
       
        padding: 10px;
        margin-top: 100px;
        margin-left: 100px;
      }
    </style>
  </head>
	<body>

    <div class="board-sidebar">
      <div class="property-sidebar">
         <div class="best-agents">
          <h4>Board</h4>
            <a href="${pageContext.request.contextPath}/board/notice" class="ba-item">
              <div class="ba-text">
                  <h5><i class="menu-icon fa-solid fa-user-large"></i> 공지사항</h5>
                  <span>제주잇다의 소식을 확인하세요</span>
              </div>
            </a>
            <a href="${pageContext.request.contextPath}/board/PlanboardList" class="ba-item">
              <div class="ba-text">
                  <h5><i class="fa-solid fa-thumbtack"></i> 플래너 게시판</h5>
                  <span>좋았던 여행을 공유하세요</span>
              </div>
            </a>
            <a href="${pageContext.request.contextPath}/board/freeBoard" class="ba-item">
              <div class="ba-text">
                  <h5><i class="fa-solid fa-comments"></i> 소통 게시판</h5>
                  <span>정보를 나누고 교류하세요</span>
              </div>
            </a>
            <a href="${pageContext.request.contextPath}/board/crew" class="ba-item">
              <div class="ba-text">
                  <h5><i class="fa-solid fa-user-group"></i> 동행 구하기 게시판</h5>
                  <span>여러 사람과 더 즐거운 여행을 즐기세요</span>
              </div>
            </a>
         </div>
      </div>
   </div>


  <!--JQuery-->
  <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

  <!-- Js Plugins -->
  <script src="/js/azentaMaster/bootstrap.min.js"></script>
  <script src="/js/azentaMaster/jquery.magnific-popup.min.js"></script>
  <script src="/js/azentaMaster/jquery.nice-select.min.js"></script>
  <script src="/js/azentaMaster/jquery.slicknav.js"></script>
  <script src="/js/azentaMaster/jquery-ui.min.js"></script>
  <script src="/js/owlCarousel/owl.carousel.min.js"></script>
  <script src="/js/azentaMaster/main.js"></script>




</body>

