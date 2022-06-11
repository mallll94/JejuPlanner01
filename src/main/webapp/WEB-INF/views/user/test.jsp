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




<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				
			<div class="col-lg">
				<div class="login_form_inner">
					<h3>회원가입</h3>
					<form class="row login_form" id="regForm" method="post" action="${pageContext.request.contextPath}/user/idFind" >
						<div class="col-md-12 form-group">
							<label class="form-label" >아이디</label><span id="idCheckView"></span>
							<input type="text" class="form-control" id="userId" name="userId" /><button type="button" class="button button-login w-30" id="doubleCheck" value="">중복확인</button>
						</div>
						<div class="col-md-12 form-group">
							<label class="form-label" >이름</label>
							<input type="text" class="form-control" id="userName" name="userName"  />
						</div>
						<div class="col-md-12 form-group">
							<label class="form-label" >비밀번호</label><div class="form-text">중복확인하는 칸</div>
							<input type="password" id="userPassword" class="form-control" name ="userPassword"/>
						</div>
						<div class="col-md-12 form-group">
							<label class="form-label" >비밀번호확인</label>
							<input type="password" id="userPassword2" class="form-control" name ="userPassword2"/>
						</div>
						<div class="col-md-12 form-group">
							<label class="form-label" for="basic-default-message">성별</label>
							<select class="form-select" size="1" id="userGender" class="form-control" name ="userGender">
								<option value="M">남자</option>
								<option value="F">여자</option>
							</select>
						</div>
						<div class="col-md-12 form-group">
							<label class="form-label" >휴대폰 번호</label>
							<input type="text" id="userPhone" class="form-control" name ="userPhone"/>
						</div>
						<div class="col-md-12 form-group">
							<label class="form-label" >이메일주소</label>
							<input type="text" id="userEmail" class="form-control" name ="userEmail"/>
						</div>
						<div class="col-md-12 form-group">
							<button type="submit"  class="button button-login w-100">조회하기</button>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<input type="hidden" name="role" value="ROLE_USER">
					</form>
						<input type="hidden" id="doubleCheckResult"/>
					<div style="padding-bottom: 150px;">문제가 있거나 도움이 필요하실 경우 1:1 문의로 연락 주시면 신속하게 해결해드리겠습니다.</div>
				</div>
			</div>
		</div>
	</div>
</section>




























</body>
</html>