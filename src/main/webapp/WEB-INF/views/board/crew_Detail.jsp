<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">

$(function(){
    var target ='${crewboard.crewId}'
    var loginUser='${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.userId}' //세션으로 확인한 현재 로그인한 유저
    //var loginUser='${sessionScope.loginUser.userId}' //세션으로 확인한 현재 로그인한 유저
    //var loginManager='${sessionScope.loginManager.managerId}'
    //var loginUser='aaa'
    //alert("로그인 유저 아이디:"+loginUser)
     console.log(target)
    //전체 댓글 검색
	function selectAllReply(){
        $.ajax({
		url: "${pageContext.request.contextPath}/reply/crew_Detail" , //서버요청주소
		type: "post" , //요청방식 (get,post...)
		dataType: "json" , //서버가 보내온 데이터(응답)type(text | html | xml | json)
		data: {crewId: target} , //서버에게 보낼 데이터정보(parameter정보)
		
		success: function(result){
			console.log("검색성공~")
			let str="";
			count = 0;
			if(result=="") {

				str+= `<div class="single-comment-body">`
				   str+=`<div class="comment-text-body">`
                     str+=`<span class="reply-content-text">댓글이 없습니다</span>`;
                   str+=`</div>`;
                str+=`</div>`;
			} else {
				$.each(result,function(index,reply){
					str+= `<div class="single-comment-body">`
				    	str+= `<div class="comment-user-avater">`	                
	                		str+=`<img src="/img/face2.png" alt="face">`
						str+=`</div>`;
	               		 str+=`<div class="comment-text-body">`
	                		str+=`<h6 class='comment-user'>\${reply.userId}님</h6>`	
                    		str+=`<p><span class='comment-content'>\${reply.crewReplyContent}</span><span class="badge rounded-pill text-dark"><a href="javascript:void(0);" id="reply-delete-bnt" name=${'${reply.userId}'} crewReplyId="${'${reply.crewReplyId}'}">삭제</a></span></p>`
                    		str+=``
                   		str+=`</div>`;
					str+=`</div>`;
          
    				count++;
				})
            }
			$(".comment-list").html("");
           	$(".comment-list").append(str);
           	$(".reply-num-count").text(count);
		},

		error: function(err){//실패했을 때 콜백함수
		  alert(err+"오류가 발생했습니다.")
		} 

	    })
    }
    
    $("#reply-insert-btn").click(function(){
        let status =true;
        let replyContent = $('textarea[name=replyContent]').val()
        //댓글 유효성체크
        if(!loginUser){
            alert("댓글 기능은 회원만 가능합니다.")
            status=false;
            return;
        }

        if($("#exampleFormControlTextarea1").val()==""){
            alert("댓글을 입력해 주십시오.")
            $(this).focus();
            status=false;
            return;
        }
        //댓글 달기
        if(status){
            $.ajax({
                url: "${pageContext.request.contextPath}/reply/cinsert" , //서버요청주소
                type: "post" , //요청방식 (get,post...)
                datatype: "text",
                data: {replyContent : replyContent , crewId : target} , //서버에게 보낼 데이터정보(parameter정보)
                
                success: function(){
                    
        
                        //textarea부분 지우고 
                        $("textarea.form-control").val("")
                        //화면갱신한다
                        selectAllReply();
                    
                },

                error: function(err){//실패했을 때 콜백함수
                alert("오류가 발생했습니다.")
                } 

	        })
        }
    })
    
    $(document).on("click","#reply-delete-bnt",function(){
        
        var replyId = $(this).attr("name")
        //alert("댓글유저아이디~~"+replyId)
        var crewReplyId =$(this).attr("crewReplyId")
        //alert(replyNo)

        //세션에서 로그인한 유저와 댓글 작성자 id가 일치하는지 확인
        if(loginUser==replyId||loginManager==replyId){
            $.ajax({
                url: "${pageContext.request.contextPath}/reply/cdelete" , //서버요청주소
                type: "post" , //요청방식 (get,post...)
              
                data: {crewReplyId: crewReplyId } , //서버에게 보낼 데이터정보(parameter정보)
                
                success: function(){
                 
                        selectAllReply(); //화면갱신
                    
                
                },

                error: function(){//실패했을 때 콜백함수
                alert("오류가 발생했습니다.")
                } 

	        })
        }else{
            alert("댓글은 자신이 단 댓글만 삭제 가능합니다.")
        }
    })
    

  selectAllReply();

})



 
        $(function() {
	
        $("button[value=수정]").click(function() {
        	$("#requestForm").attr("action", "${pageContext.request.contextPath}/board/crew_updateForm");
			$("#requestForm").submit();
		})
		
        $(document).on("click","#delete", function(){
	             
    		   	$("#requestForm").attr("action", "${pageContext.request.contextPath}/board/crew_delete/"+$(this).val());
    			$("#requestForm").submit();   	
	            });
		
		$("input[name=btnradio]").click(function(){
			$("#requestForm").attr("action", "${pageContext.request.contextPath}/board/crew_Detail/changeState");
			$("#requestForm").submit();
			
		})
			
})
        
