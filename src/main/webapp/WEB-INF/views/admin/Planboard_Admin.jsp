<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



    <link rel="shortcut icon" type="image/png" href="assets/img/favicon.png">
	
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/planboard/css/all.min.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/planboard/bootstrap/css/bootstrap.min.css">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/planboard/css/owl.carousel.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/planboard/css/magnific-popup.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/planboard/css/animate.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/planboard/css/meanmenu.min.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/planboard/css/main.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/planboard/css/responsive.css">
	

	<script src="${pageContext.request.contextPath}/assets/planboard/js/jquery-1.11.3.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/assets/planboard/bootstrap/js/bootstrap.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/assets/planboard/js/jquery.countdown.js"></script>

	<script src="${pageContext.request.contextPath}/assets/planboard/js/jquery.isotope-3.0.6.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/assets/planboard/js/waypoints.js"></script>
	
	<script src="${pageContext.request.contextPath}/assets/planboard/js/owl.carousel.min.js"></script>

	<script src="${pageContext.request.contextPath}/assets/planboard/js/jquery.magnific-popup.min.js"></script>

	<script src="${pageContext.request.contextPath}/assets/planboard/js/jquery.meanmenu.min.js"></script>

	<script src="${pageContext.request.contextPath}/assets/planboard/js/sticker.js"></script>

	<script src="${pageContext.request.contextPath}/assets/planboard/js/main.js"></script> 

    <!-- google font -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
   
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
    
    <script type="text/javascript">
    
      $(function(){
    	  $(document).on("click", ".btn", function(){
    		  var target=$(this).attr("name")
    		  alert(target)
    		  
    		  let url = "${pageContext.request.contextPath}/admin/Planboard_Admin?pboardCategory=" + target
    		  location.replace(url)		  
    	  })
      })

    </script> 


</head>
<body>


<h3 align="center">플래너공유 게시판</h3>

<div align="center">
 <button type="button" class="btn btn-light" name="나홀로">나홀로</button>
 <button type="button" class="btn btn-light" name="가족/부모님">가족/부모님</button>
 <button type="button" class="btn btn-light" name="친구">친구</button>
 <button type="button" class="btn btn-light" name="연인">연인</button>
</div>

<!-- latest news -->
<div class="latest-news mt-150 mb-150">
  <div class="container">
	<div class="row">
	   
<c:forEach items="${pageList.content}" var="planboard">	
	   <div class="col-lg-4 col-md-6">
		 <div class="single-latest-news">
			<div class="latest-news-bg news-bg-1"></div>
				<div class="news-text-box">
				   <h3><a href="${pageContext.request.contextPath}/board/Planboard_Detail/${planboard.pboardId}">
				   ${planboard.pboardTitle}
				   </a></h3>
				   
				   <!-- 좋아요 하트 -->
					 <p class="blog-meta">
				     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
                     <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
                     </svg>
						<span class="author"><i class="bi bi-heart">${planboard.pboardGood}</i></span>
					 </p>

					<p class="excerpt">${planboard.user.userId}</p>
					<button type="button" class="btn btn-primary" value="삭제">삭제</button>
		    </div>
		 </div>
	   </div>
</c:forEach>			
			
    </div> <!-- row -->
  </div> <!-- container -->
</div>
<!-- end latest news -->

<p></p>

<div class="row">
  <div class="container">
      <div class="row">
          <div class="col-lg-12 text-center">
              <div class="pagination-wrap"> 
                  <ul>
                    <c:set var="doneLoop" value="false"/>
                      <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
                        <li><a href="${pageContext.request.contextPath}/admin/Planboard_Admin?nowPage=${startPage-1}">Prev</a></li>
                      </c:if>
                      <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
                        <c:if test="${(i-1)>=pageList.getTotalPages()}"> <!-- 페이지가 전체페이지보다 크다면 -->
                          <c:set var="doneLoop" value="true"/> <!-- 다음페이지 돌지마라 -->
                        </c:if> 
                        <c:if test="${not doneLoop}" > <!-- 다음페이지가 없으면 -->
                          <li><a class="paginate_button <c:if test='${nowPage eq i}'>active</c:if>" href="${pageContext.request.contextPath}/admin/Planboard_Admin?nowPage=${i}">${i}</a><li>
                        </c:if>
                      </c:forEach>
                                 <!-- <li><a class="active" href="#">2</a></li>
                                 <li><a href="#">3</a></li> -->
                     <c:if test="${(startPage+blockCount)<=pageList.getTotalPages()}">
                     <li><a href="${pageContext.request.contextPath}/admin/Planboard_Admin?nowPage=${startPage+blockCount}">Next</a></li>
                     </c:if>
                 </ul>
             </div>
         </div>
     </div>
  </div>
</div>

</body>
</html>