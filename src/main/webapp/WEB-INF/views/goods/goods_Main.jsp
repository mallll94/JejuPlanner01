<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="zxx">


        <head>
            <!-- Required meta tags -->
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

            <!-- Bootstrap CSS -->
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

            <!-- 부트스트랩 CSS CDN -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                crossorigin="anonymous">

            <!-- 부트스트랩 JS CDN -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
                crossorigin="anonymous"></script>

            <script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
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
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/bootstrap.min.css"
                type="text/css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/font-awesome.min.css"
                type="text/css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/elegant-icons.css"
                type="text/css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/themify-icons.css"
                type="text/css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/nice-select.css" type="text/css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/jquery-ui.min.css"
                type="text/css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/owl.carousel.min.css"
                type="text/css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/magnific-popup.css"
                type="text/css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/slicknav.min.css" type="text/css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods/style.css" type="text/css">
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
                text-size-adjust: 4rem;
                margin-top: 20px;
                margin-bottom: 30px;
                text-align: left;
                margin-left: 280px;
            }
            .section-title {
            	margin-top: 50px;
            }
        </style>

        <body>
            <%-- <img src="${pageContext.request.contextPath}/img/goods/goods3.png" width="100%" height="250px"> --%>
            	<div class="section-title">
                    <span>제주잇다만의 프리미엄 상품입니다.</span>
                    <h2>여행상품</h2>
                </div>
            <h3 class="title">카테고리</h3>
            <div class="container text-center">
                <div class="btn btn-lg" aria-label="...">
                    <button type="button" class="btn btn-light btn-lg"
                        onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List/category?category=액티비티'">🍊액티비티</button>
                    <button type="button" class="btn btn-light btn-lg"
                        onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List/category?category=입장권'">⛱입장권</button>
                    <button type="button" class="btn btn-light btn-lg"
                        onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List/category?category=스파/힐링'">💊스파/힐링</button>
                    <button type="button" class="btn btn-light btn-lg"
                        onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List/category?category=대여'">📷대여</button>
                    <button type="button" class="btn btn-light btn-lg"
                        onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List/category?category=전체보기'">🔎전체보기</button>
                </div>
            </div>
            <h3 class="title">제주도 지역별로 살펴보기</h3>
            <div class="container text-center">
                <div class="btn btn-lg" aria-label="...">
                    <button type="button" class="btn btn-light btn-lg"
                        onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List/localCategory?localCategory=제주시'">🌎제주시</button>
                    <button type="button" class="btn btn-light btn-lg"
                        onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List/localCategory?localCategory=애월'">🗿애월</button>
                    <button type="button" class="btn btn-light btn-lg"
                        onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List/localCategory?localCategory=한림_협재'">🐬한림/협재</button>
                    <button type="button" class="btn btn-light btn-lg"
                        onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List/localCategory?localCategory=중문'">🛳중문</button>
                    <button type="button" class="btn btn-light btn-lg"
                        onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List/localCategory?localCategory=서귀포'">🍊서귀포</button>
                    <button type="button" class="btn btn-light btn-lg"
                        onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List/localCategory?localCategory=표선'">🏄‍♂️표선</button>
                    <button type="button" class="btn btn-light btn-lg"
                        onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List/localCategory?localCategory=성산_우도'">🌟성산/우도</button>
                    <button type="button" class="btn btn-light btn-lg"
                        onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List/localCategory?localCategory=함덕_구좌'">🌊함덕/구좌</button>
                </div>

            </div>
            <h3 class="title">나의 플래너 기반 상품</h3>
            <div class="container text-center">
                <div>
                    <form method="POST"
                        action="${pageContext.request.contextPath}/goods/view/goods_List/plannerCategory">
                        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
                        <button type="submit" class="btn"><img
                                src="${pageContext.request.contextPath}/img/goods/goods4.png"
                                width="450px"></button>
                        <img src="${pageContext.request.contextPath}/img/goods/plan-info.png" width="350px">
                    </form>
                    	
                </div>
            </div>

        </body>


        <!-- Feature Section Begin -->
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3>제주잇다 인기상품🔥</h3>
                </div>
            </div>
            <div class="row">
                <div class="feature-carousel owl-carousel">
                    <c:forEach items="${requestScope.goodsList}" var="goods">
                        <div class="col-lg-4">
                            <div class="feature-item">
                                <div class="fi-pic set-bg" data-setbg="img/feature/feature-1.jpg">
                                    <div class="pic-tag">
                                        <div class="f-text">Best</div>
                                        <div class="s-text">제주잇다 only</div>
                                    </div>
                                    <div class="feature-author">
                                        <div class="fa-pic">
                                            <img src="img/feature/f-author-1.jpg" alt="">
                                        </div>
                                        <div class="fa-text">
                                            <span>Rena Simmons</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="fi-text">
                                    <div class="inside-text">
                                        <h4>${goods.goodsName}</h4>
                                        <ul>
                                            <li>
                                            	<i class="fa fa-map-marker"></i>${goods.goodsLocalCategory}</li>
                                            <li><i class="fa fa-tag"></i>${goods.goodsCategory}</li>
                                        </ul>
                                        <h4 class="price">${goods.goodsPrice}</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- Feature Section End -->


        <!-- Js Plugins -->
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