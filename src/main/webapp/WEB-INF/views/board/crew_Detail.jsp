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
	
        $("button[value=수정]").click(function() {
        	$("#requestForm").attr("action", "${pageContext.request.contextPath}/board/crew_updateForm");
			$("#requestForm").submit();
		})
		
        $(document).on("click","#delete", function(){
	             
    		   	$("#requestForm").attr("action", "${pageContext.request.contextPath}/board/crew_delete/"+$(this).val());
    			$("#requestForm").submit();   	
	            });
		
		$("input[name=btnradio]").click(function(){
			$("#requestForm").attr("action", "${pageContext.request.contextPath}/board/crew_Detail/changeState");
			$("#requestForm").submit();
			
		})
			
})
        
</script>
</head>
<body>
<div class="row">
  <div class="col-xl">
    <div class="card mb-4">
      <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">동행구하기게시판 상세</h5> 
      </div>
      <br>
      <br>
     <form name="requestForm" method="post" id="requestForm">
      <div class="btn-group" role="group" aria-label="Basic radio toggle button group"  style="width: 400px; margin-left: 50px" >
       	  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" value="N" data-bs-toggle="modal" data-bs-target="#exampleModal1" checked>
		  <label class="btn btn-outline-primary" for="btnradio1" >동행구하는 중</label>
		    
		  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" value="Y"data-bs-toggle="modal" data-bs-target="#exampleModal2">
		  <label class="btn btn-outline-primary" for="btnradio2">동행구하기 완료</label>
	  </div>	
      <div class="card-body">
          <div class="mb-3">
            <label class="form-label" for="basic-default-fullname">제목</label>
            <input type="text" class="form-control" id="basic-default-fullname" name="crewTitle" value="${crewboard.crewTitle}"/>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-default-message">내용</label>
            <textarea id="basic-default-message" class="form-control" name="crewContent">${crewboard.crewContent}</textarea>
          </div>           
		     <input type="hidden" name="crewId" value="${crewboard.crewId}">
	         <button type="button" class="btn btn-primary" value="수정">수정하기</button>
	         <button type="button" class="btn btn-primary" value="${crewboard.crewId}" id="delete">삭제하기</button>
	         <button type="button" class="btn btn-primary" onclick="history.back()">목록보기</button>
       </div>
       </form>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">동행구하는 중으로 변경되었습니다.</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
    </div>
  </div>
</div>

<!-- Modal2 -->
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">동행구하기 완료로 변경되었습니다.</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
    </div>
  </div>
</div>
</body>
</html>