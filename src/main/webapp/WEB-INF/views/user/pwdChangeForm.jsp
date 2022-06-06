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
<form id="changeCheck" method="post" action="${pageContext.request.contextPath}/user/pwdUpdate"> 
비밀번호<input type="password" name="userPassword"/>
비밀번호확인<input type="password" name="userPassword2"/>
<button type="submit" id="login">변경</button>
<input type="text" value="${userId}" name="userId">
<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
</form>
</body>
</html>