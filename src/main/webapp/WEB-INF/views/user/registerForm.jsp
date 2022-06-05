<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
	<link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
	<!-- bootstrap -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../assets/js/config.js"></script>

<script type="text/javascript">
$(function(){
	$("#emailCheck").click(function(){
		emailSend($("#userEmail").val());
	});
	$("#codeCheck").click(function(){
		codeCheck($("#code").val());
	});
	
	//이메일 보내는 함수
	function emailSend(email){ //전,	
		$.ajax({
				url:"${pageContext.request.contextPath}/user/mail", //서버요청주소
				type:"post", // 요청방식(get, post)
				dataType:"text",//서버가 응답해주는 데이터타입(text,html,xml,json)
				data: {email : email},//서버에게 보낼 parameter정보
				success: function(result){
					$("#EmailCheckModal").modal("show");	
				},
				error: function(err){
					alert("이메일주소가 정확하지 않습니다.");
				}	
		});//ajax
	};
	
	//번호 인증하는 함수
	function codeCheck(code){ //전,	
		$.ajax({
				url:"${pageContext.request.contextPath}/user/verifyCode", //서버요청주소
				type:"post", // 요청방식(get, post)
				dataType:"text",//서버가 응답해주는 데이터타입(text,html,xml,json)
				data: {code : code},//서버에게 보낼 parameter정보
				success: function(result){
					
					if(result == 1 ){
						$("#emailCheck").html("인증완료");
						$("#emailCheck").attr("disabled","disabled");
					}
				},
				error: function(err){
					alert("인증을 실패했습니다. 다시 시도해주세요");
				}	
		});//ajax
	};
	
	
	
	
	
	
})
</script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<div class="container">
			<div class="row justify-content-md-center">
                <div class="col-md ">
                  <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                      <h5 class="mb-0">회원가입</h5>
                    </div>
                    <div class="card-body">
                      <form method="post" action="${pageContext.request.contextPath}/user/register">
                        <div class="mb-3">
                          <label class="form-label" >아이디</label>
                          <input type="text" class="form-control" id="userId" name="userId" /><button type="button" id="doubleCheck" value="">중복확인</button>
                        </div>
                        <div class="mb-3">
                          <label class="form-label" for="userName">이름</label>
                          <input type="text" class="form-control" id="userName" name="userName"  />
                        </div>
                        <div class="mb-3">
                          <label class="form-label" for="userPassword">비밀번호</label>
                          <div class="input-group input-group-merge">
                            <input type="password" id="userPassword" class="form-control" name ="userPassword"/>
                          </div>
                          <label class="form-label" for="basic-default-email">비밀번호확인</label>
                          <div class="input-group input-group-merge">
                            <input type="password" id="userPassword2" class="form-control" name ="userPassword2"/>
                          </div>
                          <div class="form-text">중복확인하는 칸</div>
                        </div>
                        <div class="mb-3">
							<label class="form-label" >생년월일</label>
							<input type="text" id="year" class="form-control" name ="year" placeholder="년(4자)"/>					
						<select class="form-select" size="1" id="month" class="form-control" name ="month">
							<option selected>월</option>
						<c:forEach begin="1" end="12" var="no">
							<option value="${no}">${no}</option>
						</c:forEach>
						</select>
						
						<select class="form-select" size="1" id="day" class="form-control" name ="day">
							<option selected>일</option>
						<c:forEach begin="1" end="30" var="no">
							<option value="${no}">${no}</option>
						</c:forEach>
						</select>
                        </div>
                        <div class="mb-3">
                          <label class="form-label" for="basic-default-message">성별</label>
							<select class="form-select" size="1" id="userGender" class="form-control" name ="userGender">
								<option value="M">남자</option>
								<option value="F">여자</option>
							</select>
                        </div>
                        
                        <div class="mb-3">
                     
						<label class="form-label" for="basic-default-message">휴대폰 번호</label>
							<input type="text" id="userPhone" class="form-control" name ="userPhone"/>
                        </div>
                        <div class="mb-3">
                     
                        <label class="form-label" for="basic-default-message">이메일주소</label><button type="button" id="emailCheck" class="btn btn-primary"  >이메일인증</button>
							<input type="text" id="userEmail" class="form-control" name ="userEmail"/>
                        </div>
                        
                        <button type="submit" class="btn btn-primary">Send</button>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        <input type="hidden" name="role" value="ROLE_USER">
                      </form>
                    </div>
                  </div>
                </div>
              </div>
              </div>



<!-- 모달 -->           
<div class="modal fade" id="EmailCheckModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      	
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">인증확인</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
				<div class="col-xxl">
                 <div class="card mb-4">
                   <div class="card-header d-flex align-items-center justify-content-between">
                     <h5 class="mb-0">인증번호 확인</h5>
                   </div>
                   <div class="card-body">
                     
                      <div class="row mb-3">
                         <label class="col-sm-4 col-form-label" for="basic-default-name">코드 입력</label>
                        <div class="col-sm-10">
                        	<input type="text" id="code" class="form-control placeCategory-mask" name="code"/>
                        </div>
                      </div>
                   </div>
                 </div>
               </div>
      </div>
      <div class="modal-footer">
        <button id="codeCheck" type="button" class="btn btn-primary">확인</button>
        <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
      
    </div>
  </div>
</div>
</body>
</html>