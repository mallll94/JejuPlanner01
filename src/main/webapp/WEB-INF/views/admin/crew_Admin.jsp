<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
  
     $(function() {
    	 
	    	    $(document).on("click","#delete", function(){
	             
    		   	$("#requestForm").attr("action", "${pageContext.request.contextPath}/admin/crew_delete/"+$(this).val());
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
                   <h2>관리자 동행구하기게시판 관리</h2>
                </div>
             </div>
              <form name="requestForm" method="post" id="requestForm">	
	             <div class="table_section padding_infor_info">
	                <div class="table-responsive-sm">
	                   <table class="table">
	                      <thead>
	                         <tr>
	                            <th>순서</th>
	                            <th>작성자</th>
	                            <th>제목</th>
	                            <th>등록일</th>
	                            <th>수정일</th>
	                            <th>답변완료<th>                         
	                         </tr>
	                      </thead>	                   
	           			  <c:forEach items="${requestScope.list}" var="crewboard">   	           	           			 
		                      <tbody>
		                      	<tr>
		                         	<td>${crewboard.crewId}</td>
		                         	<td>${crewboard.user}</td>
		                            <td> <span><a href="${pageContext.request.contextPath}/board/crew_Detail/${crewboard.crewId}">${crewboard.crewTitle}</a></span></td>
		                            <td>${crewboard.crewRegdate}</td>  
		                            <td>${crewboard.crewRegdate}</td>  
		                            <td>${crewboard.crewState}</td>  		              	                       
		                            <td><button type="button" class="btn btn-primary" value="${crewboard.crewId}" id="delete">삭제하기</button></td> 
		                         </tr>
		                      </tbody>		             
		                  </c:forEach>
	                   </table>
	                </div>
	             </div>
	           </form>
          </div>
       </div>
	</body>
</html>