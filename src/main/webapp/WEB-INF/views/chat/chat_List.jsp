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
    	function selectAll(){
			$.ajax({
				url:"${pageContext.request.contextPath}/chat/select", //서버요청주소
				type:"post", // 요청방식(get, post)
				traditional: true,
				dataType:"json",//서버가 응답해주는 데이터타입(text,html,xml,json)
				//data:"${_csrf.parameterName}=${_csrf.token}",//서버에게 보낼 parameter정보
				data: { '${_csrf.parameterName}' : '${_csrf.token}'},
	   			success :function(result){
					
	   					var data ="";

	   				},error : function(err){  
	   					alert(err+"에러 발생했어요.");
	   				}  //실팽했을때 실행할 함수 
	   			});
		}
    	
    	
    	
    	
    })
    
    
    
    </script>
    
</head>
<body>
<h1>채팅목록</h1>


</body>
</html>