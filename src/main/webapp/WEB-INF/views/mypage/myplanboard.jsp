<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/planboard/css/all.min.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/planboard/bootstrap/css/bootstrap.min.css">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/planboard/css/owl.carousel.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/planboard/css/magnific-popup.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/planboard/css/animate.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/planboard/css/meanmenu.min.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/planboard/css/main.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/planboard/css/responsive.css">


<script type="text/javascript">
	$(function() {
	  $(document).on("click", ".btn", function() {
		var target = $(this).attr("name")
		alert(target)
        
		let url = "${pageContext.request.contextPath}/mypage/myplanboard?pboardCategory=" + target
		location.replace(url)
     })
  })
</script> 

  
  

</head>
<body>


<h3 align="center" style="position:relative; bottom:50px;">플래너공유 게시판</h3>

<p></p>

<div style="position:relative; left:36.5%; top:10px">
 <button type="button" class="btn btn-light" name="나홀로">나홀로</button>&nbsp;&nbsp;&nbsp;
 <button type="button" class="btn btn-light" name="가족/부모님">가족/부모님</button>&nbsp;&nbsp;&nbsp;
 <button type="button" class="btn btn-light" name="친구">친구</button>&nbsp;&nbsp;&nbsp;
 <button type="button" class="btn btn-light" name="연인">연인</button>
</div>


                   
<!-- latest news -->

<div class="latest-news mt-150 mb-150">
  <div class="container">
	<div class="row">
	   
<c:forEach items="${myplan}" var="planboard">	
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
			
    </div> <!-- row -->
  </div> <!-- container -->
</div>

<!-- end latest news -->






</body>
</html>