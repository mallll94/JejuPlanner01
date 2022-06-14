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

    <script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
    <title>상품리스트</title>
        <meta charset="UTF-8">
    <meta name="description" content="Azenta Template">
    <meta name="keywords" content="Azenta, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Azenta | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900&display=swap"
        rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/style.css" type="text/css">

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
            window.location.href = '${path}/goods/view/goods_View/' + goodsId;
        }
    </script>

</head>

<body>
<%--     <div class="wrap">
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
    </div> --%>
        <div class="feature-carousel owl-carousel">
        <div class="col-lg-4" id="goodsCard">
        	<c:forEach items="${requestScope.goodsList}" var="goods">
	            <div class="feature-item" onclick="showDetail(${goods.goodsId})">
	                <div class="fi-pic set-bg" data-setbg="${goods.goodsPhoto}">
	                    <div class="pic-tag">
	                        <div class="f-text">best</div>
	                        <!-- <div class="s-text">For Sale</div> -->
	                    </div>
	                </div>
	                <div class="fi-text">
	                    <div class="inside-text">
	                        <h4>${goods.goodsName}</h4>
	                        <ul>
	                            <li><i class="fa fa-map-marker"></i>${goods.goodsLocalCategory}</li>
	                            <li><i class="fa fa-tag"></i>${goods.goodsCategory}</li>
	                        </ul>
	                        <h5 class="price">${goods.goodsPrice}</h5>
	                    </div>
	                    <!-- <ul class="room-features">
	                        <li>
	                            <i class="fa fa-arrows"></i>
	                            <p>780 sqft</p>
	                        </li>
	                        <li>
	                            <i class="fa fa-bed"></i>
	                            <p>4</p>
	                        </li>
	                        <li>
	                            <i class="fa fa-bath"></i>
	                            <p>3</p>
	                        </li>
	                        <li>
	                            <i class="fa fa-car"></i>
	                            <p>2</p>
	                        </li>
	                    </ul> -->
	                </div>
	            </div>
            </c:forEach>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/js/goods/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/goods/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/goods/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/goods/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/goods/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/js/goods/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/goods/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/goods/main.js"></script>
</body>

</html>