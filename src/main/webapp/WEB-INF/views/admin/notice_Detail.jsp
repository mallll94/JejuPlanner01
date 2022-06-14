<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
 <head>
    <meta charset="utf-8" />
    

    <title>공지사항 상세</title>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
<script type="text/javascript">
        
        $(function(){	
	
        $("button[value=수정]").click(function() {
        	$("#requestForm").attr("action", "${pageContext.request.contextPath}/admin/notice_updateForm");
			$("#requestForm").submit();
		})
		
        $("button[value=삭제]").click(function() {
        	$("#requestForm").attr("action", "${pageContext.request.contextPath}/noticeDelete");
			$("#requestForm").submit();
		});
     })
        
</script>

</head>
<body>
  <div class="row">
    <div class="col-xl">
      <div class="card mb-4">
        <div class="card-header d-flex justify-content-between align-items-center">
          <h5 class="mb-0">공지사항 상세</h5> 
        </div>
        <div class="card-body">
            <div class="mb-3">
              <label class="form-label" for="basic-default-fullname">제목</label>
              <input type="text" class="form-control" id="basic-default-fullname" name="noticeTitle" placeholder="제목을 입력해주세요" value="${notice.noticeTitle}"/>
            </div>
            <div class="mb-3">
              <label class="form-label" for="basic-default-message">내용</label>
              <textarea id="basic-default-message" class="form-control" name="noticeContent" placeholder="내용을 입력해주세요">${notice.noticeContent}</textarea>
            </div>           
          <div class="card">
            <h5 class="card-header">첨부파일</h5>
            <div class="card-body">
              <div class="mb-3">
                <img alt="첨부된 이미지"  src="/images/notice/${notice.noticeAttach}"  width="300" height="300">
              </div>
            </div>
          </div>
         <form name="requestForm" method="post" id="requestForm">
            <input type="hidden" name="noticeId" value="${notice.noticeId}">
              <button type="button" class="btn btn-primary" value="수정">수정하기</button>
              <button type="button" class="btn btn-primary" value="삭제">삭제하기</button>
            </form>
        </div>
      </div>
    </div>
  </div>
</body>
</html>