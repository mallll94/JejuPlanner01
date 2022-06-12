<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>


    
    

</head>
<body>

<!-- Contact Start -->
<div class="container-fluid pt-5">
  <div class="text-center mb-4">
     <h2 class="section-title px-5"><span class="px-2">플래너공유 게시판</span></h2> 
  </div>
    
    <div align="center">
      <div class="col-lg-7 mb-5">
        <div class="contact-form">
          <div id="success"></div>
  
     <form name="planBoard" id="contactForm" novalidate="novalidate" method="post" action="${pageContext.request.contextPath}/board/pupdate" onSubmit='return checkValid()' enctype="multipart/form-data">
    <input type="hidden" value="${planBoard.pboardId}" id="pboardId" name="pboardId">                
    <div class="control-group" style="text-align: left;">
      카테고리 <input type="text"  readonly class="form-control" id="pboardCategory" name="pboardCategory" value="${planBoard.pboardCategory}"/>
    <p class="help-block text-danger"></p></div>
    <div class="control-group" style="text-align: left;">
      제목 <input type="text"  class="form-control" id="pboardTitle" name="pboardTitle" value="${planBoard.pboardTitle}"/>
    <p class="help-block text-danger"></p></div>
    <div class="control-group" style="text-align: left;">
       내용 <textarea  class="form-control" rows="6" id="pboardContent" name="pboardContent" style="resize: none">${planBoard.pboardContent}</textarea>
    <p class="help-block text-danger"></p></div>

	<h5 class="card-header" style="text-align: left;">첨부파일</h5>
	<div class="control-group">
        <input type="file" class="form-control" id="pboardAttach" name="file" placeholder="Attach"
         required="required" data-validation-required-message="Please enter a file" accept=".png, .jpg" />
        <p class="help-block text-danger"></p>
	</div> 
    <div class="card-body" style="text-align: left;">
	  <div class="mb-3">
		<img alt = "첨부된 이미지" src="/images/planboard/${planBoard.pboardAttach}" width="300" height="300">
     </div>
    </div>

   <div align="right">
     <button class="btn btn-primary py-1 px-2" type="submit" id="sendMessageButton">수정하기</button>
     <!-- <button onclick="location = '/board/Planboard_Detail'" class="btn btn-primary py-1 px-2" type="submit" id="sendMessageButton">수정하기</button> -->
   </div>
                
 </form>
            
       </div>
     </div>
  </div>
</div>
<!-- Contact End -->

    
    
</body>
</html>