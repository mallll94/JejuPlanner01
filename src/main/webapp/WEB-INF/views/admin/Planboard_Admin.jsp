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

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script> 

    
<script type="text/javascript">
    
     $(function(){
    	  $(document).on("click", ".btn", function(){
    		  var target=$(this).attr("name")
    		  alert(target)
    		  
    		  let url = "${pageContext.request.contextPath}/admin/Planboard_Admin?pboardCategory=" + target
    		  location.replace(url)		  
    	  })
      })
      
      $(function(){
         $("button[value=삭제]").click(function() {
    	  $("#requestForm").attr("action", "${pageContext.request.contextPath}/admin/deleteAdmin");
		  $("#requestForm").submit();
	}) 
 }) 

</script> 


</head>
<body>


<h3 align="center">관리자 플래너공유 게시판</h3>

<div align="center" style="position: relative; top:100px">
 <button type="button" class="btn btn-light" name="나홀로">나홀로</button>&nbsp;&nbsp;&nbsp;
 <button type="button" class="btn btn-light" name="가족/부모님">가족/부모님</button>&nbsp;&nbsp;&nbsp;
 <button type="button" class="btn btn-light" name="친구">친구</button>&nbsp;&nbsp;&nbsp;
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
				  <div align="right">${planboard.pboardCategory}</div>
				   <h3><a href="${pageContext.request.contextPath}/board/Planboard_Detail/${planboard.pboardId}">
				   ${planboard.pboardTitle}
				   </a></h3>
				   

					<p class="excerpt">${planboard.user.userId}</p>
				
				<form name="requestForm" method ="post" id="requestForm">
                  <input type="hidden" name="pboardId" value="${planboard.pboardId}">
				   <div align="right">	
					<button type="button" class="delete-btn btn-primary py-1 px-2" value="삭제">삭제</button>
		           </div>
		        </form>  
		           
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