<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					<c:choose>
						<c:when test="${sessionScope.loginManager != null}">
							<li><a href="">관리자 페이지</a></li>
							<li><a href="">로그아웃</a></li>
						</c:when>
						<c:when test="${empty pageContext.request.userPrincipal}">
							<li><a href="${pageContext.request.contextPath}/user/loginForm">로그인</a></li>
							<li><a href="${pageContext.request.contextPath}/user/registerForm">회원가입</a></li>
							<!-- <li><a href="">장바구니</a></li> -->
						</c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath}/cart/cartList">장바구니</a></li>
							<li><a href="">마이페이지</a></li>
							<li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
						<li>
							<div class="input-group mb-3" style= "margin-bottom: 100px;">
							  <input type="text" class="form-control" style= "width: 150px;">
							  <button class="btn btn-outline-secondary" type="button" id="button-addon2">상품검색</button>
							</div>
					    </li>
				</ul>
				<h1><a href="${pageContext.request.contextPath}/"><img src="${path}/img/main_logo.png" style="width: 17%; height: auto" alt="메인 로고"></a></h1>
		  </div>
		</header>
		<nav class="main-header-menubar">
			<div>
				<ul>
					<li><a href="${pageContext.request.contextPath}/goods/view/goods_Main" id="">여행상품</a></li>
					<li><a href="${pageContext.request.contextPath}/planner/plannerIndex">플래너</a></li>
					<li><a href="">게시판</a></li>
					<li><a href="${pageContext.request.contextPath}/diary/diaryIndex">다이어리</a></li>
				</ul>
				<ul>
					<li><a href="#">제주도 한눈에보기</a></li>
					<li>
						<a href="" class="position-relative">
						<i class="fa-brands fa-rocketchat"></i>
							채팅
						</a>
						
					</li>
				</ul>
			</div>
		</nav>
	</body>
</html>