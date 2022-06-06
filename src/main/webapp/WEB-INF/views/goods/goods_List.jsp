<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>goodsList</title>

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
    <title>미미미</title>

    <style>
        .wrap {
            width: 900px;
            margin: 10px auto;
        }

        .card {
            width: 18rem;
            margin: 10px auto;
        }
    </style>


    <script>
        function showDetail(goodsId) {
            window.location.href = '${path}/front?key=goods&methodName=goodsView&goodsId=' + goodsId;
        }
    </script>

</head>

<body>
    <div class="wrap">
        <div class="row row-cols-1 row-cols-md-3 g-4" id="goodsCard">
	        <c:forEach items="${requestScope.goodsList}" var="goods">
	        	<div class="col">
	        		<div class="card h-100" onclick="showDetail(${goods.goodsId})">
	        			<img class="card-img-top" src="${goods.goodsPhoto}" alt="Card image cap">
	        			<div class="card-body">
	        				<h5 class="card-title">${goods.goodsName}</h5>
	        				<hr>
	        				<p class="card-text">${goods.goodsContent}</p>
	        				<h3 class="card-title">${goods.goodsPrice}</h3>
	        			</div>	        			
	        		</div>
	        	</div>
	        	
	            <option value="${place.placeId}">${place.placeName}</option>
	        </c:forEach>
        </div>
    </div>
</body>

</html>