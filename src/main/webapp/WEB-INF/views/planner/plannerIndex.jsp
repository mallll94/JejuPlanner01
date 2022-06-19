<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>plannerIndex</title>

                <!-- Google Font -->
                <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900&display=swap"
                    rel="stylesheet">

                <!-- main style -->
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/diary/main.css">

                <!-- Css Styles -->
                <link rel="stylesheet" href="/css/azentaMaster/bootstrap.min.css" type="text/css">
                <link rel="stylesheet" href="/css/azentaMaster/font-awesome.min.css" type="text/css">
                <link rel="stylesheet" href="/css/azentaMaster/elegant-icons.css" type="text/css">
                <link rel="stylesheet" href="/css/azentaMaster/themify-icons.css" type="text/css">
                <link rel="stylesheet" href="/css/azentaMaster/nice-select.css" type="text/css">
                <link rel="stylesheet" href="/css/azentaMaster/jquery-ui.min.css" type="text/css">
                <link rel="stylesheet" href="/css/azentaMaster/magnific-popup.css" type="text/css">
                <link rel="stylesheet" href="/css/azentaMaster/slicknav.min.css" type="text/css">
                <link rel="stylesheet" href="/css/azentaMaster/style.css" type="text/css">

                <!-- Owl Stylesheets -->
                <link rel="stylesheet" href="/css/owlCarousel/owl.carousel.min.css" type="text/css">
                <link rel="stylesheet" href="/css/owlCarousel/owl.theme.default.min.css">



                <style>
                    .planner-card-area {
                        display: flex;
                    }

                    .planner-card-area.owl-carousel .owl-nav button[type=button] {
                        width: 26px;
                        height: 60px;
                        border: 2px solid #D9DBDC;
                        display: inline-block;
                        font-size: 18px;
                        color: #aaaab3;
                        border-radius: 2px;
                        position: absolute;
                        left: -42px;
                        top: 50%;
                        -webkit-transform: translateY(-30px);
                        -ms-transform: translateY(-30px);
                        transform: translateY(-30px);
                        -webkit-transition: all 0.4s;
                        -o-transition: all 0.4s;
                        transition: all 0.4s;
                    }

                    .planner-card-area.owl-carousel .owl-nav button[type=button].owl-next {
                        left: auto;
                        right: -42px;
                    }

                    .planner-card-area.owl-carousel .owl-nav button[type=button]:hover {
                        background: #707079;
                        color: #ffffff;
                        border-color: #707079;
                    }

                    .planner-card-area .owl-stage-outer {
                        padding-bottom: 45px;
                        padding-top: 20px;
                    }

                    .planner-card-area.owl-carousel .owl-item img {
                        display: inline-block;
                    }

                    .planner-card-area .col-lg-3 {
                        max-width: 100%;
                    }

                    .planner-card-area .single-agent {
                        text-align: center;
                        background: #ffffff;
                        -webkit-box-shadow: 0 8px 15px 5px rgba(12, 35, 34, 0.05);
                        box-shadow: 0 8px 15px 5px rgba(12, 35, 34, 0.05);
                        padding: 40px 0;
                        -webkit-transition: all 0.3s;
                        -o-transition: all 0.3s;
                        transition: all 0.3s;
                    }

                    .planner-card-area .single-agent:hover {
                        -webkit-box-shadow: 0 4px 15px rgba(12, 35, 34, 0.2);
                        box-shadow: 0 4px 15px rgba(12, 35, 34, 0.2);
                    }

                    .planner-card-area .single-agent:hover .sa-pic .hover-social a.twitter {
                        right: -15px;
                        opacity: 1;
                        visibility: visible;
                    }

                    .planner-card-area .single-agent:hover .sa-pic .hover-social a.instagram {
                        right: -15px;
                        opacity: 1;
                        visibility: visible;
                    }

                    .planner-card-area .single-agent:hover .sa-pic .hover-social a.facebook {
                        bottom: 6px;
                        opacity: 1;
                        visibility: visible;
                    }

                    .planner-card-area .single-agent .sa-pic {
                        position: relative;

                        margin: 0 auto;
                    }

                    .planner-card-area .single-agent .sa-pic img {

                        border-radius: 50%;
                    }

                    .planner-card-area .single-agent .sa-pic .hover-social {
                        position: absolute;
                        right: 0;
                        bottom: 0;
                    }

                    .planner-card-area .single-agent .sa-pic .hover-social a {
                        display: inline-block;
                        color: #ffffff;
                        font-size: 18px;
                        height: 40px;
                        width: 40px;
                        line-height: 40px;
                        text-align: center;
                        background: #222222;
                        border-radius: 50%;
                    }

                    .planner-card-area .single-agent .sa-pic .hover-social a.twitter {
                        background: #29BFE8;
                        position: absolute;
                        right: -40px;
                        bottom: 100px;
                        -webkit-transition: all 0.2s ease 0.2s;
                        -o-transition: all 0.2s ease 0.2s;
                        transition: all 0.2s ease 0.2s;
                        opacity: 0;
                        visibility: hidden;
                    }

                    .planner-card-area .single-agent .sa-pic .hover-social a.instagram {
                        background: #F74D91;
                        position: absolute;
                        right: -40px;
                        bottom: 50px;
                        -webkit-transition: all 0.4s ease 0.4s;
                        -o-transition: all 0.4s ease 0.4s;
                        transition: all 0.4s ease 0.4s;
                        opacity: 0;
                        visibility: hidden;
                    }

                    .planner-card-area .single-agent .sa-pic .hover-social a.facebook {
                        background: #3973E8;
                        position: absolute;
                        right: 15px;
                        bottom: -4px;
                        -webkit-transition: all 0.6s ease 0.6s;
                        -o-transition: all 0.6s ease 0.6s;
                        transition: all 0.6s ease 0.6s;
                        opacity: 0;
                        visibility: hidden;
                    }

                    .planner-card-area .single-agent h5 {
                        font-size: 20px;
                        color: #19191a;
                        font-weight: 600;
                        margin-top: 25px;
                    }

                    .planner-card-area .single-agent h5 span {
                        display: block;
                        font-size: 14px;
                        color: #aaaab3;
                        font-weight: 400;
                        margin-top: 12px;
                    }

                    .planner-card-area .single-agent .sa-pic .hover-social a.shop {
                        background: #ffda35;
                        position: absolute;
                        right: -40px;
                        bottom: 100px;
                        -webkit-transition: all 0.2s ease 0.2s;
                        -o-transition: all 0.2s ease 0.2s;
                        transition: all 0.2s ease 0.2s;
                        opacity: 0;
                        visibility: hidden;
                    }

                    .planner-card-area .single-agent .sa-pic .hover-social a.board {
                        background: #ff70a9;
                        position: absolute;
                        right: -40px;
                        bottom: 50px;
                        -webkit-transition: all 0.4s ease 0.4s;
                        -o-transition: all 0.4s ease 0.4s;
                        transition: all 0.4s ease 0.4s;
                        opacity: 0;
                        visibility: hidden;
                    }

                    .planner-card-area .single-agent .sa-pic .hover-social a.write {
                        background: #518bff;
                        position: absolute;
                        right: 15px;
                        bottom: -4px;
                        -webkit-transition: all 0.6s ease 0.6s;
                        -o-transition: all 0.6s ease 0.6s;
                        transition: all 0.6s ease 0.6s;
                        opacity: 0;
                        visibility: hidden;
                    }

                    .planner-card-area .single-agent:hover .sa-pic .hover-social a.shop {
                        right: -15px;
                        opacity: 1;
                        visibility: visible;
                    }

                    .planner-card-area .single-agent:hover .sa-pic .hover-social a.board {
                        right: -15px;
                        opacity: 1;
                        visibility: visible;
                    }

                    .planner-card-area .single-agent:hover .sa-pic .hover-social a.write {
                        bottom: 6px;
                        opacity: 1;
                        visibility: visible;
                    }

                    .owl-item-cloned {
                        width: 360px;
                    }

                    .latest-news {
                        margin: 0px;
                        padding: 20px;
                    }

                    .when-empty-message {
                        text-align: center;
                        font-size: larger;
                        font-family: 'Noto Sans KR', sans-serif;
                    }

                    .owl-carousel {
                        display: flex;
                    }

                    .spad {
                        padding-bottom: 50px;
                        padding-top: 50px;
                    }
                    .goodsRink{color: black;}
                    .goodsRink:hover{color: black;}
                </style>



                <script>
                    $(function () {
                        const element = document.getElementById('owl-stage')
                        const total = "${plannerList.size()}"

                        //var loginUser='${sessionScope.loginUser.userId}'
                        var loginUser = "aaa"
                        $(document).on("click", "#test-bnt", function () {
                            var plannerId = $(this).attr("name")
                            alert(plannerId)

                            //let url = `${pageContext.request.contextPath}/planner/plannerIndex2plannerId`
                            //location.replace(url)
                        })
                        $(document).on("click", "#create-planner-bnt", function () {
                            if (!loginUser) {
                                alert("로그인 후 이용해 주십시오")
                            } else {
                                let url = `${pageContext.request.contextPath}/planner/plannerWrite`
                                location.replace(url)
                            }
                        })

                    })


                </script>
            </head>

            <body>

                <!--플래너 조회-->
                <!-- Agent Section Begin -->
                <section class="agent-section spad">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="section-title">
                                    <span>제주잇다로 나만의 멋진 여행을 계획하세요</span>
                                    <h2>나의 플래너</h2>
                                </div>
                            </div>
                        </div>
                        <c:choose>
                            <c:when test="${ empty requestScope.plannerList}">
                                <div class="row">
                                    <p class="when-empty-message">아직 작성한 플래너가 없습니다!<br>🏕️나만의 여행 계획을 만들어보세요!🏕️</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="row">
                                    <div class="planner-card-area" id="without-loop">
                                        <c:forEach items="${plannerList}" var="planner">
                                            <div class="col-lg-3">
                                                <div class="single-agent">
                                                    <div class="sa-pic">
                                                        <img class="planner-Img" src="../../../img/planner-default.jpg"
                                                            alt="플래너 기본사진" style="width: 150px;height: 150px;">
                                                        <div class="hover-social">
                                                            <a href="#" class="shop"><i
                                                                    class="fa-solid fa-bag-shopping"></i></a>
                                                            <a href="${pageContext.request.contextPath}/diary/diaryRead/${planner.plannerId}?nowPage=1"
                                                                class="board"><i
                                                                    class="fa-solid fa-clipboard"></i></i></a>
                                                            <a href="${pageContext.request.contextPath}/planner/plannerIndex2?plannerId=${planner.plannerId}"
                                                                class="write"><i class="fa-solid fa-pen-clip"></i></a>
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <p>${planner.plannerName}</p>
                                                        <p>${planner.plannerStart.getMonthValue()}월
                                                            ${planner.plannerStart.getDayOfMonth()}일 출발</p>
                                                        <!-- 여행 기간 구하기 -->
                                                        <fmt:parseDate var="startdate" value="${planner.plannerStart}"
                                                            pattern="yyyy-MM-dd" />
                                                        <fmt:parseNumber var="startday"
                                                            value="${startdate.time/(1000*60*60*24)}"
                                                            integerOnly="true" />
                                                        <fmt:parseDate var="enddate" value="${planner.plannerEnd}"
                                                            pattern="yyyy-MM-dd" />
                                                        <fmt:parseNumber var="endday"
                                                            value="${enddate.time/(1000*60*60*24)}"
                                                            integerOnly="true" />
                                                        <span class="card-text-right">${endday - startday}일간</span><br>
                                                        <!-- 디데이 구하기 -->
                                                        <jsp:useBean id="today" class="java.util.Date" />
                                                        <fmt:formatDate var="now" value="${today}" pattern="yyyyMMdd" />
                                                        <fmt:parseNumber var="nowNum"
                                                            value="${today.time/(1000*60*60*24)}" integerOnly="true" />
                                                        <fmt:parseDate var="bday" value="${planner.plannerStart}"
                                                            pattern="yyyy-MM-dd" />
                                                        <fmt:parseNumber var="bdayNum"
                                                            value="${bday.time/(1000*60*60*24)}" integerOnly="true" />

                                                        <c:choose>
                                                            <c:when test="${bdayNum - nowNum<=0}">
                                                                <span>D+${Math.abs(bdayNum - nowNum+1)}일</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span>D-${bdayNum - nowNum +1}일</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                        <!-- paging -->
                        <div class="row">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12 text-center">
                                        <div class="pagination-wrap">
                                            <ul>
                                                <c:set var="doneLoop" value="false" />
                                                <c:if test="${(startPage-blockCount) > 0}">
                                                    <!-- (-2) > 0  -->
                                                    <li><a
                                                            href="${pageContext.request.contextPath}/planner/plannerIndex?nowPage=${startPage-1}">Prev</a>
                                                    </li>
                                                </c:if>
                                                <c:forEach var='i' begin='${startPage}'
                                                    end='${(startPage-1)+blockCount}'>
                                                    <c:if test="${(i-1)>=pageList.getTotalPages()}">
                                                        <!-- 페이지가 전체페이지보다 크다면 -->
                                                        <c:set var="doneLoop" value="true" /> <!-- 다음페이지 돌지마라 -->
                                                    </c:if>
                                                    <c:if test="${not doneLoop}">
                                                        <!-- 다음페이지가 없으면 -->
                                                        <li><a class="paginate_button <c:if test='${nowPage eq i}'>active</c:if>"
                                                                href="${pageContext.request.contextPath}/planner/plannerIndex?nowPage=${i}">${i}</a>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                                <c:if test="${(startPage+blockCount)<=pageList.getTotalPages()}">
                                                    <li><a
                                                            href="${pageContext.request.contextPath}/planner/plannerIndex?nowPage=${startPage+blockCount}">Next</a>
                                                    </li>
                                                </c:if>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Top Properties Section Begin -->
                <!--플래너 작성하기-->
               <section>
                <div class="top-properties-section spad">
                    <div class="container">
                        <div class="top-properties-carousel owl-carousel">
                            <div class="single-top-properties">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="stp-pic">
                                            <img src="../../../img/planner-index-write.jpg" alt="플래너 작성 홍보 이미지">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="stp-text">
                                            <h2>플래너 작성하기</h2>
                                            <div class="properties-location"><i class="fa-solid fa-location-dot"></i>지도에
                                                선을 그려가며 경로를 확인하세요</div>
                                            <p> 제주잇다로 간편하고 빠른 여행을 계획하세요.<br>계획적인 여행은 더 즐거운 시간을 선사합니다.</p>
                                            <a href="#" id="create-planner-bnt" class="top-property-all">작성하기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Feature Section Begin -->
                <div class="top-properties-section spad">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="properties-title">
                                    <div class="section-title">
                                        <span>Best 5 For You</span>
                                        <h2>플래너 추천 상품</h2>
                                    </div>
                                    <a href="${pageContext.request.contextPath}/goods/view/goods_Main"
                                        class="top-property-all" style="color: orange; border: 3px solid orange;">모든 상품
                                        보기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div id='recommend-goods-main' class="top-properties-carousel owl-carousel">
                            <c:forEach items="${requestScope.plannerGoods}" var="goods">
                                <a href="${pageContext.request.contextPath}/goods/view/goods_View/${goods.goodsId}" class="goodsRink">
                                    <div class="single-top-properties">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="stp-pic">
                                                    <img src="/images/goods/${goods.goodsPhoto}" alt="">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="stp-text">
                                                    <div class="s-text">제주잇다 Only</div>
                                                    <h2>${goods.goodsName}</h2>
                                                    <div class="room-price">
                                                        <h4>${goods.goodsPrice}원</h4>
                                                    </div>
                                                    <div class="properties-location">${goods.goodsAddr}
                                                    </div>

                                                    <ul class="room-features">
                                                        <li>
                                                            <i class="fa fa-map-marker"></i>${goods.goodsLocalCategory}
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-tag"></i>${goods.goodsCategory}
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
               </section>
               
                <!-- Feature Section End -->



                <!--JQuery-->
                <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

                <!-- Js Plugins -->
                <script src="/js/azentaMaster/bootstrap.min.js"></script>
                <script src="/js/azentaMaster/jquery.magnific-popup.min.js"></script>
                <script src="/js/azentaMaster/jquery.nice-select.min.js"></script>
                <script src="/js/azentaMaster/jquery.slicknav.js"></script>
                <script src="/js/azentaMaster/jquery-ui.min.js"></script>
                <script src="/js/owlCarousel/owl.carousel.min.js"></script>
                <script src="/js/azentaMaster/main.js"></script>



            </body>

            </html>