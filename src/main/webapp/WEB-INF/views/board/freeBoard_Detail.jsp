<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	$(function(){
		$("button[value=수정]").click(function() {
	    	$("#requestForm").attr("action", "${pageContext.request.contextPath}/board/freeBoard_updateForm");
			$("#requestForm").submit();
		})
		
		   $(document).on("click","#delete", function(){
	             
   		   	$("#requestForm").attr("action", "${pageContext.request.contextPath}/board/freeBoard_delete/"+$(this).val());
   			$("#requestForm").submit();   	
	            });
	 }) 

</script>
</head>
<body>
	<div class="container-fluid pt-5">
  		<div class="text-center mb-4">
      		<h2 class="section-title px-5"><span class="px-2">소통하기 게시판</span></h2> 
  	</div>  
  	<div class="row px-xl-5">
      <div class="col-lg-7 mb-5">
          <div class="contact-form">           
	 		<div class="control-group">
	         	카테고리 <input type="text" readonly class="form-control" id="freeCategory" name="freeCategory" value="${freeBoard.freeCategory}"/>
	         <p class="help-block text-danger"></p>
	 		</div>
	 		<div class="control-group">
	         	제목 <input type="text" readonly class="form-control" id="freeTitle" name="freeTitle" value="${freeBoard.freeTitle}"/>
	         <p class="help-block text-danger"></p>
	 		</div>
	 		<div class="control-group">
	        	내용 <textarea readonly class="form-control" rows="6" id="freeContent" name="freeContent">${freeBoard.freeContent}</textarea>
	         <p class="help-block text-danger"></p>
	 		</div>
	  		<h5 class="card-header">첨부파일</h5>
			<div class="card-body">
 				<div class="mb-3">
   				   <img alt = "첨부된 이미지" src="/images/freeBoard/${freeBoard.freeAttach}" width="300" height="300">
  				</div>
			</div>
       <div align="right">
       <form name="requestForm" method="post" id="requestForm">
       <input type="hidden" name="freeId" value="${freeBoard.freeId}">
	      <button type="button" class="btn btn-primary" value="수정">수정</button>
	      <button type="button" class="btn btn-primary" value="${freeBoard.freeId}" id="delete">삭제</button>
	      <button type="button" class="btn btn-primary" onclick="location.href='freeBoard'">목록</button>   
       </form>  
      </div> 	
     </div>            
  </div>
</div>
</div>
</html>