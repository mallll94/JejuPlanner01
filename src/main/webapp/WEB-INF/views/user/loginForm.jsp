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
	//아이디 찾기
	$("#findId").click(function(){	
		location.href = "${pageContext.request.contextPath}/user/findForm?type=id";
	})
	
	$("#findPwd").click(function(){	
		location.href = "${pageContext.request.contextPath}/user/findForm?type=pwd";
	})

})


</script>
</head>
<body>
<%-- <h1>로그인 대강</h1>

 ${pageContext.request.userPrincipal}이다

<form id="loginForm" method="post" action="${pageContext.request.contextPath}/loginCheck"> 
아이디<input type="text" name="id"/>
비밀번호<input type="password" name="pwd"/>
<button type="submit" id="login">로그인</button>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>
<a class="btn btn-primary" id="findId" href="${pageContext.request.contextPath}/user/findForm?type=id">아이디찾기</a>
<a class="btn btn-primary" id="findPwd" href="${pageContext.request.contextPath}/user/findForm?type=pwd">비밀번호찾기</a>
<button type="button" id="register">회원가입</button> --%>




<section class="login_box_area section-margin">
	<div class="container">
		<div class="row">
			<div class="col-lg-6">
				<div class="login_box_img">
					<div class="hover">
						<h4>New to our website?</h4>
						<p>There are advances being made in science and technology everyday, and a good example of this is the</p>
						<a class="button button-account" href="${pageContext.request.contextPath}/user/registerForm" id="register">Create an Account</a>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="login_form_inner">
					<h3>Log in to enter</h3>
					<form class="row login_form" id="loginForm" method="post" action="${pageContext.request.contextPath}/loginCheck" >
						<div class="col-md-12 form-group">
							<input type="text" class="form-control" id="name" name="id" placeholder="Username" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username'">
						</div>
						<div class="col-md-12 form-group">
							<input type="password" class="form-control" id="name" name="pwd" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'">
						</div>
						
						<div class="col-md-12 form-group">
							<button type="submit" id="login" class="button button-login w-100">Log In</button>
							<a href="${pageContext.request.contextPath}/user/findForm?type=id">Forgot Id?</a>
							<a href="${pageContext.request.contextPath}/user/findForm?type=pwd">Forgot Password?</a>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					</form>
				</div>
			</div>
		</div>
	</div>
</section>







</body>
</html>