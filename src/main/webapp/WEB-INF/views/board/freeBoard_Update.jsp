<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function() {
	

	$(document).ready(function(){
	
		$("#freeBoard").on("submit" , function(){
			
			if( $("#freeCategory").val() == "none"){
				alert("카테고리를 선택해주세요");
				return false;
			}
			
			if( $("#freeTitle").val() == ""){
				alert("제목을 입력해주세요");
				return false;
			}
			
			if( $("#freeContent").val() == ""){
				alert("내용을 입력해주세요");
				return false;
			}
		       
		})
			
	})

});

</script>

</head>
<body>

<!-- Contact Start -->
<div class="container-fluid pt-5">
  <div class="text-center mb-4">
     <h2 class="section-title px-5"><span class="px-2">소통게시판 수정</span></h2> 
  </div>
    
   <div align="center">
      <div class="col-lg-7 mb-5">
        <div class="contact-form">
          <div id="success"></div>
  
     <form name="freeBoard" id="freeBoard" method="post" action="${pageContext.request.contextPath}/board/freeBoard_update"  enctype="multipart/form-data">
	    <input type="hidden" value="${freeBoard.freeId}" id="freeId" name="freeId">                
	    <div class="control-group" style="text-align: left;">
	         카테고리 <select name="freeCategory" id="freeCategory" class="form-select" aria-label="Default select example">
	            <option  value="none" selected>카테고리 선택</option>
	            <option value="여행추천">여행추천</option>
	            <option value="장소추천">장소추천</option>    
	         </select>
	            <p class="help-block text-danger"></p>
	    </div>
	    <div class="control-group" style="text-align: left;">
	      제목 <input type="text"  class="form-control" id="freeTitle" name="freeTitle" value="${freeBoard.freeTitle}"/>
	    <p class="help-block text-danger"></p></div>
	    <div class="control-group" style="text-align: left;">
	       내용 <textarea  class="form-control" rows="6" id="freeContent" name="freeContent">${freeBoard.freeContent}</textarea>
	    <p class="help-block text-danger"></p></div>
	
		<h5 class="card-header" style="text-align: left;">첨부파일</h5>
		<div class="control-group">
	        <input type="file" class="form-control" id="freeAttach" name="file" placeholder="Attach"
	          accept=".png, .jpg" />
	        <p class="help-block text-danger"></p>
		</div> 
	    <div class="card-body" style="text-align: left;">
		  <div class="mb-3">
			<img alt = "첨부된 이미지" src="/images/freeBoard/${freeBoard.freeAttach}" width="300" height="300">
	     </div>
	    </div>
	       <div align="right"> 
	        <input type="hidden"  value="${freeBoard.freeId}" name="freeId"/>         
	        <button type="submit" class="btn btn-primary">수정</button>
	        <button type="reset" class="btn btn-primary">취소</button>
	        <button type="button" class="btn btn-primary" onclick="location.href='freeBoard'">목록</button> 
	       </div>            
     </form>
            
       </div>
     </div>
  </div>
</div>
<!-- Contact End -->

    
    
</body>
</html>