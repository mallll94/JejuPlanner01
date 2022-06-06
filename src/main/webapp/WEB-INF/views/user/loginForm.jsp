<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	//회원가입
	$("#register").click(function(){	
		$("#loginForm").attr("action","${pageContext.request.contextPath}/user/registerForm");	
		$("#loginForm").submit();
	})

})


</script>
</head>
<body>
<h1>로그인 대강</h1>

 ${pageContext.request.userPrincipal}이다

<form id="loginForm" method="post" action="${pageContext.request.contextPath}/loginCheck"> 
아이디<input type="text" name="id"/>
비밀번호<input type="password" name="pwd"/>
<button type="submit" id="login">로그인</button>
<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
</form>
<a class="btn btn-primary" id="findId" href="${pageContext.request.contextPath}/user/findForm?type=id">아이디찾기</a>
<a class="btn btn-primary" id="findPwd" href="${pageContext.request.contextPath}/user/findForm?type=pwd">비밀번호찾기</a>
<button type="button" id="register">회원가입</button>



<!-- 모달 아이디찾기 -->
<!-- 
<div class="modal fade" id="IdFindModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
      	
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">아이디찾기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="col-xxl">
					<div class="card mb-4">
						<div class="card-header d-flex align-items-center justify-content-between">
							<h5 class="mb-0">인증번호 확인</h5>
						</div>
					<div class="card-body">
                     
						<div class="row mb-3">
							<label class="col-sm-4 col-form-label" for="basic-default-name">코드 입력</label>
                        <div class="col-sm-10">
                        	<input type="text" id="code" class="form-control placeCategory-mask" name="code"/>
						</div>
						</div>
					</div>
                 </div>
               </div>
			</div>
			<div class="modal-footer">
				<button id="codeCheck" type="button" class="btn btn-primary">확인</button>
				<button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
 -->



</body>
</html>