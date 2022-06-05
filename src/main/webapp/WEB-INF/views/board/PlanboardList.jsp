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

	<link rel="stylesheet" href="../assets/planboard/css/all.min.css">

	<link rel="stylesheet" href="../assets/planboard/bootstrap/css/bootstrap.min.css">
	
	<link rel="stylesheet" href="../assets/planboard/css/owl.carousel.css">

	<link rel="stylesheet" href="../assets/planboard/css/magnific-popup.css">

	<link rel="stylesheet" href="../assets/planboard/css/animate.css">

	<link rel="stylesheet" href="../assets/planboard/css/meanmenu.min.css">

	<link rel="stylesheet" href="../assets/planboard/css/main.css">

	<link rel="stylesheet" href="../assets/planboard/css/responsive.css">
	

	<script src="../assets/planboard/js/jquery-1.11.3.min.js"></script>
	
	<script src="../assets/planboard/bootstrap/js/bootstrap.min.js"></script>
	
	<script src="../assets/planboard/js/jquery.countdown.js"></script>

	<script src="../assets/planboard/js/jquery.isotope-3.0.6.min.js"></script>
	
	<script src="../assets/planboard/js/waypoints.js"></script>
	
	<script src="../assets/planboard/js/owl.carousel.min.js"></script>

	<script src="../assets/planboard/js/jquery.magnific-popup.min.js"></script>

	<script src="../assets/planboard/js/jquery.meanmenu.min.js"></script>

	<script src="../assets/planboard/js/sticker.js"></script>

	<script src="../assets/planboard/js/main.js"></script> 

 


</head>
<body>


<h3 align="center">플래너공유 게시판</h3>

<!-- latest news -->

<div class="latest-news mt-150 mb-150">
  <div class="container">
	<div class="row">
	   
<c:forEach items="${list}" var="planboard">	
	   <div class="col-lg-4 col-md-6">
		 <div class="single-latest-news">
			<div class="latest-news-bg news-bg-1"></div>
				<div class="news-text-box">
				   <h3><a href="${pageContext.request.contextPath}/board/Planboard_Detail/${planboard.pboardId}">
				   ${planboard.pboardTitle}
				   </a></h3>
				     
				     <p class="blog-meta">
						<span class="author"><i class="fas fa-user">${planboard.pboardGood}</i></span>
					 </p>
					
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