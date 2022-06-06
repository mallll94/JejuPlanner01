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
	
	
	
})

</script>
</head>
<body>


<c:choose>
	<c:when test="${param.type == 'id'}">
		<form id="regForm" method="post" action="${pageContext.request.contextPath}/user/idFind">
			이름 <input type="text" name="userName"/><p>
			핸드폰 <input type="text" name="userPhone"/><p>
			이메일 <input type="text" name="userEmail"/><p>
			<input type="submit" value="조회하기"><p>
		</form>
	</c:when>
	<c:otherwise>
		<form id="regForm1" method="post" action="${pageContext.request.contextPath}/user/pwdFind">
			이름 <input type="text" name="userName"/><p>
			아이디 <input type="text" name="userId"/><p>
			핸드폰 <input type="text" name="userPhone"/><p>
			이메일 <input type="text" name="userEmail"/><p>
			<input type="submit" value="조회하기"><p>
		</form>
	
	</c:otherwise>
</c:choose>
문제가 있거나 도움이 필요하실 경우 1:1 문의로 연락 주시면 신속하게 해결해드리겠습니다.

</body>
</html>