</script>
</head>
<body>
<div class="row" align="center" style="margin-left: 280px; margin-right: 250px; margin-top: 50px">
  <div class="col-xl">
    <div class="card mb-4" align="center">
      <div class="card-header d-flex justify-content-between align-items-center">    
        <h5 class="mb-0">동행구하기게시판 상세</h5> 
      </div>
      <br>
      <br>
     <form name="requestForm" method="post" id="requestForm">
      <div class="btn-group" role="group" aria-label="Basic radio toggle button group"  style="width: 400px; margin-left: 50px" >
       	  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" value="N" data-bs-toggle="modal" data-bs-target="#exampleModal1" checked>
		  <label class="btn btn-outline-primary" for="btnradio1" >동행구하는 중</label>
		    
		  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" value="Y"data-bs-toggle="modal" data-bs-target="#exampleModal2">
		  <label class="btn btn-outline-primary" for="btnradio2">동행구하기 완료</label>
	  </div>	
      <div class="card-body">
          <div class="mb-3" style="text-align: left;">
            <label class="form-label" for="basic-default-fullname">제목</label>
            <input type="text" class="form-control" id="basic-default-fullname" name="crewTitle" value="${crewboard.crewTitle}"/>
          </div>
          <div class="mb-3" style="text-align: left;">
            <label class="form-label" for="basic-default-message">내용</label>
            <textarea id="basic-default-message" class="form-control" name="crewContent" style="resize: none">${crewboard.crewContent}</textarea>
          </div>           
		     <input type="hidden" name="crewId" value="${crewboard.crewId}">
		    
		    <div align="right"> 
	         <button type="button" class="btn btn-primary" value="수정">수정하기</button>
	         <button type="button" class="btn btn-primary" value="${crewboard.crewId}" id="delete">삭제하기</button>
	         <button type="button" class="btn btn-primary" onclick="history.back()">목록보기</button>
	        </div> 
       
       </div>
       </form>
    </div>
  </div>
</div>



<!--댓글 등록하기-->
<div class="card" style="margin-left: 290px; margin-right: 260px;">
    <div class="card-body" >
    	<form name="reply-loginUser-insert" method="post" id="reply-loginUser-insert">
            <div class="form-inline mb-2" style="font-size:1.5rem">
            <i class="bi bi-file-person" style="font-size:1.8rem"></i> 
                <span><strong>${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.userId}님</strong></span>
                <input type="hidden" name="reply_id" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.userId}"><!-- 나중에 세션으로 아이디 받기 -->
            </div>
            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="replyContent" style="resize: none" placeholder="댓글을 입력해주세요"></textarea>
            <input type="hidden" name="crewBoardId" value="${crewboard.crewId}">
            <button type="button" class="btn btn-dark mt-3" id="reply-insert-btn" style="float: right;">댓글 등록하기</button>
    	</form>
    </div>
</div>




<!-- single article section -->
				<div class="container" style="text-align: left; margin-left:280px">

						<div class="col-lg-8">
							<div class="single-article-section">
								
								<div class="comments-list-wrap">
									<h3 class="comment-count-title">Comments : <span class="reply-num-count"></span>개</h3>
									<div class="comment-list"></div>
								</div>
							</div>
						</div>

				</div>
				<!-- end single article section -->


<%-- <form method="get" action="${pageContext.request.contextPath}/chat/chat_Room">
<input type="hidden" name="no" value='${crewboard.crewId}'>
<input type="hidden" name="receId" value='${receId}'>
<input type="submit" value="쪽지 보내기">
</form> --%>




<!-- Modal -->
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">동행구하는 중으로 변경되었습니다.</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
    </div>
  </div>
</div>

<!-- Modal2 -->
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">동행구하기 완료로 변경되었습니다.</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
    </div>
  </div>
</div>
</body>
</html>