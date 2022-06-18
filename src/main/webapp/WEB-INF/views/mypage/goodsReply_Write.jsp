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
	.star-input {
		margin-bottom: 100px;
		margin-left: 370px;
	}
	.star-input>.input,
	.star-input>.input>label:hover,
	.star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('${pageContext.request.contextPath}/img/grade_img.png')no-repeat;}
	.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
	.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
	.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
	star-input>.input.focus{outline:1px dotted #ddd;}
	.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
	.star-input>.input>label:hover,
	.star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
	.star-input>.input>label:hover~label{background-image: none;}
	.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
	.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
	.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
	.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
	.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
	.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
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
                                <span class="star-input" name="goodsReplyStart" id="goodsReplyStart">
									<span class="input">
								    	<input type="radio" name="goodsReplyStart" value="1" id="p1">
								    	<label for="p1">1</label>
								    	<input type="radio" name="goodsReplyStart" value="2" id="p2">
								    	<label for="p2">2</label>
								    	<input type="radio" name="goodsReplyStart" value="3" id="p3">
								    	<label for="p3">3</label>
								    	<input type="radio" name="goodsReplyStart" value="4" id="p4">
								    	<label for="p4">4</label>
								    	<input type="radio" name="goodsReplyStart" value="5" id="p5">
								    	<label for="p5">5</label>
								  	</span>
								  	<output class="goodsReplyStart" id="goodsReplyStart" name="goodsReplyStart"><b>0</b>점 (필수선택)</output>						
								</span>
                            </div>         
                            <div class="control-group" style="text-align: left;">
                                <h3><p>구체적으로 어떤 경험이었나요?</p></h3>
                                <textarea class="form-control" rows="6" id="goodsReplyContent" name="goodsReplyContent" placeholder="이용하기 전에 알기 어려운 사실이나 꿀팁을 알려주세요."></textarea>
                            </div>
                            <!-- <div class="row">
                                <div class="col-4">
                                    <p>상품사진</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="goodsPhoto" name="goodsPhoto" value="">
                                    <input id="goodsPhoto"  class="spiner-text" name="file" type="file" accept=".jpg, .jpeg, .png">
                                </div>
                            </div> -->
                            <div class="control-group" style="text-align: left;">
                                <h3><p>사진을 공유해주세요.(선택)</p></h3>
                                <input type="file" class="form-control" id="file" name="file" placeholder="Attach" accept=".png, .jpg, .jpeg" />
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

    <script src="${pageContext.request.contextPath}/js/goods/jquery-1.11.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/goods/star.js"></script>
    
</body>
</html>