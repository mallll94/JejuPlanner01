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
<h1>로그인 대강</h1>
<form method="post" action="${pageContext.request.contextPath}/user/login"> 
아이디<input type="text" id="userId"/>
비밀번호<input type="text" id="userPassword"/>
<button type="button" id="login">로그인</button>
<button type="button" id="findId">아이디찾기</button>
<button type="button" id="findPwd">비밀번호찾기</button>
<button type="button" id="join">회원가입</button>
</form>
</body>
</html>