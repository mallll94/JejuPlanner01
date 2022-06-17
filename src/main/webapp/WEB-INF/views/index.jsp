<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

   

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

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
    #create-planner-bnt{
        color: white;
    }
    #create-planner-bnt:hover{
        color: orange;
    }
    .profile-Img-area{
        width: 100px;
        height: 100px;
        border-radius: 70%;
        overflow: hidden;
        margin-left: auto;
        margin-right: auto;
    }
    .our-Img{
        width: 100%;
        height: 100%;
        object-fit: cover;
        
    }
    .sb-text{
        text-align: center;
    }
    .planboard-span{
        padding-left: 10px;
        padding-right: 10px;
    }
    
    .s-text {
    	backgroud-color: skyblue;
    }

    </style>
    <script>
        $(function(){
            var loginUser='${sessionScope.loginUser.userId}'

            $(document).on("click","#create-planner-bnt",function(){
					// if(!loginUser){
					// 	alert("로그인 후 이용해 주십시오")
					// }else{
						let url = `${pageContext.request.contextPath}/planner/plannerWrite`
						location.replace(url)
                       // alert("플래너작성하기")
					//}
				})

            //추천상품
            function recommendGoods(){
                $.ajax({
                    url:"${pageContext.request.contextPath}/planner/selectByUserId",
                    type:"post",
                    dataType:"json",
                    data:{plannerId: targetPlannerId},
                    success: function(result){
                        let str="";
                        $.each(result,function(index,board){

                        })
                        $("#recommend-goods-main").html()
                        $("#recommend-goods-main").attr(str)
                    },
                    error: function(result){
                        alert("플래너 정보가 없습니다.")
                    }
                })
            }

            //플래너게시판-추천
            function recommendPlanner(){
                $.ajax({
                    url:"${pageContext.request.contextPath}/planner/selectByUserId",
                    type:"post",
                    dataType:"json",
                    data:{plannerId: targetPlannerId},
                    success: function(result){
                        let str="";
                        $.each(result,function(index,board){

                        })
                        $("#recommend-plan-main").html()
                        $("#recommend-plan-main").attr(str)
                    },
                    error: function(result){
                        alert("플래너 정보가 없습니다.")
                    }
                })
            }


        })




        
    </script>
    
      

