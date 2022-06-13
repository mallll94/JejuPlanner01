<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="/js/azentaMaster/bootstrap.min.js"></script>
<script type="text/javascript">

$(function(){

	function selectAll(){
		$.ajax({
			url:"${pageContext.request.contextPath}/chat/chatAll", //서버요청주소
			type:"post", // 요청방식(get, post)
			traditional: true,
			dataType:"json",//서버가 응답해주는 데이터타입(text,html,xml,json)
			//data:"${_csrf.parameterName}=${_csrf.token}",//서버에게 보낼 parameter정보
			data: { '${_csrf.parameterName}' : '${_csrf.token}' ,chatRoom : ${param.no}},
   			success :function(result){	
					var data = "";
   				
					$.each(result.msg, function(index, item){
						if(result.userId == item.senderUserId){

							data +=`<div class='row'>`;
							data +=`<div class='col-sm'>${'${item.chatContent}'}</div>`;
							data +=`<div class='col-sm'></div>`;
							data +=`</div>`;
							data +=`<div class='row'>`;
							data +=`<div class='col-sm'>${'${item.chatSend}'}</div>`;
							data +=`<div class='col-sm'></div>`;
							data +=`</div>`;
							data +=`<hr>`;
								
						}else{
							data +=`<div class='row'>`;
							data +=`<div class='col-sm'></div>`;
							data +=`<div class='col-sm'>${'${item.chatContent}'}</div>`;
							data +=`</div>`;
							data +=`<div class='row'>`;
							data +=`<div class='col-sm'></div>`;
							data +=`<div class='col-sm'>${'${item.chatSend}'}</div>`;
							data +=`</div>`;				
							data +=`<hr>`;
						}

					})
					
					
					
					
					$("#sendId").val(result.userId);
					$("#receId").val(result.receId);
					
					if($("#receId").val()==null || $("#receId").val()==""){
						$("#receId").val('${param.receId}');
					}
					
					
					$("#list").html("");
   					$("#list").html(data);
   					
   					
   				},error : function(err){  
   					alert(err+"에러 발생했어요.");
   				}  //실팽했을때 실행할 함수 
   			});
	}
	
	//메신저 보내기
	
	$("#send").click(function(){
		$.ajax({
			url:"${pageContext.request.contextPath}/chat/send", //서버요청주소
			type:"post", // 요청방식(get, post)
			//traditional: true,
			dataType:"text",//서버가 응답해주는 데이터타입(text,html,xml,json)
			data: { '${_csrf.parameterName}' : '${_csrf.token}' ,msg : $("#message").val() ,chatRoom : ${param.no}, sendId : $("#sendId").val(), receId : $("#receId").val()},
			success :function(result){		
   				selectAll();
   				
			},error : function(request, status, error){

				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

			}
		});
	})
	
	
	
	
	selectAll();
})

</script>
</head>
<body>
<h1>쪽지함</h1>




<div class="container" id = "list">

</div>

<%-- <form method="post" action="${pageContext.request.contextPath}/chat/chatAll">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"> --%>
<%-- <input type="text" id="chatRoom" name="chatRoom" value="${param.no}"> --%>
<input type="text" id="sendId" name ="sendId" >
<input type="text" id="receId" name="receId">
<input type="text" id="message">

<button type="button" id="send">send</button>
<!-- </form> -->

</body>
</html>