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
        
		let url = "${pageContext.request.contextPath}/board/PlanboardList?pboardCategory=" + target
		location.replace(url)
     })
  })
</script> 

  
  

</head>
<body>


<h3 align="center" style="position:relative; top: 30px">플래너공유 게시판</h3>

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
                    

<!-- latest news -->

<div class="latest-news mt-150 mb-150">
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
                        <li><a href="${pageContext.request.contextPath}/board/PlanboardList?nowPage=${startPage-1}">Prev</a></li>
                      </c:if>
                      <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
                        <c:if test="${(i-1)>=pageList.getTotalPages()}"> <!-- 페이지가 전체페이지보다 크다면 -->
                          <c:set var="doneLoop" value="true"/> <!-- 다음페이지 돌지마라 -->
                        </c:if> 
                        <c:if test="${not doneLoop}" > <!-- 다음페이지가 없으면 -->
                          <li><a class="paginate_button <c:if test='${nowPage eq i}'>active</c:if>" href="${pageContext.request.contextPath}/board/PlanboardList?nowPage=${i}">${i}</a><li>
                        </c:if>
                      </c:forEach>
                                 <!-- <li><a class="active" href="#">2</a></li>
                                 <li><a href="#">3</a></li> -->
                     <c:if test="${(startPage+blockCount)<=pageList.getTotalPages()}">
                     <li><a href="${pageContext.request.contextPath}/board/PlanboardList?nowPage=${startPage+blockCount}">Next</a></li>
                     </c:if>
                 </ul>
             </div>
         </div>
     </div>
  </div>
</div> 




</body>
</html>