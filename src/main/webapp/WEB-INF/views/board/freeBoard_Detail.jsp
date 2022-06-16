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
   .comment-text-body{
    word-wrap: break-word;
   }
</style>
<script type="text/javascript">

$(function(){
    const target ='${freeBoard.freeId}'
    const loginUser='${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.userId}' //세션으로 확인한 현재 로그인한 유저

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
					str+=`<div class="comment-when-empty-reply">`
                		str+=`<span class="when-empty-reply">댓글이 없습니다</span>`;
                	str+=`</div>`;
				str+=`</div>`;
			} else {
				$.each(result,function(index,reply){
                    str+= `<div class="single-comment-body">`
				    	str+= `<div class="comment-user-avater">`	                
	                		str+=`<img src="/img/face2.png" alt="face">`
						str+=`</div>`;
	               		 str+=`<div class="comment-text-body">`
	                		str+=`<h4 class='comment-user'>\${reply.userId}님</h4>`	
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

   
    $(document).on("click","#update",function() {
        var boardUserID = $(this).attr("name")
        if(loginUser!=boardUserID){
            alert("자신이 작성한 게시물만 수정 가능합니다.")
        }else{
            $("#requestForm").attr("action", "${pageContext.request.contextPath}/board/freeBoard_updateForm");
            $("#requestForm").submit();
        }
    })
    
    $(document).on("click","#delete", function(){
        var boardUserID = $(this).attr("name")
        if(loginUser!=boardUserID){
            alert("자신이 작성한 게시물만 삭제 가능합니다.")
        }else{
            $("#requestForm").attr("action", "${pageContext.request.contextPath}/board/freeBoard_delete");
            $("#requestForm").submit(); 
        }
        
    });
	 
    

  selectAllReply();

})

	

</script>
<style>

.board-area{
    width: 1000px
}
.board-body-area{
    padding: 30px;
}
    .board-title-area{
        margin-top: 30px;
        border-top: solid 2px rgb(189, 189, 189);
    border-bottom: 2px solid rgb(189, 189, 189);
    padding: 30px;
    }
    .boardTitle{
        font-size: xx-large;
        font-weight: bold;
        margin: 0;
    }
    .boardInfo{
        display: flex;
        justify-content: space-between;      
    }
    .recommend-trip{
      background-color: rgb(255, 195, 42);
      font-size: small;
      color: #ffffff;
      font-weight: 500;
      text-transform: uppercase;
      letter-spacing: 1px;
      display: inline-block;
      padding: 3px 20px;
      margin-left: 5px;
   }
   .recommend-place{
      background-color: skyblue;
      font-size: small;
      color: #ffffff;
      font-weight: 500;
      text-transform: uppercase;
      letter-spacing: 1px;
      display: inline-block;
      padding: 3px 20px;
      margin-left: 5px;
   }
   .Image-area{
    box-sizing: border-box;
    width: 100%;
    height: 400px;
   }
    
    .boardImg{
        box-sizing: border-box;
        height: 400px;
        object-fit: contain;
        background-color: rgb(241, 241, 241);
    }
    .comment-when-empty-reply{
        text-align: center;
    }
    .when-empty-reply{
        font-size: medium;
        font-weight: bold;
        font-family: 'Noto Sans KR', sans-serif;
        color: rgb(70, 70, 70);
    }

</style>
</head>
<body>
	<div class="container-fluid pt-5 board-area">
		<div class="board-title-area" style="position: relative; top: -30px">
      		<div class="boardTitle"><span>${freeBoard.freeTitle}</span></div>
            <div class="boardInfo">
                <c:choose>
                    <c:when test="${freeBoard.freeCategory eq '여행추천'}">
                        <span class="recommend-trip">${freeBoard.freeCategory}</span>
                    </c:when>
                    <c:when test="${freeBoard.freeCategory eq '장소추천'}">
                        <span class="recommend-place" >${freeBoard.freeCategory}</span>
                    </c:when>
                </c:choose>
                <span><i class="menu-icon fa-solid fa-user-large"></i> 작성자: ${freeBoard.userId.substring(0,3)}****</span> 
            </div>
    	</div>  
        <div class="board-body-area" align="center">
           
                <div class="contact-form" style="text-align: left;">           
                    <!--본문내용-->
                    <div class="card-body">
                        <c:choose>
                            <c:when test="${empty freeBoard.freeAttach}">
                                <p>${freeBoard.freeContent}</p>
                            </c:when>
                            <c:otherwise>
                                <div class="Image-area">
                                    <img alt = "첨부된 이미지" src="/images/freeBoard/${freeBoard.freeAttach}" class="boardImg">
                                </div>
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
                            <button type="button" class="btn btn-outline-dark shadow-none" name="${freeBoard.userId}" id="update">수정</button>
                            <button type="button" class="btn btn-outline-dark shadow-none" name="${freeBoard.userId}" id="delete">삭제</button>
                        </form>  
                    </div>
                    <!--댓글 등록하기-->
                    <div class="card">
                        <div class="card-body">
                            <div class="form-inline mb-2">
                                <c:choose>
                                    <c:when test="${ empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.userId}">
                                        <span><strong>로그인 후 이용해주십시오</strong></span>
                                    </c:when>
                                    <c:otherwise>
                                        <span><strong>${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.userId}님</strong></span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="replyContent"></textarea>
                            <button type="button" class="btn btn-dark mt-3" id="reply-insert-btn">댓글 등록하기</button>
                        </div>
                    </div> 	
                </div>
                <!--댓글 조회하기 -->
                <!-- single article section -->
                <div class="container" style="text-align: left;">
                        <div class="single-article-section">
                            <div class="comments-list-wrap">
                                <h3 class="comment-count-title">Comments : <span class="reply-num-count"></span>개</h3>
                                <div class="comment-list"></div>
                            </div>
                        </div>
                </div>
                <!-- end single article section -->

           
        </div>
    </div>


    

</body>
</html>