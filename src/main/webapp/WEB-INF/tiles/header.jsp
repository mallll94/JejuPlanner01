<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">	
		<title>header</title>
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/3d026d01cb.js" crossorigin="anonymous"></script>
		<!-- jQuery -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
	    <!-- jQuery ui -->
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<!-- jQuery ui -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        
        <style type="text/css">
         .mainbottom{background-repeat: repeat-x; background-image: url("${pageContext.request.contextPath}/img/mainbottom3.png");}        
        
        </style>
        
        
    	<!-- 전체 카테고리 이벤트 -->
    	<script type="text/javascript">
/* 			function cartCount() {
				$.ajax({
					url: "${path}/ajax",
					type: "post",
					dataType: "json",
					data: {key: "cart", methodName: "selectCartByUserId"},
					success: function(result) {
						count = 0
						if(JSON.stringify(result) == "[]"){
							count = 0
						} else {
							$.each(result, function(index, item) {
								count++;
							});
						}
						if(count != 0){
							$("#cartC").text(count);
						} else {
							$("#cartC").text("");
						}
					}, // 성공 메소드
					error : function(err) {
						0;
					} // 에러 메소드
				})
			}
			
			cartCount(); */
    	</script>
	</head>
	<body>
		<header class="main-header">
			<div class="main-header-top-right">
				<ul>
					<sec:authorize access="hasRole('ADMIN')">
						<li><a href="${pageContext.request.contextPath}/admin/users_Admin">관리자 페이지</a></li>
						<li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>	
					</sec:authorize>
					
					<sec:authorize access="isAnonymous()">
						<li><a href="${pageContext.request.contextPath}/user/loginForm">로그인</a></li>
						<li><a href="${pageContext.request.contextPath}/user/registerForm">회원가입</a></li>	
					</sec:authorize>
					
					<sec:authorize access="hasRole('USER')">
						<li><a href="${pageContext.request.contextPath}/cart/cartList">장바구니</a></li>
						<li><a href="${pageContext.request.contextPath}/user/myPage">마이페이지</a></li>
						<li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>	
					</sec:authorize>

						<li>
							<form action="${pageContext.request.contextPath}/goods/search">
								<div class="input-group mb-3" style= "margin-bottom: 100px;">
									  <input type="text" class="form-control" style= "width: 150px;" name= "keyWord">
									  <button class="btn btn-outline-secondary" type="button" id="button-addon2">상품검색</button>
								</div>
							</form>
					    </li>
				</ul>
				<h1><a href="${pageContext.request.contextPath}/"><img src="${path}/img/main_logo.png" style="width: 17%; height: auto" alt="메인 로고"></a></h1>
		  </div>
		  <div class="mainbottom" style="background-repeat: repeat-x;">
		      <img alt="메인로고 바텀" src="/img/mainbottom3.png" >
		  </div>
		</header>
		<nav class="main-header-menubar">
			<div>
				<ul>
					<li><a href="${pageContext.request.contextPath}/goods/view/goods_Main" id="">여행상품</a></li>
					<li><a href="${pageContext.request.contextPath}/planner/plannerIndex">플래너</a></li>
					<li><a href="${pageContext.request.contextPath}/board/notice">게시판</a></li>
					<li><a href="${pageContext.request.contextPath}/diary/diaryIndex">다이어리</a></li>
				</ul>
				<ul>
					<li><a href="#">제주도 한눈에보기</a></li>
					<li>
						<a href="${pageContext.request.contextPath}/chat/list" class="position-relative">
						<i class="fa-brands fa-rocketchat"></i>
							채팅
						</a>
					</li>
				</ul>
			</div>
		</nav>
	</body>
</html>