<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
 <head>
    <meta charset="utf-8" />

    <title>공지사항 등록</title>
    
 

</head>
<body>
<div class="row">
  <div class="col-xl">
    <div class="card mb-4">
      <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">공지사항 등록</h5> 
      </div>
      <div class="card-body">
        <form name="writeForm" method="post" action="${pageContext.request.contextPath}/admin/insert" onSubmit='return checkValid()' enctype="multipart/form-data">
          <div class="mb-3">
            <label class="form-label" for="basic-default-fullname">제목</label>
            <input type="text" class="form-control" id="basic-default-fullname" name="noticeTitle" placeholder="제목을 입력해주세요" />
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-default-message">내용</label>
            <textarea id="basic-default-message" class="form-control" name="noticeContent" placeholder="내용을 입력해주세요"></textarea>
          </div>           
		    <div class="card">
		      <h5 class="card-header">첨부파일</h5>
		      <div class="card-body">
		        <div class="mb-3">
		          <input class="form-control" type="file" name="file" accept=".png, .jpg, .gif]">
		        </div>
		      </div>
		    </div>
          <button type="submit" class="btn btn-primary">작성하기</button>
          <button type="reset" class="btn btn-primary">취소하기</button>
        </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>