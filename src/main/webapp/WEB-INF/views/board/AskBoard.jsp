<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 등록하기</title>

<script type="text/javascript">


$(function() {
		

	$(document).ready(function(){
	
		$("#AskBoard").on("submit" , function(){
			
			if( $("#askCategory").val() == "none"){
				alert("카테고리를 선택해주세요");
				return false;
			}
			
			if( $("#askTitle").val() == ""){
				alert("제목을 입력해주세요");
				return false;
			}
			
			if( $("#askContent").val() == ""){
				alert("내용을 입력해주세요");
				return false;
			}
		       
		})
			
	})

	
}); //function


</script>


</head>
<body>

    <!-- Contact Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4" style="position: relative; bottom: 20px">
            <h2 class="section-title px-5"><span class="px-2">1:1 문의 작성하기</span></h2> 
        </div>
       
       <div contenteditable="true" style="margin-left: 310px; margin-right: 310px; font-size:17px; position: relative; bottom: 30px">     
       <i class="fas fa-bell fa-3x" style="position: relative; top:25px"></i> 공지사항을 참고하시면 자주 올라오는 질문과 답변을 확인하실 수 있습니다.<p>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주말 및 공휴일(임시 공휴일,법정 공휴일 포함)은 영업 휴무일 인 관계로, 다음 날 신속하게 답변 드리도록 하겠습니다.
       </div><p></p> 
        
        <div align="center">
            <div class="col-lg-7 mb-5">
                <div class="contact-form">
                    <div id="success"></div>
                    
                    <form name="AskBoard" id="AskBoard" method="post" action="${pageContext.request.contextPath}/board/Askinsert" enctype="multipart/form-data">
                        
                       <div class="control-group" style="text-align: left;">              
                         상담유형 <select name="askCategory" id="askCategory" class="form-select" 
                         aria-label="Default select example">
                            <option value="none" selected>Category</option>
                            <option value="회원문의">회원문의</option>
                            <option value="상품문의">상품문의</option>
                            <option value="구매문의">구매문의</option>
                            <option value="플래너문의">플래너문의</option>
                            <option value="사이트이용방법">사이트이용방법</option>
                         </select>
                            <p class="help-block text-danger"></p>
                        </div>
                       
                       
                    <div class="control-group" style="text-align: left;">
                    제목 <input type="text" class="form-control" id="askTitle" name="askTitle" placeholder="제목을 입력해주세요"/>
                         <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group" style="text-align: left;">
                    내용 <textarea class="form-control" rows="6" id="askContent" name="askContent" placeholder="내용을 입력해주세요"
                         style="resize: none;"></textarea>
                         <p class="help-block text-danger"></p>
                    </div>
	                <div class="control-group" style="text-align: left;">
                    첨부파일 <input type="file" class="form-control" id="askAttach" name="file" placeholder="Attach"
                             accept=".png, .jpg" />
                             <p class="help-block text-danger"></p>
	                </div> 

                        <div align="right">
                            <button type="submit" class="btn btn-primary py-1 px-2" id="AskBoard">문의 등록하기</button>
                        </div>
                    
                    </form>
                
                </div>
            </div>
 
        </div>
    </div>
    <!-- Contact End -->

    
    
</body>
</html>