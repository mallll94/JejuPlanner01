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
    <link href="https://fonts.googleapis.com/css?family=Stylish&display=swap" rel="stylesheet">

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

        .card h-100 {
            width: 18rem;
            height: 60rem;
            margin-bottom: 10px;
            margin-right: 10px;
            margin-left: 10px;
         }
         
         .best-agents {
         	margin-top: 100px;
         }
		 .card-img-top {
			  width: 300px;
			  height: 200px;
			  object-fit: cover;
		}
		         
		.card-title {
			font-size: 15px;
			font-weight: bold;
		}
		.fa fa-map-marker{
			color: gray;
		}
         * {
                font-family: "Stylish", sans-serif;
            }
    </style>


    <script>
        function showDetail(goodsId) {
            window.location.href = '${path}/goods/view/goods_View/' + goodsId;
        }
    </script>

</head>

<body>
    <!-- Property Section Begin -->
    <section class="property-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="property-sidebar">
                        <h4>필터</h4>
                        <form action="#" class="sidebar-search">
                            <div class="sidebar-btn">
                                <div class="bt-item">
                                    <input type="radio" name="s-type" onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List/category?category=전체보기'" id="st-buy" checked>
                                    <label for="st-buy">전체보기</label>
                                </div>
                                <div class="bt-item">
                                    <input type="radio" name="s-type" id="st-rent" onclick="location.href='${pageContext.request.contextPath}/goods/view/goods_List/bestGoods'">
                                    <label for="st-rent">Best상품</label>
                                </div>
                            </div>
                            <select name="none" onchange="if(this.value) location.href=(this.value);">
                                <option value="" >📚카테고리</option>
                                <option value="${pageContext.request.contextPath}/goods/view/goods_List/category?category=액티비티">🍊액티비티</option>
                                <option value="${pageContext.request.contextPath}/goods/view/goods_List/category?category=입장권">⛱입장권</option>
                                <option value="${pageContext.request.contextPath}/goods/view/goods_List/category?category=스파_힐링">💊스파/힐링</option>
                                <option value="${pageContext.request.contextPath}/goods/view/goods_List/category?category=대여">📷대여</option>
                                
                            </select>
                            <select name="none" onchange="if(this.value) location.href=(this.value);">
                                <option value="">🏝지역 카테고리</option>
                                <option value="${pageContext.request.contextPath}/goods/view/goods_List/localCategory?localCategory=제주시">🌎제주시</option>
                                <option value="${pageContext.request.contextPath}/goods/view/goods_List/localCategory?localCategory=애월">🗿애월</option>
                                <option value="${pageContext.request.contextPath}/goods/view/goods_List/localCategory?localCategory=한림_협재">🐬한림/협재</option>
                                <option value="${pageContext.request.contextPath}/goods/view/goods_List/localCategory?localCategory=중문">🛳중문</option>
                                <option value="${pageContext.request.contextPath}/goods/view/goods_List/localCategory?localCategory=서귀포">🍊서귀포</option>
                                <option value="${pageContext.request.contextPath}/goods/view/goods_List/localCategory?localCategory=표선">🏄‍♂️표선</option>
                                <option value="${pageContext.request.contextPath}/goods/view/goods_List/localCategory?localCategory=성산_우도">🌟성산/우도</option>
                                <option value="${pageContext.request.contextPath}/goods/view/goods_List/localCategory?localCategory=함덕_구좌">🌊함덕/구좌</option>
                                
                                
                            </select>
                            <select name="none" onchange="if(this.value) location.href=(this.value);">
                                <option value="">정렬기준</option>
                                <option value="${pageContext.request.contextPath}/goods/view/goods_List/bestGoods">판매량순</option>
                                <option value="${pageContext.request.contextPath}/goods/view/goods_List/lowPrice">낮은 가격순</option>
                                <option value="">후기 많은 순</option>
                            </select>
                            <div class="row">
                            </div>
                        </form>
                        <div class="best-agents">
                            <h4>제주잇다 컨텐츠 즐기기🎁</h4>
                            <a href="${pageContext.request.contextPath}/planner/plannerIndex" class="ba-item">
                                <div class="ba-pic">
                                    <img src="img/properties/best-agent-1.jpg" alt="">
                                </div>
                                <div class="ba-text">
                                    <h5>플래너 만들기</h5>
                                    <span>나만의 제주도 플래너 만들기</span>
                                    <p class="property-items">다이어리도 만들 수 있당</p>
                                </div>
                            </a>
                            <a href="${pageContext.request.contextPath}/board/PlanboardList" class="ba-item">
                                <div class="ba-pic">
                                    <img src="img/properties/best-agent-2.jpg" alt="">
                                </div>
                                <div class="ba-text">
                                    <h5>플래너 공유 게시판</h5>
                                    <span>다른사람의 여행을 참고하기</span>
                                    <p class="property-items">제주잇다만의 서비스</p>
                                </div>
                            </a>
                            <a href="${pageContext.request.contextPath}/diary/diaryIndex" class="ba-item">
                                <div class="ba-pic">
                                    <img src="img/properties/best-agent-3.jpg" alt="">
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <h4 class="property-title">제주도의 투어&티켓</h4>
                    <div class="property-list">
                        <div class="single-property-item">
                            <div class="row">
                                <div class="row row-cols-1 row-cols-md-3 g-4" id="goodsCard">
                                    <c:forEach items="${requestScope.goodsList}" var="goods">
                                        <div class="col">
                                            <div class="card h-100" onclick="showDetail(${goods.goodsId})">
                                                <img class="card-img-top" src="/images/goods/${goods.goodsPhoto}"
                                                    alt="Card image cap">
                                                <div class="card-body">
                                                    <h4 class="card-title">${goods.goodsName}</h4>
                                                    <h5 class="card-title">${goods.goodsPrice}</h5>
                                                    <ul>
                                            				<i class="fa fa-map-marker"></i>${goods.goodsLocalCategory}
                                            				<i class="fa fa-tag"></i>${goods.goodsCategory}
                                       				 </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="property-pagination">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Property Section End -->
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