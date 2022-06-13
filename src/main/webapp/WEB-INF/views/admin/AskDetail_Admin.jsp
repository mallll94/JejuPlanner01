<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 상세보기</title>


<script type="text/javascript">

$(function() {
		
	$("input[name=btnradio]").click(function(){
		$("#requestForm").attr("action", "${pageContext.request.contextPath}/admin/detail/complete");
		$("#requestForm").submit();
		
	})
		
});


</script>


</head>
<body>

    <!-- Contact Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5" style="text-align: center;"><span class="px-2">관리자 1:1 문의 상세보기</span></h2> 
        </div>
        
        <div align="center">
            <div class="col-lg-7 mb-5">
                <div class="contact-form">
                    <div id="success"></div>
                    
                    <form name="requestForm" method="post" id="requestForm">
                    <input type="hidden" name="askId" value="${askboard.askId}">
                  <div class="btn-group" role="group" aria-label="Basic radio toggle button group"  style="margin-left: 89.5%" >
       	            <input type="radio"  value="Y" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
		            <label class="btn btn-outline-primary" for="btnradio1" >답변완료</label>
	              </div>
                  
                  
                                
                    <div class="control-group" style="text-align: left;">
                            카테고리 <input type="text" readonly class="form-control" id="askCategory" name="askCategory" value="${askboard.askCategory}"/>
                            <p class="help-block text-danger"></p>
                    </div>            
                    <div class="control-group" style="text-align: left;">
                            제목 <input type="text" readonly class="form-control" id="askTitle" name="askTitle" value="${askboard.askTitle}"/>
                            <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group" style="text-align: left;">
                           내용 <textarea readonly class="form-control" rows="6" id="askContent" name="askContent" style="resize: none">${askboard.askContent}</textarea>
                            <p class="help-block text-danger"></p>
                    </div>
	               
	                <h5 class="card-header" style="text-align: left;">첨부파일</h5>
		             <div class="card-body" align="left">
		              <div class="mb-3">
		                <img alt = "첨부된 이미지" src="/images/ask/${askboard.askAttach}" width="300" height="300">
		              </div>
		            </div>
                   </form> 
                                     
                </div>
            </div>
 
        </div>
    </div>
    <!-- Contact End -->

<!-- Reply -->
<div class="control-group" style="margin-left: 320px; margin-right:320px">
답변 
<c:forEach items="${replylist}" var="reply">
<div>
  <textarea readonly class="form-control" id="askReplyContent" name="askReplyContent" style="resize: none;">
	${reply.askReplyContent}
  </textarea>
</div>

<div style="margin-left: 820px">  
   <span>
     <a href="${pageContext.request.contextPath}/reply/delete/${reply.askReplyId}/${askboard.askId}">삭제하기</a>
   </span>
</div>
</c:forEach> 
</div>


