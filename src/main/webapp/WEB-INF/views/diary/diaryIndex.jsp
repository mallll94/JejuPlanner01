<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <title>::다이어리::</title>


        <!-- favicon -->
        
        <!-- google font -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
        <!-- fontawesome -->
       
        <!-- bootstrap -->
        
        <!-- owl carousel -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/diary/owl.carousel.css">
        <!-- magnific popup -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/diary/magnific-popup.css">
        <!-- animate css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/diary/animate.css">
        <!-- mean menu css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/diary/meanmenu.min.css">
        <!-- main style -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/diary/main.css">
        <!-- responsive -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/diary/responsive.css">


        <!-- jquery -->
        <script src="${pageContext.request.contextPath}/js/diary/jquery-1.11.3.min.js"></script>
        <!-- bootstrap -->
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <!-- count down -->
        <script src="${pageContext.request.contextPath}/js/diary/jquery.countdown.js"></script>
        <!-- isotope -->
        <script src="${pageContext.request.contextPath}/js/diary/jquery.isotope-3.0.6.min.js"></script>
        <!-- waypoints -->
        <script src="${pageContext.request.contextPath}/js/diary/waypoints.js"></script>
        <!-- owl carousel -->
        <script src="${pageContext.request.contextPath}/js/diary/owl.carousel.min.js"></script>
        <!-- magnific popup -->
        <script src="${pageContext.request.contextPath}/js/diary/jquery.magnific-popup.min.js"></script>
        <!-- mean menu -->
        <script src="${pageContext.request.contextPath}/js/diary/jquery.meanmenu.min.js"></script>
        <!-- sticker js -->
        <script src="${pageContext.request.contextPath}/js/diary/sticker.js"></script>
        <!-- main js -->
        <script src="${pageContext.request.contextPath}/js/diary/main.js"></script>

        <style>
            .diary-bg-1 {
                background-image: url(../../../img/diary-default.jpg);
            }
        </style>
        
	</head>
	<body>
        <!-- latest news -->
        <c:choose>
            <c:when test="${empty requestScope.pageList}">
            <tr>
                <td colspan="5">
                    <p align="center"><b><span style="font-size:9pt;">등록된 게시물이 없습니다.</span></b></p>
                </td>
            </tr>
            </c:when>
            <c:otherwise>
                <c:forEach items="${requestScope.pageList.content}" var="diary">
                    <div class="latest-news mt-150 mb-150">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-4 col-md-6">
                                    <div class="single-latest-news">
                                        <a href="#"><div class="latest-news-bg diary-bg-1"></div></a>
                                        <div class="news-text-box">
                                            <h3><a href="#">${diary.diaryTitle}</a></h3>
                                            <p class="blog-meta">
                                                <span class="author"><i class="fas fa-user"></i> Admin</span>
                                                <span class="date"><i class="fas fa-calendar"></i> 27 December, 2019</span>
                                            </p>
                                            <p class="excerpt">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.</p>
                                            <a href="#" class="read-more-btn">read more <i class="fas fa-angle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>

        <div class="row">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="pagination-wrap"> 
                            <ul>
                                <c:set var="doneLoop" value="false"/>
                                <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
                                    <li><a href="${pageContext.request.contextPath}/diary/diaryIndex?nowPage=${startPage-1}">Prev</a></li>
                                </c:if>
                                <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
                                    <c:if test="${(i-1)>=pageList.getTotalPages()}"> <!-- 페이지가 전체페이지보다 크다면 -->
                                        <c:set var="doneLoop" value="true"/> <!-- 다음페이지 돌지마라 -->
                                    </c:if> 
                                    <c:if test="${not doneLoop}" > <!-- 다음페이지가 없으면 -->
                                        <li><a class="paginate_button <c:if test='${nowPage eq i}'>active</c:if>" href="${pageContext.request.contextPath}/diary/diaryIndex?nowPage=${i}">${i}</a></li>
                                    </c:if>
                                </c:forEach>
                                <!-- <li><a class="active" href="#">2</a></li>
                                <li><a href="#">3</a></li> -->
                                <c:if test="${(startPage+blockCount)<=pageList.getTotalPages()}">
                                    <li><a href="${pageContext.request.contextPath}/diary/diaryIndex?nowPage=${startPage+blockCount}">Next</a></li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                
        <!-- end latest news -->

        
		
	</body>
</html>