<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script type="text/javascript">
  
     $(function() {
    	 
	    	    $(document).on("click","#delete", function(){
	             
    		   	$("#requestForm").attr("action", "${pageContext.request.contextPath}/mypage/freeBoard_delete/"+$(this).val());
    			$("#requestForm").submit();   	
	            });
    	  
      })

</script>
 </head>
	<body>
       <div class="col-md-12">
          <div class="white_shd full margin_bottom_30">
             <div class="full graph_head">
                <div class="heading1 margin_0">
                   <h2>MY 소통게시판 </h2>
                </div>
             </div>
              <form name="requestForm" method="post" id="requestForm">	
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
	           			  <c:forEach items="${requestScope.pageList.content}" var="freeboard"> 	           	           			 
		                      <tbody>
		                      	<tr>
		                         	<td>${freeboard.freeId}</td>		                         	
		                            <td> <span><a href="${pageContext.request.contextPath}/board/freeBoard_Detail/${freeboard.freeId}">${freeboard.freeTitle}</a></span></td>
		                            <td>${freeboard.freeRegdate}</td>  		                         		              	                       
		                            <td><button type="button" class="btn btn-primary" value="${freeboard.freeId}" id="delete">삭제하기</button></td> 
		                         </tr>
		                      </tbody>		             
		                  </c:forEach>
	                   </table>
	                </div>
	             </div>
	           </form>
          </div>
       </div>
       
<div class="row">
  <div class="container">
      <div class="row">
          <div class="col-lg-12 text-center">
              <div class="pagination-wrap"> 
                  <ul>
                    <c:set var="doneLoop" value="false"/>
                      <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
                        <a href="${pageContext.request.contextPath}/mypage/myFreeboard?nowPage=${startPage-1}">Prev</a>
                      </c:if>
                      <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
                        <c:if test="${(i-1)>=pageList.getTotalPages()}"> <!-- 페이지가 전체페이지보다 크다면 -->
                          <c:set var="doneLoop" value="true"/> <!-- 다음페이지 돌지마라 -->
                        </c:if> 
                        <c:if test="${not doneLoop}" > <!-- 다음페이지가 없으면 -->
                          <a class="paginate_button <c:if test='${nowPage eq i}'>active</c:if>" href="${pageContext.request.contextPath}/mypage/myFreeboard?nowPage=${i}">${i}</a>
                        </c:if>
                      </c:forEach>
                                 <!-- <li><a class="active" href="#">2</a></li>
                                 <li><a href="#">3</a></li> -->
                     <c:if test="${(startPage+blockCount)<=pageList.getTotalPages()}">
                      <a href="${pageContext.request.contextPath}/mypage/myFreeboard?nowPage=${startPage+blockCount}">Next</a>
                     </c:if>
                 </ul>
             </div>
         </div>
     </div>
  </div>
</div>        
       
       
       
       
</body>
</html>