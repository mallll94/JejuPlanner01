<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/vendors/linericon/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/vendors/nouislider/nouislider.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/css/header.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$("#changeCheck").submit(function(){			
		if($("#changeCheck :input[name=userPassword]").val().trim()==""){
			alert("패스워드를 입력하세요");				
			return false;
		}
		if($("#changeCheck :input[name=userPassword]").val().trim()!=$("#changeCheck :input[name=userPassword2]").val().trim()){
			alert("비밀번호가 다릅니다");				
			return false;
		}
	});
	
	
})
</script>
</head>
<body>



<section class="login_box_area section-margin">
	<div class="container">
		<div class="row">
			
		<div class="col-lg">
			<div class="login_form_inner">
				<h3>비밀번호 변경</h3>
				<form class="row login_form" id="changeCheck" method="post" action="${pageContext.request.contextPath}/user/pwdUpdate" >
						<div class="col-md-12 form-group">
							<label class="form-label" >비밀번호</label>
							<input type="password" id="userPassword" class="form-control" name ="userPassword"/>
						</div>
						<div class="col-md-12 form-group">
							<label class="form-label" >비밀번호확인</label>
							<input type="password" id="userPassword2" class="form-control" name ="userPassword2"/>
						</div>
					
					
					<div class="col-md-12 form-group">
						<button type="submit"  class="button button-login w-100">변경하기</button>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				</form>
				<div style="padding-bottom: 150px;">문제가 있거나 도움이 필요하실 경우 1:1 문의로 연락 주시면 신속하게 해결해드리겠습니다.</div>
			</div>
		</div>
		</div>
	</div>
</section>























</body>
</html>