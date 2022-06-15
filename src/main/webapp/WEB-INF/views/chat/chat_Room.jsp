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

<style type="text/css">
body {
  padding-top: 0;
  font-size: 18px;
  color: #777;
  background: #f9f9f9;
  font-family: 'Open Sans',sans-serif;
  margin-top:20px;
}

.bg-white {
  background-color: #fff;
}

.friend-list {
  list-style: none;
margin-left: -40px;
}

.friend-list li {
  border-bottom: 1px solid #eee;
}

.friend-list li a img {
  float: left;
  width: 45px;
  height: 45px;
  margin-right: 10px;
}

 .friend-list li a {
  position: relative;
  display: block;
  padding: 10px;
  transition: all .2s ease;
  -webkit-transition: all .2s ease;
  -moz-transition: all .2s ease;
  -ms-transition: all .2s ease;
  -o-transition: all .2s ease;
}

.friend-list li.active a {
  background-color: #f1f5fc;
}

.friend-list li a .friend-name, 
.friend-list li a .friend-name:hover {
  color: #777;
}

.friend-list li a .last-message {
  width: 65%;
  white-space: nowrap;
  text-overflow: ellipsis;
  overflow: hidden;
}

.friend-list li a .time {
  position: absolute;
  top: 10px;
  right: 8px;
}

small, .small {
  font-size: 85%;
}

.friend-list li a .chat-alert {
  position: absolute;
  right: 8px;
  top: 27px;
  font-size: 10px;
  padding: 3px 5px;
}

.chat-message {
  padding: 60px 20px 115px;
  height : 700px;
  overflow: scroll;
}

.chat {
    list-style: none;
    margin: 0;
}

.chat-message{
    background: #f9f9f9;  
}

.chat li img {
  width: 45px;
  height: 45px;
  border-radius: 50em;
  -moz-border-radius: 50em;
  -webkit-border-radius: 50em;
}

img {
  max-width: 100%;
}

.chat-body {
  padding-bottom: 20px;
}

.chat li.left .chat-body {
  margin-left: 70px;
  background-color: #fff;
}

.chat li .chat-body {
  position: relative;
  font-size: 18px;
  padding: 10px;
  border: 1px solid #f1f5fc;
  box-shadow: 0 1px 1px rgba(0,0,0,.05);
  -moz-box-shadow: 0 1px 1px rgba(0,0,0,.05);
  -webkit-box-shadow: 0 1px 1px rgba(0,0,0,.05);
}

.chat li .chat-body .header {
  padding-bottom: 5px;
  border-bottom: 1px solid #f1f5fc;
}

.chat li .chat-body p {
  margin: 0;
}

.chat li.left .chat-body:before {
  position: absolute;
  top: 10px;
  left: -8px;
  display: inline-block;
  background: #fff;
  width: 16px;
  height: 16px;
  border-top: 1px solid #f1f5fc;
  border-left: 1px solid #f1f5fc;
  content: '';
  transform: rotate(-45deg);
  -webkit-transform: rotate(-45deg);
  -moz-transform: rotate(-45deg);
  -ms-transform: rotate(-45deg);
  -o-transform: rotate(-45deg);
}

.chat li.right .chat-body:before {
  position: absolute;
  top: 10px;
  right: -8px;
  display: inline-block;
  background: #fff;
  width: 16px;
  height: 16px;
  border-top: 1px solid #f1f5fc;
  border-right: 1px solid #f1f5fc;
  content: '';
  transform: rotate(45deg);
  -webkit-transform: rotate(45deg);
  -moz-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  -o-transform: rotate(45deg);
}

.chat li {
  margin: 15px 0;
}

.chat li.right .chat-body {
  margin-right: 70px;
  background-color: #fff;
}

.chat-box {
/*
  position: fixed;
  bottom: 0;
  left: 444px;
  right: 0;
*/
  padding: 15px;
  border-top: 1px solid #eee;
  transition: all .5s ease;
  -webkit-transition: all .5s ease;
  -moz-transition: all .5s ease;
  -ms-transition: all .5s ease;
  -o-transition: all .5s ease;
}

