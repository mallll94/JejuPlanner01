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
				url:"${pageContext.request.contextPath}/chat/selectAll", //서버요청주소
				type:"post", // 요청방식(get, post)
				traditional: true,
				dataType:"json",//서버가 응답해주는 데이터타입(text,html,xml,json)
				//data:"${_csrf.parameterName}=${_csrf.token}",//서버에게 보낼 parameter정보
				data: { '${_csrf.parameterName}' : '${_csrf.token}'},
	   			success :function(result){
						
	   					
	   					var data = "<table>";
	   					data+="<tr>";
						data+="<td>채팅방번호</td>";
						data+="<td>보낸사람이름</td>";
						data+="<td>내용</td>";
						data+="<td>시간</td>";
						data+="<td>안읽은 쪽지 여부</td>";
						data+="</tr>";
						$.each(result, function(index, item){
							
						 	data+=`<tr>`;
							data+=`<td>${"${item.chatRoom}"}</td>`;
							data+=`<td>${'${item.senderUserId}'}</td>`;
							data+=`<td><a href='${pageContext.request.contextPath}/chat/chat_Room?no=${"${item.chatRoom}"}'>${'${item.chatContent}'}</a></td>`;
							data+=`<td>${'${item.chatSend}'}</td>`;
							if(item.chatCheck==0){
								data+=`<td>새로옴</td>`;
							}else{
								data+=`<td>읽음</td>`;
							}
							
							data+=`</tr>`;
							 
						})
						data+="</table>";
						
						$("#table").html("");
	   					$("#table").html(data);
	   					
	   					
	   				},error : function(err){  
	   					alert(err+"에러 발생했어요.");
	   				}  //실팽했을때 실행할 함수 
	   			});
		} 	
    	selectAll();
    })
    
    
    
    </script>
    
</head>
<body>




<div id="table"></div>

</body>
</html>