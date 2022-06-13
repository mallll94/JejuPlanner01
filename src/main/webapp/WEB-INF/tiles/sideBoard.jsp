<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
   
    <title>제주잇다 게시판</title>

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../assets/mypage/vendor/fonts/boxicons.css" />
        
    <!-- Core CSS -->
    <link rel="stylesheet" href="../assets/mypage/vendor/css/core.css"/>
    <link rel="stylesheet" href="../assets/mypage/vendor/css/theme-default.css"/>
    
    
    </head>
	<body>

	<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme" style="border-right : 1px solid #d3d3d3; height: 100%">
    
    <div class="menu-header" style="padding-top: 70px"><h2><strong>게시판</strong></h2></div>
     
    <li class="menu-item">
      <a href="${pageContext.request.contextPath}/board/notice" class="menu-link">
        <i class="menu-icon fa-solid fa-user-large"></i>
        <div data-i18n="Basic">공지사항게시판</div>
      </a>
    </li>
    <li class="menu-item">
      <a href="${pageContext.request.contextPath}/board/freeBoard" class="menu-link">
        <i class="menu-icon tf-icons bx bx-dock-top"></i>
        <div data-i18n="Basic">소통게시판</div>
      </a>
    </li>
    <li class="menu-item">
      <a href="${pageContext.request.contextPath}/board/PlanboardList" class="menu-link">
        <i class="menu-icon tf-icons bx bx-credit-card-front"></i>
        <div data-i18n="Basic">플래너게시판</div>
      </a>
    </li>
     <li class="menu-item">
       <a href="${pageContext.request.contextPath}/board/crew" class="menu-link">
        <i class="menu-icon tf-icons bx bx-credit-card"></i>
        <div data-i18n="Support">동행구하기게시판</div>
      </a>
    </li>  
    </aside>
</body>