</head>
<body>

    <!-- Hero Section Begin -->
    <section class="hero-section">
        <div class="hero-items owl-carousel">
            <div class="single-hero-item set-bg" data-setbg="../../img/main/main-01.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <div class="hero-text">
                                <h2>나만의 여행플래너, 제주잇다</h2>
                                <div class="room-price">
                                    <p><a href="#" id="create-planner-bnt" class="top-property-all">플래너 작성하러 가기</a></p>
                                </div>
                                <ul class="room-features">
                                    <li>
                                        <i class="fa-solid fa-map" style="color: orange;"></i>
                                        <p>plan</p>
                                    </li>
                                    <li>
                                        <i class="fa-solid fa-umbrella-beach"style="color: orange;"></i>
                                        <p>tour</p>
                                    </li>
                                    <li>
                                        <i class="fa-solid fa-comments"style="color: orange;"></i>
                                        <p>share</p>
                                    </li>
                                    <li>
                                        <i class="fa-solid fa-book" style="color: orange;"></i>
                                        <p>memory</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="single-hero-item set-bg" data-setbg="../../img/main/main-02.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <div class="hero-text">
                                <h2>나만의 여행플래너, 제주잇다</h2>
                                <div class="room-price">
                                    <p><a href="#" id="create-planner-bnt" class="top-property-all">플래너 작성하러 가기</a></p>
                                </div>
                                <ul class="room-features">
                                    <li>
                                        <i class="fa-solid fa-map" style="color: orange;"></i>
                                        <p>plan</p>
                                    </li>
                                    <li>
                                        <i class="fa-solid fa-umbrella-beach"style="color: orange;"></i>
                                        <p>tour</p>
                                    </li>
                                    <li>
                                        <i class="fa-solid fa-comments"style="color: orange;"></i>
                                        <p>share</p>
                                    </li>
                                    <li>
                                        <i class="fa-solid fa-book" style="color: orange;"></i>
                                        <p>memory</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="single-hero-item set-bg" data-setbg="../../img/main/main-03.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <div class="hero-text">
                                <h2>나만의 여행플래너, 제주잇다</h2>
                                <div class="room-price">
                                    <p><a href="#" id="create-planner-bnt" class="top-property-all">플래너 작성하러 가기</a></p>
                                </div>
                                <ul class="room-features">
                                    <li>
                                        <i class="fa-solid fa-map" style="color: orange;"></i>
                                        <p>plan</p>
                                    </li>
                                    <li>
                                        <i class="fa-solid fa-umbrella-beach"style="color: orange;"></i>
                                        <p>tour</p>
                                    </li>
                                    <li>
                                        <i class="fa-solid fa-comments"style="color: orange;"></i>
                                        <p>share</p>
                                    </li>
                                    <li>
                                        <i class="fa-solid fa-book" style="color: orange;"></i>
                                        <p>memory</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="thumbnail-pic">
            <div class="thumbs owl-carousel">
                <div class="item">
                    <img src="../../img/main/main-01.jpg" alt="a">
                </div>
                <div class="item">
                    <img src="../../img/main/main-02.jpg" alt="b">
                </div>
                <div class="item">
                    <img src="../../img/main/main-03.jpg" alt="c">
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Top Properties Section Begin -->
    <div class="top-properties-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="properties-title">
                        <div class="section-title">
                            <span>Best 5 For You</span>
                            <h2>베스트 상품</h2>
                        </div>
                        <a href="${pageContext.request.contextPath}/goods/view/goods_Main" class="top-property-all" style="color: orange; border: 3px solid orange;">모든 상품 보기</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div id='recommend-goods-main' class="top-properties-carousel owl-carousel">
                <c:forEach items="${requestScope.bestGoods}" var="goods">
                    <div class="single-top-properties">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="stp-pic">
                                    <img src="" alt="">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="stp-text">
                                    <div class="s-text">제주잇다 Only</div>
                                    <h2>${goods.goodsName}</h2>
                                    <div class="room-price">
                                        <h4>${goods.goodsPrice}원</h4>
                                    </div>
                                    <div class="properties-location">${goods.goodsAddr}</div>
                                    
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
                </c:forEach>
            </div>
        </div>
    </div>
    <!-- Top Properties Section End -->


     <!-- Latest Blog Section Begin -->
     <section class="blog-section latest-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <span>Recommend Plan</span>
                        <h2>추천 플래너</h2>
                    </div>
                </div>
            </div>
            <div id="recommend-plan-main" class="row">
                <c:forEach items="${requestScope.planBoardList}" var="planboard">
                    <div class="col-lg-4">
                        <div class="single-blog-item">
                            <div class="sb-text">
                                <ul>
                                    <c:choose>
                                        <c:when test="${planboard.pboardCategory eq '나홀로'}">
                                            <li class="cate-alone">🧘 ${planboard.pboardCategory}</li>
                                        </c:when>
                                        <c:when test="${planboard.pboardCategory eq '가족/부모님'}">
                                            <li class="cate-family">🏠 ${planboard.pboardCategory}</li>
                                        </c:when>
                                        <c:when test="${planboard.pboardCategory eq '연인'}">
                                            <li class="cate-lover">❤️ ${planboard.pboardCategory}</li>
                                        </c:when>
                                        <c:when test="${planboard.pboardCategory eq '친구'}">
                                            <li class="cate-freind">🧑‍🤝‍🧑 ${planboard.pboardCategory}</li>
                                        </c:when>
                                    </c:choose>
                                    <li><i class="fa fa-user"></i><span class="planboard-span">${planboard.plannerCount} 명</span></li>
                                </ul>
                                <h4><a href="${pageContext.request.contextPath}/board/Planboard_Detail/${planboard.pboardId}">${planboard.pboardTitle}</a></h4>
                                <ul>
                                    <li><i class="fa-solid fa-heart"></i><span class="planboard-span">${planboard.likesCount}</span></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                
                <!-- <div class="col-lg-4">
                    <div class="single-blog-item">
                        <div class="sb-text">
                            <ul>
                                <li><i class="fa fa-user"></i> Adam Smith</li>
                                <li><i class="fa fa-clock-o"></i> 18th Jan, 2019</li>
                            </ul>
                            <h4><a href="#">Illustration In Marketing Materials</a></h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="single-blog-item">
                        <div class="sb-text">
                            <ul>
                                <li><i class="fa fa-user"></i> Adam Smith</li>
                                <li><i class="fa fa-clock-o"></i> 18th Jan, 2019</li>
                            </ul>
                            <h4><a href="#">Branding Do You Know Who You Are</a></h4>
                        </div>
                    </div>
                </div> -->
            </div>
        </div>
    </section>
    <!-- Latest Blog Section End -->


     <!-- Testimonial Section Begin -->
     <section class="testimonial-section set-bg spad" data-setbg="../../img/main/We-bakcground.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Our Team</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <div class="testimonial-slider owl-carousel">
                        <div class="ts-item">
                            <div class="profile-Img-area">
                                <img class="profile-Img" src="../../../img/planner-default.jpg" alt="김정현">
                            </div>
                            <p>Create a list with all possible keywords that fit to your product, service or business
                                field. The more the better. So you will get also a lot of keywords which you mus pay for
                                only the minimal commandment of 5 cents</p>
                            <div class="ti-author">
                                <h5 style="color: white;font-size: 25px;"><a href="${pageContext.request.contextPath}/planner/aa" id="d" style="color: white;">김정현</a></h5>
                                <span>CEO deercreative</span>
                            </div>
                        </div>
                        <div class="ts-item">
                            <div class="profile-Img-area">
                                <img class="profile-Img" src="../../../img/planner-default.jpg" alt="박민서">
                            </div>
                            <p>Create a list with all possible keywords that fit to your product, service or business
                                field. The more the better. So you will get also a lot of keywords which you mus pay for
                                only the minimal commandment of 5 cents</p>
                            <div class="ti-author">
                                <h5 style="color: white;font-size: 25px;">박민서</h5>
                                <span>CEO deercreative</span>
                            </div>
                        </div>
                        <div class="ts-item">
                            <div class="profile-Img-area">
                                <img class="profile-Img" src="../../../img/planner-default.jpg" alt="손채정">
                            </div>
                            <p>Create a list with all possible keywords that fit to your product, service or business
                                field. The more the better. So you will get also a lot of keywords which you mus pay for
                                only the minimal commandment of 5 cents</p>
                            <div class="ti-author">
                                <h5 style="color: white;font-size: 25px;">손채정</h5>
                                <span>CEO deercreative</span>
                            </div>
                        </div>
                        <div class="ts-item">
                            <div class="profile-Img-area">
                                <img class="profile-Img" src="../../../img/planner-default.jpg" alt="이아리">
                            </div>
                            <p>Create a list with all possible keywords that fit to your product, service or business
                                field. The more the better. So you will get also a lot of keywords which you mus pay for
                                only the minimal commandment of 5 cents</p>
                            <div class="ti-author">
                                <h5 style="color: white;font-size: 25px;">이아리</h5>
                                <span>CEO deercreative</span>
                            </div>
                        </div>
                        <div class="ts-item">
                            <div class="profile-Img-area">
                                <img class="profile-Img" src="../../../img/planner-default.jpg" alt="이준원">
                            </div>
                            <p>Create a list with all possible keywords that fit to your product, service or business
                                field. The more the better. So you will get also a lot of keywords which you mus pay for
                                only the minimal commandment of 5 cents</p>
                            <div class="ti-author">
                                <h5 style="color: white;font-size: 25px;">이준원</h5>
                                <span>CEO deercreative</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Testimonial Section End -->

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