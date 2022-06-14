<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
 <head>

    <title>공지사항</title>
    
  
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
    
<style type="text/css">
  .col-lg-9{ 
    padding-bottom: 200px;
    margin-top: -50px;    
    padding-left: 150px;
  }
  .accordion-body {
    text-align: center;
  }
  .row {
   width: 90%;
  }

</style>       

</head>
<body >

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
	 <h3><i class="menu-icon fa-solid fa-user-large"></i><strong>&nbsp;공지사항</strong></h3>
		<div class="row">
		  <div class="col-md mb-4 mb-md-0">
		    <div class="accordion mt-3" id="accordionExample">
		    <c:forEach items="${requestScope.list}" var="notice">   
		      <div class="accordion-item">
		        <h2 class="accordion-header" id="flush-headingOne${notice.noticeId}">
		          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne${notice.noticeId}" aria-expanded="false" aria-controls="flush-collapseOne${notice.noticeId}">
		            ${notice.noticeTitle}
		          </button>
		        </h2>
		        <div id="flush-collapseOne${notice.noticeId}" class="accordion-collapse collapse" aria-labelledby="flush-headingOne${notice.noticeId}" data-bs-parent="#accordionExample">
		          <div class="accordion-body">
		                <img alt="첨부 이미지" src="/images/notice/${notice.noticeAttach}" width="300" height="300">
		              <p>${notice.noticeContent}</p>         
		          </div>
		        </div>
		      </div>
		       </c:forEach>
		    </div>
		  </div>
		</div>
	</div>
  </div>
</body>
</html>  