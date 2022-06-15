<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- owl carousel -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reply/owl.carousel.css">
<!-- magnific popup -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reply/magnific-popup.css">
<!-- animate css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reply/animate.css">
<!-- mean menu css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reply/meanmenu.min.css">
<!-- main style -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reply/main.css">
<!-- responsive -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reply/responsive.css">


   


<style>
    .free-bottom-area{
        display: flex;
		justify-content: space-between;
		padding: 25px;
		margin-bottom: 20px;
    }
    .comments-list-wrap{margin: 0;}
	.comment-user{margin:0;}
	.comment-content{margin-right: 5px;}
</style>
<script type="text/javascript">

$(function(){
    var target ='${freeBoard.freeId}'
    var loginUser='${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.userId}' //세션으로 확인한 현재 로그인한 유저
    //var loginUser='${sessionScope.loginUser.userId}' //세션으로 확인한 현재 로그인한 유저
    //var loginManager='${sessionScope.loginManager.managerId}'
    //var loginUser='ddd'
    //alert("로그인 유저 아이디:"+loginUser)

 

    //전체 댓글 검색
	function selectAllReply(){
        $.ajax({
		url: "${pageContext.request.contextPath}/reply/freeBoard_Detail" , //서버요청주소
		type: "post" , //요청방식 (get,post...)
		dataType: "json" , //서버가 보내온 데이터(응답)type(text | html | xml | json)
		data: {freeId: target} , //서버에게 보낼 데이터정보(parameter정보)
		
		success: function(result){


		

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
                    		str+=`<p><span class='comment-content'>\${reply.freeReplyContent}</span><span class="badge rounded-pill text-dark"><a href="javascript:void(0);" id="reply-delete-bnt" name=${'${reply.userId}'} freeReplyId="${'${reply.freeReplyId}'}">삭제</a></span></p>`
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
                url: "${pageContext.request.contextPath}/reply/freeBoard_Insert" , //서버요청주소
                type: "post" , //요청방식 (get,post...)
                dataType: "text",
                data: {replyContent : replyContent , freeId : target} , //서버에게 보낼 데이터정보(parameter정보)
                
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
        var freeReplyId =$(this).attr("freeReplyId")
        //alert(replyNo)

        //세션에서 로그인한 유저와 댓글 작성자 id가 일치하는지 확인
        if(loginUser==replyId){
            $.ajax({
                url: "${pageContext.request.contextPath}/reply/freeBoard_Delete" , //서버요청주소
                type: "post" , //요청방식 (get,post...)
              
                data: {freeReplyId: freeReplyId } , //서버에게 보낼 데이터정보(parameter정보)
                
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

	$(function(){
		$("button[value=수정]").click(function() {
	    	$("#requestForm").attr("action", "${pageContext.request.contextPath}/board/freeBoard_updateForm");
			$("#requestForm").submit();
		})
		
		   $(document).on("click","#delete", function(){
	             
   		   	$("#requestForm").attr("action", "${pageContext.request.contextPath}/board/freeBoard_delete/"+$(this).val());
   			$("#requestForm").submit();   	
	            });
	 }) 

</script>
</head>
<body>
	<div class="container-fluid pt-5">
		<div class="text-center mb-4" style="position: relative; top: -30px">
      		<h2 class="section-title px-5"><span class="px-2">소통하기 게시판</span></h2> 
  	</div>  
</div>
          <div align="center">
			<div class="col-lg-7 mb-5">
                <div class="contact-form" style="text-align: left;">           
                    <div class="control-group">
                        <p>카테고리</p>
                        <input type="text" readonly class="form-control" id="freeCategory" name="freeCategory" value="${freeBoard.freeCategory}"/>
                    </div>
                    <div class="control-group">
                        <p>제목</p>
                        <input type="text" readonly class="form-control" id="freeTitle" name="freeTitle" value="${freeBoard.freeTitle}"/>
                    </div>
                    <div class="card-body">
                        <c:choose>
                            <c:when test="${empty freeBoard.freeAttach}">
                                <p>${freeBoard.freeContent}</p>
                            </c:when>
                            <c:otherwise>
                                <img alt = "첨부된 이미지" src="/images/freeBoard/${freeBoard.freeAttach}" width="300" height="300">
                                <p>${freeBoard.freeContent}</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="free-bottom-area">
                        <div>
                            <button type="button" class="btn btn-outline-dark shadow-none" onclick="history.back()">목록으로 돌아가기</button>  
                        </div>
                        <form name="requestForm" method="post" id="requestForm">
                            <input type="hidden" name="freeId" value="${freeBoard.freeId}">
                            <button type="button" class="btn btn-outline-dark shadow-none" value="수정">수정</button>
                            <button type="button" class="btn btn-outline-dark shadow-none" value="${freeBoard.freeId}" id="delete">삭제</button>
                        </form>  
                    </div>
                    <!--댓글 등록하기-->
                    <div class="card">
                        <div class="card-body">
                            <form name="reply-loginUser-insert" method="post" id="reply-loginUser-insert">
                                <div class="form-inline mb-2">
                                    <span><strong>${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.userId}님</strong></span>
                                    <input type="hidden" name="reply_id" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.userId}"><!-- 나중에 세션으로 아이디 받기 -->
                                </div>
                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="replyContent"></textarea>
                                <input type="hidden" name="freeId" value="${freeBoard.freeId}">
                                <button type="button" class="btn btn-dark mt-3" id="reply-insert-btn">댓글 등록하기</button>
                            </form>
                        </div>
                    </div> 	
                </div>
                <!--댓글 조회하기 -->
                <!-- single article section -->
				<div class="container" style="text-align: left;">
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

            </div>
        </div>
    </div>

</body>
</html>