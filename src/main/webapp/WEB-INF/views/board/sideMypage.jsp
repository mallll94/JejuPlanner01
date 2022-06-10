<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
   
    <title>제주잇다 마이페이지</title>

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../assets/mypage/vendor/fonts/boxicons.css" />
        
    <!-- Core CSS -->
    <link rel="stylesheet" href="../assets/mypage/vendor/css/core.css"/>
    <link rel="stylesheet" href="../assets/mypage/vendor/css/theme-default.css"/>
</head>
	<body></body>
	<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme" style="border-right : 1px solid #d3d3d3;">

 
    
    <!-- 회원 -->
    
    <div class="menu-header"><h2><strong>마이페이지</strong></h2></div>
     
    <li class="menu-item">
      <a href="" class="menu-link">
        <i class="menu-icon fa-solid fa-user-large"></i>
        <div data-i18n="Basic">내정보</div>
      </a>
    </li>
    <li class="menu-item">
      <a href="" class="menu-link">
        <i class="menu-icon tf-icons bx bx-dock-top"></i>
        <div data-i18n="Basic">MY플래너</div>
      </a>
    </li>
      <li class="menu-item" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages4" aria-expanded="false" aria-controls="collapsePages4">
       <a class="menu-link">
        <i class="menu-icon tf-icons bx bx-credit-card-front"></i>
        <div data-i18n="Support" >MY게시판</div>
      </a>
    </li>
        <div class="collapse" id="collapsePages4" aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
            <nav class="sb-sidenav-menu-nested nav">
                <a class="nav-link" href=""><i class="fa-solid fa-play"></i>&nbsp;&nbsp;소통 게시판</a>
                <a class="nav-link" href=""><i class="fa-solid fa-play"></i>&nbsp;&nbsp;동행구하기 게시판</a>
                <a class="nav-link" href=""><i class="fa-solid fa-play"></i>&nbsp;&nbsp;플래너공유 게시판</a>
            </nav>
        </div>
     <li class="menu-item">
       <a href="" class="menu-link">
        <i class="menu-icon tf-icons bx bx-credit-card"></i>
        <div data-i18n="Support">MY예약</div>
      </a>
    </li>
     <li class="menu-item">
       <a href="" class="menu-link">
        <i class="menu-icon tf-icons bx bx-coffee-togo"></i>
        <div data-i18n="Support">1 : 1  문의</div>
      </a>
    </li>
     <li class="menu-item">
       <a href="" class="menu-link">
        <i class="menu-icon tf-icons bx bx-comment-add"></i>
        <div data-i18n="Support">회원정보수정</div>
      </a>
    </li>
     <li class="menu-item">
       <a href="" class="menu-link">
        <i class="menu-icon tf-icons bx bx-cube-alt"></i>
        <div data-i18n="Support">회원탈퇴</div>
      </a>
    </li>
    </body>
</aside>