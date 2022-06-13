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
			url:"${pageContext.request.contextPath}/chat/chatAll",
			type:"post",
			traditional: true,
			dataType:"json",
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
			url:"${pageContext.request.contextPath}/chat/send",
			type:"post", 
			dataType:"text",
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

<div class="container" id = "list"></div>
<input type="hidden" id="sendId" name ="sendId" >
<input type="hidden" id="receId" name="receId">
<input type="text"id="message" >
<button type="button" id="send" >send</button>

</body>
</html>