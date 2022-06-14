<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

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


<script type="text/javascript">
	$(function() {
	  $(document).on("click", ".btn", function() {
		var target = $(this).attr("name")
		alert(target)
        
		let url = "${pageContext.request.contextPath}/board/PlanboardList?pboardCategory=" + target
		location.replace(url)
     })
  })
</script> 

  
  

</head>
<body>


<!-- <h3 align="center" style="position:relative; top: 30px">플래너공유 게시판</h3>

<p></p>

<div style="position: absolute; left:39%; bottom: 42%">
 <button type="button" class="btn btn-light btn-lg" name="나홀로">나홀로</button>&nbsp;&nbsp;&nbsp;
 <button type="button" class="btn btn-light btn-lg" name="가족/부모님">가족/부모님</button>&nbsp;&nbsp;&nbsp;
 <button type="button" class="btn btn-light btn-lg" name="친구">친구</button>&nbsp;&nbsp;&nbsp;
 <button type="button" class="btn btn-light btn-lg" name="연인">연인</button>
</div>

<div align="right" style="position: relative; right:15%; top:105px">
  <button onclick="location = '${pageContext.request.contextPath}/board/Planboard_Write'" class=" insert-btn btn-primary py-1 px-2" type="submit" id="sendMessageButton">
   글쓰기</button>
</div>
                     -->

<!-- latest news -->

<!-- <div class="latest-news mt-150 mb-150">
  <div class="container">
	<div class="row">
	   
<c:forEach items="${pageList.content}" var="planboard">	
	   <div class="col-lg-4 col-md-6">
		 <div class="single-latest-news">
			<div class="latest-news-bg news-bg-1"></div>
				<div class="news-text-box">
				   <div align="right">${planboard.pboardCategory}</div>
				   <h3><a href="${pageContext.request.contextPath}/board/Planboard_Detail/${planboard.pboardId}">
				   ${planboard.pboardTitle}
				   </a></h3>
		
					<p class="excerpt">${planboard.user.userId}</p>	
		   </div>
		 </div>
	   </div>
</c:forEach>			
			
    </div> 
  </div> 
</div> -->

<!-- end latest news -->





  <!-- Property Section Begin -->
  <section class="property-section spad">
    <div class="container">
      <div class="row">
        <!--메뉴 사이드바-->
        <div class="col-lg-3">
          <div class="property-sidebar">
            <div class="best-agents">
            <h4>Board</h4>
            <a href="${pageContext.request.contextPath}/board/notice" class="ba-item">
              <div class="ba-text">
                <h5><i class="menu-icon fa-solid fa-user-large"></i> 공지사항</h5>
                <span>제주잇다의 소식을 확인하세요</span>
              </div>
            </a>
            <a href="${pageContext.request.contextPath}/board/PlanboardList" class="ba-item">
              <div class="ba-text">
                <h5><i class="fa-solid fa-thumbtack"></i> 플래너 게시판</h5>
                <span>좋았던 여행을 공유하세요</span>
              </div>
            </a>
            <a href="${pageContext.request.contextPath}/board/freeBoard" class="ba-item">
              <div class="ba-text">
                <h5><i class="fa-solid fa-comments"></i> 소통 게시판</h5>
                <span>정보를 나누고 교류하세요</span>
              </div>
            </a>
            <a href="${pageContext.request.contextPath}/board/crew" class="ba-item">
              <div class="ba-text">
                <h5><i class="fa-solid fa-user-group"></i> 동행 구하기 게시판</h5>
                <span>여러 사람과 더 즐거운 여행을 즐기세요</span>
              </div>
            </a>
            </div>
          </div>
        </div>
        <!--게시판영역-->
        <div class="col-lg-9">
          <h4 class="property-title">동행 구하기</h4>
            <div class="sidebar-btn"></div>
          <div class="property-list">
              <!--foreach 내용-->
              <c:forEach items="${pageList.content}" var="planboard">	
                <div class="col-lg-4 col-md-6">
                <div class="single-latest-news">
                  <div class="latest-news-bg news-bg-1"></div>
                    <div class="news-text-box">
                      <div>${planboard.pboardCategory}</div>
                      <h3>
                        <a href="${pageContext.request.contextPath}/board/Planboard_Detail/${planboard.pboardId}">${planboard.pboardTitle}</a>
                      </h3>
                
                      <p class="excerpt">${planboard.user.userId}</p>	
                  </div>
                </div>
                </div>
            </c:forEach>	
          </div>
          <div style="text-align: right;">
            <button>작성</button>
          </div>
          <!-- 페이징 처리 -->
          <div style="text-align: center">
            <nav class="pagination-container">
              <!--페이징 내용-->
              <div class="property-pagination">
                <c:set var="doneLoop" value="false" />
                <c:if test="${(startPage-blockCount) > 0}">
                  <a class="pagination-newer" href="${pageContext.request.contextPath}/board/PlanboardList?nowPage=${startPage-1}">PREV</a>
                </c:if>
                  <span class="pagination-inner">
                    <c:forEach var='i'begin='${startPage}' end='${(startPage-1)+blockCount}'>
                      <c:if test="${(i-1)>=list.getTotalPages()}">
                        <c:set var="doneLoop" value="true" />
                      </c:if>
                      <c:if test="${not doneLoop}">
                        <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/board/PlanboardList?nowPage=${i}">${i}</a>
                      </c:if>
                    </c:forEach>
                  </span>
                <c:if test="${(startPage+blockCount)<=list.getTotalPages()}">
                  <a class="pagination-older" href="${pageContext.request.contextPath}/board/PlanboardList?nowPage=${startPage+blockCount}">NEXT</a>
                </c:if>
              </div>
              <!--페이징 내용 끝-->
            </nav>
          </div>
          <!-- 페이징 처리끝 -->
        </div>
        <!--게시판영역 끝-->
      </div>
      <!--row끝-->
    </div>
    <!--container끝-->
  </section>
  <!-- Property Section End -->


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