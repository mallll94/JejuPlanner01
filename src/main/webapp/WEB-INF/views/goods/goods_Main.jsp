<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
       <!DOCTYPE html>
		<html>
		
		<head>
		    <!-- Required meta tags -->
		    <meta charset="utf-8">
		    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		    <!-- Bootstrap CSS -->
		    <meta charset="utf-8">
		    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		    <!-- 부트스트랩 CSS CDN -->
		    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		
		    <!-- 부트스트랩 JS CDN -->
		    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		        crossorigin="anonymous"></script>
		
		    <script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
		</head>
		<style>
		    .jejumap {
		        width: 50px;
		        vertical-align: middle;
		    }
		
		    .container {
		        margin-bottom: 60px;
		
		    }
		
		    .title {
		        margin-top: 20px;
		        margin-bottom: 10px;
		        text-align: left;
		        margin-left: 500px;
		    }
		
		    .bnt-group {
		        text-align: center;
		    }
		</style>
		
		<body>
		    <img src="${pageContext.request.contextPath}/img/goods/sungsan.jpeg" width="100%" height="300px">
		    <h5 class="title">카테고리</h5>
		    <div class="container text-center">
		        <div class="btn-group" role="group">
		            <button type="button" class="btn btn-outline-primary"
		                onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List/category?category=액티비티'">🍊액티비티</button>
		            <button type="button" class="btn btn-outline-primary"
		                onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List/category?category=입장권'">⛱입장권</button>
		            <button type="button" class="btn btn-outline-primary"
		                onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List/category?category=스파/힐링'">💊스파/힐링</button>
		            <button type="button" class="btn btn-outline-primary"
		                onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List/category?category=대여'">📷대여</button>
		            <button type="button" class="btn btn-outline-primary"
		                onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List/category?category=전체보기'">🔎전체보기</button>
		        </div>
		    </div>
		    <h5 class="title">제주도 지역별로 살펴보기</h5>
		    <div class="container text-center">
		        <div class="btn-group" role="group">
		            <button type="button" class="btn btn-outline-primary"
		                onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List/localCategory?localCategory=제주시'">🌎제주시</button>
		            <button type="button" class="btn btn-outline-primary"
		                onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List/localCategory?localCategory=애월'">🗿애월</button>
		            <button type="button" class="btn btn-outline-primary"
		                onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List/localCategory?localCategory=한림_협재'">🐬한림/협재</button>
		            <button type="button" class="btn btn-outline-primary"
		                onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List/localCategory?localCategory=중문'">🛳중문</button>
		            <button type="button" class="btn btn-outline-primary"
		                onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List/localCategory?localCategory=서귀포'">🍊서귀포</button>
		            <button type="button" class="btn btn-outline-primary"
		                onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List/localCategory?localCategory=표선'">🏄‍♂️표선</button>
		            <button type="button" class="btn btn-outline-primary"
		                onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List/localCategory?localCategory=성산_우도'">🌟성산/우도</button>
		            <button type="button" class="btn btn-outline-primary"
		                onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List/localCategory?localCategory=함덕_구좌'">🌊함덕/구좌</button>
		        </div>
		
		    </div>
		    <h5 class="title">나의 플래너 기반 검색하기</h5>
		    <div class="container text-center">
		        <div class="btn-group" role="group">
		            <form method="POST" action="${pageContext.request.contextPath}/goods/view/goods_List/plannerCategory">
		                <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		                <button type="submit" class="btn btn-outline-primary">나의 플래너 상품</button>
		            </form>
		        </div>
		    </div>
		
		</body>
		
		</html>