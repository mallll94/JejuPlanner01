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
<body>
    <div class="container-fluid text-center">
        <h5>카테고리</h5>
        <div class="btn-group" role="group">
            <button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List?category=액티비티'">액티비티</button>
            <button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List?category=입장권'">입장권</button>
            <button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List?category=스파/힐링'">스파/힐링</button>
            <button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List?category=대여'">대여</button>
            <button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List?category=전체보기'">전체보기</button>
        </div>
    </div>
</body>
</html>