.primary-font {
  color: #3c8dbc;
}

a:hover, a:active, a:focus {
  text-decoration: none;
  outline: 0;
}

.btn-success {
    color: #fff;
    background-color: #fe9f29;
    border-color: #fe9f29;
}

</style>
<script type="text/javascript">

$(function(){
	function selectListAll(){
		$.ajax({
			url:"${pageContext.request.contextPath}/chat/selectAll", //서버요청주소
			type:"post", // 요청방식(get, post)
			traditional: true,
			dataType:"json",//서버가 응답해주는 데이터타입(text,html,xml,json)
			//data:"${_csrf.parameterName}=${_csrf.token}",//서버에게 보낼 parameter정보
			data: { '${_csrf.parameterName}' : '${_csrf.token}'},
   			success :function(result){

   					var data = "";

					$.each(result.resultList, function(index, item){
						var time = new Date(item.chatSend);
						var month = (time.getMonth()+1);
						var date = time.getDate();
						var day = time.getDay();
						var hour = time.getHours();
						var min = time.getMinutes();
						var total = month+"-"+date+"  "+hour+":"+min;
						
						data +=`<li class='active bounceInDown'>`;
						data +=`<a href='#' id='room' class='clearfix' mal='${"${item.chatRoom}"}'>`;
						data +=`<img src='https://bootdey.com/img/Content/user_1.jpg' alt='' class='img-circle'>`;
						data +=`<div class='friend-name'>`;
						data +=`<strong>${'${item.senderUserId}'}</strong>`;
						data +=`</div>`;
						data +=`<div class='last-message text-muted'>${'${item.chatContent}'}</div>`;
						data +=`<small class='time text-muted'>${'${total}'}</small>`;
						
						if(item.senderUserId == result.loginUser.userId){
							data +=`<small class="chat-alert text-muted"><i class="fa fa-reply"></i></small>`//답장 내가 쓴글
						}else{
							if(item.chatCheck ==0){
								data +=`<small class='chat-alert label label-danger'>1</small>`;//안읽음
							}else{
								data +=`<small class="chat-alert text-muted"><i class="fa fa-check"></i></small>`//읽기만함
							}							
						}
						
						
						data +=`</a>`;
						data +=`</li>`;
	 
					})
					
					$("#table").html("");
   					$("#table").html(data);
   					
   					
   				},error : function(err){  
   					alert(err+"에러 발생했어요.");
   				}  //실팽했을때 실행할 함수 
   			});
	} 	
	
	$(document).on("click","#room",function(){

		selectAll($(this).attr("mal"))
	})
	
	
	//채티방
	function selectAll(no){

		
		$.ajax({
			url:"${pageContext.request.contextPath}/chat/chatAll",
			type:"post",
			traditional: true,
			dataType:"json",
			data: { '${_csrf.parameterName}' : '${_csrf.token}' ,chatRoom : no},
   			success :function(result){	
					var data = "";
   				
					$.each(result.msg, function(index, item){
						if(result.userId != item.senderUserId){
							var time = new Date(item.chatSend);
							var month = (time.getMonth()+1);
							var date = time.getDate();
							var day = time.getDay();
							var hour = time.getHours();
							var min = time.getMinutes();
							var total = month+"-"+date+"  "+hour+":"+min;
							
							
							data +=`<li class='right clearfix'>`;
							data +=`<span class='chat-img pull-right'>`;
							data +=`<img src='https://bootdey.com/img/Content/user_1.jpg' alt='User Avatar'>`;
							data +=`</span>`;
							data +=`<div class='chat-body clearfix'>`;
							data +=`<div class='header'>`;
							data +=`<strong class='primary-font'>${"${item.receiverUserId}"}</strong>`;
							data +=`<small class='pull-right text-muted'><i class='fa fa-clock-o'></i>${"${total}"}</small>`;
							data +=`</div>`;
							data +=`<p>${'${item.chatContent}'}</p></div></li> `;

						}else{
							var time = new Date(item.chatSend);
							var month = (time.getMonth()+1);
							var date = time.getDate();
							var day = time.getDay();
							var hour = time.getHours();
							var min = time.getMinutes();
							var total = month+"-"+date+"  "+hour+":"+min;
							
							data +=`<li class='left clearfix'>`;
							data +=`<span class='chat-img pull-left'>`;
							data +=`<img src='https://bootdey.com/img/Content/user_3.jpg' alt='User Avatar'>`;
							data +=`</span>`;
							data +=`<div class='chat-body clearfix'>`;
							data +=`<div class='header'>`;
							data +=`<strong class='primary-font'>${"${item.receiverUserId}"}</strong>`;
							data +=`<small class="pull-right text-muted"><i class="fa fa-clock-o"></i>${"${total}"}</small>`;
							data +=`</div>`;
							data +=`<p>${'${item.chatContent}'}</p></div></li>`;
	
						}

					})
					
					
					
					
					$("#sendId").val(result.userId);
					$("#receId").val(result.receId);
					
					if($("#receId").val()==null || $("#receId").val()==""){
						$("#receId").val('${param.receId}');
					}
					
					$("#send").val(no);
					$("#chatMessage").html("");
   					$("#chatMessage").html(data);
   					
   					$("#chatDiv").scrollTop($('#chatDiv')[0].scrollHeight);
   				},error : function(request, status, error){  
   					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
   				}  //실팽했을때 실행할 함수 
   			});
	}
	
	//메신저 보내기
	
	$("#send").click(function(){
		
			var chroom ="";
			var rId = "";
			if($("#send").val() ==null || $("#send").val() == ""){
				chroom =${param.no};
				$("#fristreceId").val();
				rId ='${param.receId}';
			}else{
				chroom=$("#send").val();
				rId=$("#receId").val();
			}
			
		if(chroom != 0){
			
			$.ajax({
				url:"${pageContext.request.contextPath}/chat/send",
				type:"post", 
				dataType:"text",
				data: { '${_csrf.parameterName}' : '${_csrf.token}' ,msg : $("#message").val() ,chatRoom : chroom, receId : rId},
				success :function(result){
					
	   				selectAll(chroom);	
	   				selectListAll();
				},error : function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
	})
	//selectAll();
	selectListAll();
})

</script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>

<div class="container bootstrap snippets bootdey">
    <div class="row">
		<div class="col-md-4 bg-white ">
            <div class=" row border-bottom padding-sm" style="height: 40px;">
            	목록
            </div>
            
            <!-- =============================================================== -->
            <!-- member list -->
            <ul class="friend-list" id="table">
                               
            </ul>
		</div>
        
        <!--=========================================================-->
        <!-- selected chat -->
    	<div class="col-md-8 bg-white " >
            <div class="chat-message" id="chatDiv">   
                <ul class="chat" id="chatMessage" >
                           
                </ul>
            </div>
            <div class="chat-box bg-white">
            	<div class="input-group">
            		<input class="form-control border no-shadow no-rounded" placeholder="내용을 입력해주세요" id="message">
            		<span class="input-group-btn">
            			<button class="btn btn-success no-rounded" type="button" id="send">보내기</button>
            		</span>
            	</div><!-- /input-group -->	
            </div>            
		</div>        
	</div>
</div>

<input type="hidden" id="chatRoom" name ="chatRoom" >
<input type="hidden" id="sendId" name ="sendId" >
<input type="hidden" id="receId" name="receId">
<input type="hidden" id="fristreceId" name="fristreceId">
<script type="text/javascript">
$(function(){
	//alert("dd" + $('#chatDiv'))
	//alert($('#chatDiv')[0].scrollHeight)
	//$('#chatDiv').scrollTop( $('#chatDiv')[0].scrollHeight);
	//document.getElementById("chatDiv").scrollTop( $('#chatDiv')[0].scrollHeight);
	
	$("#chatDiv").scrollTop($('#chatDiv')[0].scrollHeight);
	
	
	$("#message").on('keyup', function(e){
        if(e.key==='Enter'||e.keyCode===13){
            $("#send").trigger('click');
        }
    })
	
	
})
</script>
</body>
</html>