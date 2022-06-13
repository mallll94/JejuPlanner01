<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.property-list{
	margin-top: 20px;
	margin-bottom: 20px;
	border-top: solid 2px rgb(189, 189, 189);
	border-bottom: 2px solid rgb(189, 189, 189);
	padding: 10px;
}
.row{
	border-bottom: 1px solid rgb(223, 223, 223);	
}
.crew-title{
	font-size: large;
	font-weight: bold;
	color: rgb(59, 59, 59);
}
.crew-state{
	background-color: orange;
	font-size: small;
	color: #ffffff;
    font-weight: 500;
    text-transform: uppercase;
    letter-spacing: 1px;
    display: inline-block;
    padding: 3px 20px;
	margin-left: 5px;
}
.crew-date{
	color: rgb(109, 109, 109);
	font-size: medium;
}

</style>
</head>
	<body>
       <div class="col-md-12">
          <div class="white_shd full margin_bottom_30">
             <div class="full graph_head">
                <div class="heading1 margin_0">
                   <h2>동행구하기 게시판</h2>
                </div>
             </div>
	             <div class="table_section padding_infor_info">
	                <div class="table-responsive-sm">
	                   <table class="table">
	                      <thead>
	                         <tr>
	                            <th>순서</th>
	                            <th>제목</th>
	                            <th>등록일</th>
	                            <th>수정일</th>
	                            <th>완료여부</th>
	                         </tr>
	                      </thead>
	           			  <c:forEach items="${requestScope.list.content}" var="crewboard">   
		                      <tbody>
		                      	<tr>
		                         	<td>${crewboard.crewId}</td>
		                            <td> <span><a href="${pageContext.request.contextPath}/board/crew_Detail/${crewboard.crewId}">${crewboard.crewTitle}</a></span></td>
		                            <td>${crewboard.crewRegdate}</td>  
		                            <td>${crewboard.crewUpdate}</td>  
		                            <td>${crewboard.crewState}</td>  
		                         </tr>
		                      </tbody>
		                  </c:forEach>
	                   </table>
	                </div>
	             </div>
             <button onclick="location='./crew_Write'">작성</button>
          </div>
       </div>
       
		

		  <!--Css시도-->
		<!-- Property Section Begin -->
		<section class="property-section spad">
			<div class="container">
			<div class="row">
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
				<div class="col-lg-9">
					<h4 class="property-title">동행 구하기</h4>
					<div class="sidebar-btn">
						<div>
							<button type="button" id="all" class=" btn" style="background-color: grey;" onclick="location.href='freeBoard'">전체보기</button>
							<button type="button" id="recommend" class=" btn" name="여행추천" style="background-color: grey;">여행추천</button>
							<button type="button" id="recommend" class="btn" name="장소추천" style="background-color: grey;">장소추천</button>
						</div>
					</div>
					<div class="property-list">
						<c:forEach items="${requestScope.list.content}" var="crewboard">   
							<div class="row">
								<a href="${pageContext.request.contextPath}/board/crew_Detail/${crewboard.crewId}">
									<div class="property-text">
										<span class="crew-title">${crewboard.crewTitle}</span>
										<c:choose>
											<c:when test="${crewboard.crewState eq 'N'}">
												<span class="crew-state">동행구함</span>
											</c:when>
											<c:when test="${crewboard.crewState eq 'Y'}">
												<div class="crew-state" style="background-color: gray;">완료</div>
											</c:when>
										</c:choose>
										<div class="crew-date">
											<span>등록일: ${crewboard.crewRegdate}</span>
											<span>수정일: ${crewboard.crewUpdate}</span>
										</div>
									</div>
								</a>
							</div>

						</c:forEach>
					</div>
					<div style="text-align: right;">
						<button onclick="location='./crew_Write'">작성</button>
					</div>
					<!-- 페이징 처리 -->
					<!--  블럭당  -->
					<div style="text-align: center">
						<nav class="pagination-container">
							<div class="property-pagination">
								<c:set var="doneLoop" value="false" />
					
								<c:if test="${(startPage-blockCount) > 0}">
									<!-- (-2) > 0  -->
									<a class="pagination-newer"
										href="${pageContext.request.contextPath}/board/crew?nowPage=${startPage-1}">PREV</a>
								</c:if>
					
								<span class="pagination-inner"> <c:forEach var='i'
										begin='${startPage}' end='${(startPage-1)+blockCount}'>
					
										<c:if test="${(i-1)>=list.getTotalPages()}">
											<c:set var="doneLoop" value="true" />
										</c:if>
					
										<c:if test="${not doneLoop}">
											<a class="${i==nowPage?'pagination-active':page}"
												href="${pageContext.request.contextPath}/board/crew?nowPage=${i}">${i}</a>
										</c:if>
					
									</c:forEach>
								</span>
								<c:if test="${(startPage+blockCount)<=list.getTotalPages()}">
									<a class="pagination-older"
										href="${pageContext.request.contextPath}/board/crew?nowPage=${startPage+blockCount}">NEXT</a>
								</c:if>
					
							</div>
						</nav>
						<p>
					</div>

						
						


				</div>
			</div>
			</div>
		</section>
		<!-- Property Section End -->




	</body>
</html>