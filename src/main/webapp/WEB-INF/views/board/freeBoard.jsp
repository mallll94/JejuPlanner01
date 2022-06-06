<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
	<body>
       <div class="col-md-12">
          <div class="white_shd full margin_bottom_30">
             <div class="full graph_head">
                <div class="heading1 margin_0">
                   <h2>소통게시판 게시판</h2>
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
       
		<div style="text-align: center">
			<!-- 페이징 처리 -->
			<!--  블럭당  -->
			<nav class="pagination-container">
				<div class="pagination">
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
	</body>
</html>