<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
 <head>
 </head>
	<body>
       <div class="col-md-12">
          <div class="white_shd full margin_bottom_30">
             <div class="full graph_head">
                <div class="heading1 margin_0">
                   <h2>관리자 공지사항 관리</h2>
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
	                         </tr>
	                      </thead>
	           			  <c:forEach items="${requestScope.list}" var="notice">   
		                      <tbody>
		                      	<tr>
		                         	<td>${notice.noticeId}</td>
		                            <td> <span><a href="${pageContext.request.contextPath}/admin/notice_Detail/${notice.noticeId}">${notice.noticeTitle}</a></span></td>
		                            <td>${notice.noticeRegdate}</td>  
		                         </tr>
		                      </tbody>
		                  </c:forEach>
	                   </table>
	                </div>
	             </div>
             <button onclick="location='./notice_Write'">작성</button>
          </div>
       </div>
	</body>
</html>