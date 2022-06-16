<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품후기 작성하기</title>

<style>
	.form-select {
		margin-bottom: 30px;
	}
	.form-control {
		margin-bottom: 30px;
	}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function() {
	

	$(document).ready(function(){
	
		$("#goodsReply").on("submit" , function(){
			
			if( $("#goodsReplyStart").val() == "none"){
				alert("별점을 입력해주세요.");
				return false;
			}
			
			if( $("#goodsRplyContent").val() == ""){
				alert("내용을 입력해주세요");
				return false;
			}
		       
		})
			
	})

});

</script>
</head>
<body>

    <!-- Contact Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">${goods.goodsName} 어떠셨나요?</span></h2> 
        </div>
       <div align="center"> 
            <div class="col-lg-7 mb-5">
                <div class="contact-form">
                    <div id="success">
                        <form name="goodsReplyForm" id="goodsReply" method="post" action="${pageContext.request.contextPath}/review/mypage/goodsReply_Insert"  enctype="multipart/form-data">
                            <input type="hidden" value="${goods.goodsId}" id="goodsId" name="goodsId">
                            <div class="control-group" style="text-align: left;">
                                <p>별점</p>
                                <select name="goodsReplyStart" id="goodsReplyStart" class="form-select" aria-label="Default select example">
                                    <option value="none" selected>별점을 선택하세요</option>
                                    <option value="5">5</option>
                                    <option value="5">4</option>   
                                    <option value="5">3</option>
                                    <option value="5">2</option>
                                    <option value="5">1</option>                                              
                                </select>
                            </div>         
                            <div class="control-group" style="text-align: left;">
                                <h3><p>구체적으로 어떤 경험이었나요?</p></h3>
                                <textarea class="form-control" rows="6" id="goodsReplyContent" name="goodsReplyContent" placeholder="이용하기 전에 알기 어려운 사실이나 꿀팁을 알려주세요."></textarea>
                            </div>
                            <div class="control-group" style="text-align: left;">
                                <h3><p>사진을 공유해주세요.(선택)</p></h3>
                                <input type="file" class="form-control" id="goodsReplyAttach" name="file" placeholder="Attach" accept=".png, .jpg" />
                            </div> 
                            <div align="right">
                              <br><button type="submit" class="btn btn-outline-dark shadow-none" id="goodsReply-bnt">등록하기</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
       </div> 
    </div>
    <!-- Contact End -->

    
    
</body>
</html>