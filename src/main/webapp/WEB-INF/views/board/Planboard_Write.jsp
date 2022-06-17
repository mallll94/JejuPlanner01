<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function() {
	

	$(document).ready(function(){
	
		$("#planBoard").on("submit" , function(){
			
			if( $("#pboardCategory").val() == "none"){
				alert("카테고리를 선택해주세요");
				return false;
			}
			
			if( $("#pboardTitle").val() == ""){
				alert("제목을 입력해주세요");
				return false;
			}
			
			if( $("#plannerId").val() == "none"){
				alert("플래너를 선택해주세요");
				return false;
			}
						
			if( $("#pboardContent").val() == ""){
				alert("내용을 입력해주세요");
				return false;
			}
		       
		})
			
	})
	
	
	
	function selectAll(){
		
		$.ajax({
			url:"${pageContext.request.contextPath}/board/planSelect",
			type:"post", 
			dataType:"json",
			data: { '${_csrf.parameterName}' : '${_csrf.token}' },
			success :function(result){		
   					var data ="";
   				
   					
   					$.each(result, function(index, item){


   						data+=`<option value='${"${item.plannerId}"}'>${'${item.plannerName}'} /${'${item.plannerStart}'} </option>`;

					})
   					$("#plannerId").append(data);
   					
   					//alert(${planner.plannerId})
   					$("#plannerId").val(${planner.plannerId});
			},error : function(request, status, error){
				//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("실패")
			}
		});
		
	}
	selectAll();
	
}); //function




</script>


</head>
<body>

    <!-- Contact Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">플래너공유 게시판</span></h2> 
        </div>
        
        <div align="center">
            <div class="col-lg-7 mb-5">
                <div class="contact-form">
                    <div id="success"></div>
                    
                    <form name="planBoard" id="planBoard" method="post" action="${pageContext.request.contextPath}/board/pinsert"  enctype="multipart/form-data">
                        
                    <div class="control-group" style="text-align: left;">
                         카테고리 <select name="pboardCategory" id="pboardCategory" class="form-select" 
                         aria-label="Default select example">
                            <option value="none" selected>Category</option>
                            <option value="나홀로">🧘나홀로</option>
                            <option value="가족/부모님">🏠가족</option>
                            <option value="친구">🧑‍🤝‍🧑친구</option>
                            <option value="연인">❤️연인</option>  
                         </select>
                            <p class="help-block text-danger"></p>
                        </div>
                       
                    <div class="control-group" style="text-align: left;">
                    제목 <input type="text" class="form-control" id="pboardTitle" name="pboardTitle" placeholder="제목을 입력해주세요"/>
                         <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group" style="text-align: left;">
                         플래너 <select name="plannerId" id="plannerId" class="form-select" 
                         aria-label="Default select example">
                            <option value="none" selected>Planner</option>       
                         </select>
                            <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group" style="text-align: left;">
                    내용 <textarea class="form-control" rows="6" id="pboardContent" name="pboardContent" placeholder="내용을 입력해주세요"
                          style="resize: none"></textarea>
                         <p class="help-block text-danger"></p>
                    </div>
	                <div class="control-group" style="text-align: left;">
                    첨부파일 <input type="file" class="form-control" id="pboardAttach" name="file" placeholder="Attach"
                              accept=".png, .jpg" />
                             <p class="help-block text-danger"></p>
	                </div> 

                        <div align="right">
                            <button type="submit" class="btn btn-primary py-1 px-2" id="planBoard">등록하기</button>
                        </div>
                    
                    </form>
                
                </div>
            </div>
 
        </div>
    </div>
    <!-- Contact End -->

    
    
</body>
</html>