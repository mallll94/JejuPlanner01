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
	           			  <c:forEach items="${requestScope.list}" var="crewboard">   
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
	</body>
</html>