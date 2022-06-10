<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">

  
  <div class="app-brand demo ">
    <a href="index.html" class="app-brand-link">
      <span class="app-brand-logo demo">
            <img src="${path}/img/main_logo.png" style="width: 22%; height: auto" alt="제주잇다">
      </span>
    </a>
    <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
      <i class="bx bx-chevron-left bx-sm align-middle"></i>
    </a>
  </div>

  <div class="menu-inner-shadow"></div>

  

  <ul class="menu-inner py-1">

    <li class="menu-item active">
      <a href="index.html" class="menu-link">
        <i class="menu-icon tf-icons bx bx-home-circle"></i>
        <div data-i18n="Analytics">홈페이지</div>
      </a>
    </li>
    
    <!-- 회원 -->
    
    <li class="menu-header small text-uppercase"><span class="menu-header-text">회원</span>
    </li>
    <li class="menu-item">
      <a href="" class="menu-link">
        <i class="menu-icon tf-icons bx bx-dock-top"></i>
        <div data-i18n="Basic">전체회원조회</div>
      </a>
    </li>
      <li class="menu-item">
       <a href="" class="menu-link">
        <i class="menu-icon tf-icons bx bx-support"></i>
        <div data-i18n="Support">1 : 1  문의</div>
      </a>
    </li>
    
    <!-- 플래너 -->
    
    <li class="menu-header small text-uppercase"><span class="menu-header-text">플래너&다이어리</span></li>
   
    <li class="menu-item">
      <a href="" class="menu-link">
        <i class="menu-icon tf-icons bx bx-collection"></i>
        <div data-i18n="Basic">플래너 작성</div>
      </a>
    </li>
    <!-- User interface -->
    <li class="menu-item">
      <a href="" class="menu-link">
        <i class="menu-icon tf-icons bx bx-box"></i>
        <div data-i18n="Basic">플래너관리1</div>
      </a>
    </li>
    <li class="menu-item">
      <a href="" class="menu-link">
        <i class="menu-icon tf-icons bx bx-copy"></i>
        <div data-i18n="Basic">다이어리</div>
      </a>
   </li>
    
    <!-- 플래너 -->
    
    <li class="menu-header small text-uppercase"><span class="menu-header-text">상품</span></li>
   
    <li class="menu-item">
       <a href="" class="menu-link">
        <i class="menu-icon tf-icons bx bx-collection"></i>
        <div data-i18n="Basic">상품등록</div>
      </a>
    </li>
    <!-- User interface -->
    <li class="menu-item">
      <a href="" class="menu-link">
        <i class="menu-icon tf-icons bx bx-box"></i>
        <div data-i18n="Basic">상품등록1</div>
      </a>
    </li>
   
    <!-- 게시판 -->
   
    <li class="menu-header small text-uppercase"><span class="menu-header-text">게시판</span></li>
    <!-- Forms -->
    <li class="menu-item">
      <a href="notice_Admin" class="menu-link">
        <i class="menu-icon tf-icons bx bx-detail"></i>
        <div data-i18n="Form Elements">공지사항</div>
      </a>
    <li class="menu-item">
      <a href="" class="menu-link">
        <i class="menu-icon tf-icons bx bx-detail"></i>
        <div data-i18n="Form Layouts">플래너공유 게시판</div>
      </a>
    </li>
    <li class="menu-item">
      <a href="" class="menu-link">
        <i class="menu-icon tf-icons bx bx-table"></i>
        <div data-i18n="Tables">동행구하기 게시판</div>
      </a>
    </li>
      <li class="menu-item">
       <a href="crew_Admin" class="menu-link">
        <i class="menu-icon tf-icons bx bx-table"></i>
        <div data-i18n="Tables">소통게시판</div>
      </a>
    </li>
      
</aside>