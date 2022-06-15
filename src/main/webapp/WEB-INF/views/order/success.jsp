<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    


<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <title>결제 완료</title>
 <style type="text/css">
  .orderline{ color: orange;}
  .badge {background-color: orange;}
	
 </style>	
</head>
 <body>
 
  </head>
  <body class="bg-light">
    
<div class="container">
  <main>
    <div class="py-5 text-center">
      <img class="d-block mx-auto mb-4" src="/img/successLogo.png" alt="" width="700" height="200">
      <h2>결제가 완료되었습니다.</h2>
      <p class="lead">제주잇다를 이용해주셔서 감사합니다.</p>
    </div>

    <!-- 결제정보 -->
    
    <div class="row g-5">
      <div class="col-md-5 col-lg-4 order-md-last">
        <h4 class="d-flex justify-content-between align-items-center mb-3">
          <span class="orderline">결제정보</span>
          <span class="badge rounded-pill">총결제한 숫자넣기</span>
        </h4>
        <ul class="list-group mb-3">
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">상품명</h6>
              <small class="text-muted">개수</small>
            </div>
            <span class="text-muted">결제금액</span>
          </li>
          <li class="list-group-item d-flex justify-content-between">
            <span><strong>총금액(￦)</strong></span>
            <strong>50000억원</strong>
          </li>
        </ul>
      </div>
      
      <!-- 사용자 정보 -->
      
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">구매자 정보</h4>
   
          
            <div class="col-sm-6">
              <label for="userName" class="form-label">회원아이디</label>
              <input type="text" class="form-control" id="firstName" placeholder="" value="" required>             
            </div><br>

            <div class="col-sm-6">
              <label for="lastName" class="form-label">회원이름</label>
              <input type="text" class="form-control" id="lastName" placeholder="" value="" required>
            </div><br>
            
            <div class="col-sm-6">
              <label for="lastName" class="form-label">이메일주소</label>
              <input type="text" class="form-control" id="lastName" placeholder="" value="" required>
            </div><br>

            <div class="col-sm-6">
              <label for="lastName" class="form-label">휴대폰번호</label>
              <input type="text" class="form-control" id="lastName" placeholder="" value="" required>
            </div><br>
            
            <div class="col-sm-6">
              <label for="lastName" class="form-label">추가정보사항</label>
              <textarea rows="" cols="" class="form-control"></textarea>
            </div>
  
      

 
         <hr><button class="w-30 btn rounded-pill btn-lg" type="submit" style="background-color: orange;">홈페이지로 돌아가기</button>
      </div>
    </div>
  </main>

  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2022 제주잇다</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="#">1:1문의</a></li>
      <li class="list-inline-item"><a href="#">이용방법</a></li>
      <li class="list-inline-item"><a href="#">제작자</a></li>
    </ul>
  </footer>
</div> </body>
</html>