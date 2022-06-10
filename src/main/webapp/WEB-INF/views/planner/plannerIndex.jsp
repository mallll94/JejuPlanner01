<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <title>plannerIndex</title>

		 <!-- main style -->
		 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/diary/main.css">

        <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
		
		<script>
			$(function(){
				
				//var loginUser='${sessionScope.loginUser.userId}'
				var loginUser= "aaa"
				$(document).on("click","#test-bnt",function(){
					var plannerId = $(this).attr("name")
					alert(plannerId)
					
					//let url = `${pageContext.request.contextPath}/planner/plannerIndex2plannerId`
					//location.replace(url)
				})
				$(document).on("click","#create-planner-bnt",function(){
					var plannerId = $(this).attr("name")
					if(!loginUser){
						alert("로그인 후 이용해 주십시오")
					}else{
						let url = `${pageContext.request.contextPath}/planner/plannerWrite`
						location.replace(url)
					}
				})
			})

		</script>
	</head>
	<body>
	<h1>plannerIndex</h1>
		<c:choose>
            <c:when test="${ empty requestScope.plannerList}">
                <div>
                    <div class="latest-news mt-150 mb-150">
                        <div class="container">
                            <div>
                                <h5 class="when-empty-message">나만의 플래너를 작성해보세요!
                                </h5>
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
        	<c:otherwise>
				<c:forEach items="${plannerList}" var="planner">
					<div class="card" style="width: 18rem;">
						<img src="" class="card-img-top" alt="">
						<div class="card-body">
							<h5 class="card-title">${planner.plannerName}</h5>
							<span class="card-text">${planner.plannerStart.getMonthValue()}월 ${planner.plannerStart.getDayOfMonth()}일 출발</span>
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
									<span>D+${(bdayNum - nowNum+1)*-1}일</span>
								</c:when>
								<c:otherwise>
									<span>D-${bdayNum - nowNum +1}일</span>
								</c:otherwise>
							</c:choose>
							<!-- <a href="#" id="test-bnt" class="btn btn-primary" name="${planner.plannerId}" value="플래너 번호"></a>
							<form id="planner-insert-save" name="planner-insert-save" method="post" action="${pageContext.request.contextPath}/planner/plannerIndex2">
								<input type="hidden" name="plannerId" value="${planner.plannerId}">
								<input type="submit" class="btn btn-primary" value="플래너 계속 작성하기" name="${planner.plannerId}">
							</form> -->
							<a href="${pageContext.request.contextPath}/planner/plannerIndex2?plannerId=${planner.plannerId}" id="read-planner-bnt" class="btn btn-primary" name="${planner.plannerId}">플래너 계속 작성하기</a>
						
						</div>
					</div>
				</c:forEach>
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
		
		<a href="#" id="create-planner-bnt">플래너 작성하기</a>
		
	</body>
</html>
