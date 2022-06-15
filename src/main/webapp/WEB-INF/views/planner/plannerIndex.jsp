<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <title>plannerIndex</title>

		<!-- Google Font -->
		<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

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
			.agent-carousel .single-agent .sa-pic .hover-social a.shop {
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
			.agent-carousel .single-agent .sa-pic .hover-social a.board {
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
			.agent-carousel .single-agent .sa-pic .hover-social a.write {
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
			.agent-carousel .single-agent:hover .sa-pic .hover-social a.shop {
				right: -15px;
				opacity: 1;
				visibility: visible;
			}
			.agent-carousel .single-agent:hover .sa-pic .hover-social a.board {
				right: -15px;
				opacity: 1;
				visibility: visible;
			}
			.agent-carousel .single-agent:hover .sa-pic .hover-social a.write {
				bottom: 6px;
				opacity: 1;
				visibility: visible;
			}
			.owl-item-cloned{width: 360px;}
			.latest-news{margin: 0px; padding: 20px;}
			.when-empty-message{text-align: center; font-size: larger;font-family: 'Noto Sans KR', sans-serif;}
			.owl-carousel {display: flex;}
			.spad{padding-bottom: 50px; padding-top: 50px;}

			
		</style>

        
		
		<script>
			$(function(){
				const element = document.getElementById('owl-stage')
				
				//var loginUser='${sessionScope.loginUser.userId}'
				var loginUser= "aaa"
				$(document).on("click","#test-bnt",function(){
					var plannerId = $(this).attr("name")
					alert(plannerId)
					
					//let url = `${pageContext.request.contextPath}/planner/plannerIndex2plannerId`
					//location.replace(url)
				})
				$(document).on("click","#create-planner-bnt",function(){
					if(!loginUser){
						alert("로그인 후 이용해 주십시오")
					}else{
						let url = `${pageContext.request.contextPath}/planner/plannerWrite`
						location.replace(url)
					}
				})
				$(document).ready(function(){
					aler(11)
				})

				// $('.without-loop').owlCarousel({
				// 	loop:false,
				// 	margin:10,
				// 	nav:true,
				// 	responsive:{
				// 		0:{
				// 			items:4
				// 		},
				// 		600:{
				// 			items:4
				// 		},
				// 		1000:{
				// 			items:5
				// 		}
				// 	}
				// })
				// $(document).ready(function(){
				// 	$(".without-loop").owlCarousel({
				// 		items: 4,
				// 		singleItem: true
				// 	});
				// })
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
							<div class="agent-carousel owl-carousel without-loop">
								<c:forEach items="${plannerList}" var="planner">
									<div class="col-lg-3">
										<div class="single-agent">
											<div class="sa-pic">
												<img class="planner-Img" src="../../../img/planner-default.jpg" alt="플래너 기본사진" style="width: 150px;height: 150px;">
												<div class="hover-social">
													<a href="#" class="shop"><i class="fa-solid fa-bag-shopping"></i></a>
													<a href="#" class="board"><i class="fa-solid fa-clipboard"></i></i></a>
													<a href="${pageContext.request.contextPath}/planner/plannerIndex2?plannerId=${planner.plannerId}" class="write"><i class="fa-solid fa-pen-clip"></i></a>
												</div>
											</div>
											<div>
											<p>${planner.plannerName}</p>
											<p>${planner.plannerStart.getMonthValue()}월 ${planner.plannerStart.getDayOfMonth()}일 출발</p>
											<!-- 여행 기간 구하기 -->
											<fmt:parseDate var="startdate" value="${planner.plannerStart}" pattern="yyyy-MM-dd"/>	 			  
											<fmt:parseNumber var="startday" value="${startdate.time/(1000*60*60*24)}" integerOnly="true"/>
											<fmt:parseDate var="enddate" value="${planner.plannerEnd}" pattern="yyyy-MM-dd"/>				  
											<fmt:parseNumber var="endday" value="${enddate.time/(1000*60*60*24)}" integerOnly="true"/>
											<span class="card-text-right">${endday - startday}일간</span><br>
											<!-- 디데이 구하기 -->
											<jsp:useBean id="today" class="java.util.Date"/>
											<fmt:formatDate var="now" value="${today}" pattern="yyyyMMdd" />
											<fmt:parseNumber var="nowNum" value="${today.time/(1000*60*60*24)}" integerOnly="true"/>
											<fmt:parseDate var="bday" value="${planner.plannerStart}" pattern="yyyy-MM-dd"/>				  
											<fmt:parseNumber var="bdayNum" value="${bday.time/(1000*60*60*24)}" integerOnly="true"/>
											
											<c:choose>
												<c:when test="${bdayNum - nowNum<=0}">
													<span>D+${Math.abs(bdayNum - nowNum+1)}일</span>
												</c:when>
												<c:otherwise>
													<span>D-${bdayNum - nowNum +1}일</span>
												</c:otherwise>
											</c:choose>
											<!-- <a href="${pageContext.request.contextPath}/planner/plannerIndex2?plannerId=${planner.plannerId}" id="read-planner-bnt" class="btn btn-primary" name="${planner.plannerId}">플래너 계속 작성하기</a> -->
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
										<c:set var="doneLoop" value="false"/>
										<c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
											<li><a href="${pageContext.request.contextPath}/planner/plannerIndex?nowPage=${startPage-1}">Prev</a></li>
										</c:if>
										<c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
											<c:if test="${(i-1)>=pageList.getTotalPages()}"> <!-- 페이지가 전체페이지보다 크다면 -->
												<c:set var="doneLoop" value="true"/> <!-- 다음페이지 돌지마라 -->
											</c:if> 
											<c:if test="${not doneLoop}" > <!-- 다음페이지가 없으면 -->
												<li><a class="paginate_button <c:if test='${nowPage eq i}'>active</c:if>" href="${pageContext.request.contextPath}/planner/plannerIndex?nowPage=${i}">${i}</a></li>
											</c:if>
										</c:forEach>
										<c:if test="${(startPage+blockCount)<=pageList.getTotalPages()}">
											<li><a href="${pageContext.request.contextPath}/planner/plannerIndex?nowPage=${startPage+blockCount}">Next</a></li>
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
									<div class="properties-location"><i class="fa-solid fa-location-dot"></i>지도에 선을 그려가며 경로를 확인하세요</div>
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
		<section class="feature-section spad">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="section-title">
							<span>제주잇다에서만 제공하는 특별한 상품들을 만나보세요</span>
							<h2>플래너 추천 상품</h2>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="feature-carousel owl-carousel">
						<div class="col-lg-4">
							<div class="feature-item">
								<div class="fi-pic set-bg" data-setbg="img/feature/feature-1.jpg">
									<div class="pic-tag">
										<div class="f-text">feauture</div>
										<div class="s-text">For Sale</div>
									</div>
									<div class="feature-author">
										<div class="fa-pic">
											<img src="" alt="">
										</div>
										<div class="fa-text">
											<span>Rena Simmons</span>
										</div>
									</div>
								</div>
								<div class="fi-text">
									<div class="inside-text">
										<h4>French Riviera Villa</h4>
										<ul>
											<li><i class="fa fa-map-marker"></i> 180 York Road, London, UK</li>
											<li><i class="fa fa-tag"></i> Villa</li>
										</ul>
										<h5 class="price">$5900<span>/month</span></h5>
									</div>
									<ul class="room-features">
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
									</ul>
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="feature-item">
								<div class="fi-pic set-bg" data-setbg="img/feature/feature-2.jpg">
									<div class="pic-tag">
										<div class="f-text">feauture</div>
										<div class="s-text">For Sale</div>
									</div>
									<div class="feature-author">
										<div class="fa-pic">
											<img src="" alt="">
										</div>
										<div class="fa-text">
											<span>Rena Johnston</span>
										</div>
									</div>
								</div>
								<div class="fi-text">
									<div class="inside-text">
										<h4>French Riviera Villa</h4>
										<ul>
											<li><i class="fa fa-map-marker"></i> 180 York Road, London, UK</li>
											<li><i class="fa fa-tag"></i> Villa</li>
										</ul>
										<h5 class="price">$5900<span>/month</span></h5>
									</div>
									<ul class="room-features">
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
									</ul>
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="feature-item">
								<div class="fi-pic set-bg" data-setbg="img/feature/feature-3.jpg">
									<div class="pic-tag">
										<div class="f-text">feauture</div>
										<div class="s-text">For Sale</div>
									</div>
									<div class="feature-author">
										<div class="fa-pic">
											<img src="" alt="">
										</div>
										<div class="fa-text">
											<span>Jonathan Walters</span>
										</div>
									</div>
								</div>
								<div class="fi-text">
									<div class="inside-text">
										<h4>French Riviera Villa</h4>
										<ul>
											<li><i class="fa fa-map-marker"></i> 180 York Road, London, UK</li>
											<li><i class="fa fa-tag"></i> Villa</li>
										</ul>
										<h5 class="price">$5900<span>/month</span></h5>
									</div>
									<ul class="room-features">
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
									</ul>
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="feature-item">
								<div class="fi-pic set-bg" data-setbg="img/feature/feature-4.jpg">
									<div class="pic-tag">
										<div class="f-text">feauture</div>
										<div class="s-text">For Sale</div>
									</div>
									<div class="feature-author">
										<div class="fa-pic">
											<img src="" alt="">
										</div>
										<div class="fa-text">
											<span>Jonathan Walters</span>
										</div>
									</div>
								</div>
								<div class="fi-text">
									<div class="inside-text">
										<h4>French Riviera Villa</h4>
										<ul>
											<li><i class="fa fa-map-marker"></i> 180 York Road, London, UK</li>
											<li><i class="fa fa-tag"></i> Villa</li>
										</ul>
										<h5 class="price">$5900<span>/month</span></h5>
									</div>
									<ul class="room-features">
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
									</ul>
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="feature-item">
								<div class="fi-pic set-bg" data-setbg="img/feature/feature-5.jpg">
									<div class="pic-tag">
										<div class="f-text">feauture</div>
										<div class="s-text">For Sale</div>
									</div>
									<div class="feature-author">
										<div class="fa-pic">
											<img src="" alt="">
										</div>
										<div class="fa-text">
											<span>Jonathan Walters</span>
										</div>
									</div>
								</div>
								<div class="fi-text">
									<div class="inside-text">
										<h4>French Riviera Villa</h4>
										<ul>
											<li><i class="fa fa-map-marker"></i> 180 York Road, London, UK</li>
											<li><i class="fa fa-tag"></i> Villa</li>
										</ul>
										<h5 class="price">$5900<span>/month</span></h5>
									</div>
									<ul class="room-features">
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
									</ul>
								</div>
							</div>
						</div>
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
