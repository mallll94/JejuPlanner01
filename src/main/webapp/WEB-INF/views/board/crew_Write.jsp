<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row">
  <div class="col-xl">
    <div class="card mb-4">
      <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">동행구하기 등록</h5> 
      </div>
      <div class="card-body">
        <form name="writeForm" method="post" action="${pageContext.request.contextPath}/board/crew_Insert"  enctype="multipart/form-data">
          <div class="mb-3">
            <label class="form-label" for="basic-default-fullname">제목</label>
            <input type="text" class="form-control" id="basic-default-fullname" name="crewTitle" placeholder="제목을 입력해주세요" />
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-default-message">내용</label>
            <textarea id="basic-default-message" class="form-control" name="crewContent" placeholder="내용을 입력해주세요"></textarea>
          </div>
          <input type="hidden"  value="N" name="crewState"/>         
          <button type="submit" class="btn btn-primary">작성하기</button>
          <button type="reset" class="btn btn-primary">취소하기</button>
        </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>