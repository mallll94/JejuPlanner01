<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript">

$(function(){
    var target ='${planBoard.pboardId}'
    //var loginUser='${sessionScope.loginUser.userId}' //세션으로 확인한 현재 로그인한 유저
    //var loginManager='${sessionScope.loginManager.managerId}'
    var loginUser='aaa'
    //alert("로그인 유저 아이디:"+loginUser)
     alert(target)
    //전체 댓글 검색
	function selectAllReply(){
        $.ajax({
		url: "${pageContext.request.contextPath}/reply/Planboard_Detail" , //서버요청주소
		type: "post" , //요청방식 (get,post...)
		dataType: "json" , //서버가 보내온 데이터(응답)type(text | html | xml | json)
		data: {pboardId: target} , //서버에게 보낼 데이터정보(parameter정보)
		
		success: function(result){
			alert("검색성공~")
			let str="";
			count = 0;
			if(result=="") {

				str += "<div class='reply-each'>"
                str+=`<span class="reply-content-text">댓글이 없습니다</span>`;
                str+=`</div>`;
			} else {
				$.each(result,function(index,reply){
					str += "<div class='reply-each'>"
                    str+=`<div class="reply-user-info">`;
                    str+=`<span class="badge rounded-pill text-dark">\${reply.userId}</span>&nbsp;`

                    str+=`</div>`;
                    str+=`<div class="reply-content">`;
                        str+=`<span class="reply-content-text">\${reply.pboardReplyContent}</span>`
                        
                        str+=`<span class="badge rounded-pill text-dark"><a href="javascript:void(0);" id="reply-delete-bnt" name=${'${reply.userId}'} pboardReplyId="${'${reply.pboardReplyId}'}">삭제</a></span>`
                    str+=`</div>`;
    				str += "</div>"
    				count++;
				})
            }
           	$("#review_reply_output").html(review_reply_output);
           	$("#review_reply_output").append(str);
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
        alert(replyContent)
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
                url: "${pageContext.request.contextPath}/reply/planinsert" , //서버요청주소
                type: "post" , //요청방식 (get,post...)
                datatype: "json",
                data: {replyContent : replyContent , pboardId : target} , //서버에게 보낼 데이터정보(parameter정보)
                
                success: function(result){
                    alert("댓글등록성공~")
        
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
        var pboardReplyId =$(this).attr("pboardReplyId")
        //alert(replyNo)

        //세션에서 로그인한 유저와 댓글 작성자 id가 일치하는지 확인
        if(loginUser==replyId||loginManager==replyId){
            $.ajax({
                url: "${pageContext.request.contextPath}/reply/delete" , //서버요청주소
                type: "post" , //요청방식 (get,post...)
              
                data: {pboardReplyId: pboardReplyId } , //서버에게 보낼 데이터정보(parameter정보)
                
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


</script>




</head>





<body>

<!-- Comments section-->
<section>

<div> 

<div>


<!--댓글 등록하기-->
<div class="card">
    <div class="card-body">
    	<form name="reply-loginUser-insert" method="post" id="reply-loginUser-insert">
            <div class="form-inline mb-2">
                <label for="replyId"><img src="#" class="reply-user-icon"><img></label>
                <span><strong>{sessionScope.loginUser.userId}</strong></span>
                <span><strong>{sessionScope.loginManager.managerId}</strong></span>
                <input type="hidden" name="reply_id" value="{sessionScope.loginUser.userId}"><!-- 나중에 세션으로 아이디 받기 -->
                <input type="hidden" name="reply_manager_id" value="{sessionScope.loginManager.managerId}">
            </div>
            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="replyContent"></textarea>
            <input type="hidden" name="planBoardId" value="${planBoard.pboardId}">
            <button type="button" class="btn btn-dark mt-3" id="reply-insert-btn" >댓글 등록하기</button>
    	</form>
    </div>
</div>


<!--댓글 조회하기 -->
<div class="reply-num">
   댓글 수: <span class="reply-num-count"></span>개
</div>
<div class="review_reply_wrap">
    <div class="review_reply_area">
      <div id="review_reply_output"></div>
    </div>
</div>
    



</section>

</body>
</html>