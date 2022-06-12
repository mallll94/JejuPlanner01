<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<%-- 	<link rel="preconnect" href="https://fonts.googleapis.com" />
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
 --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/vendors/linericon/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/vendors/nouislider/nouislider.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/css/header.css">

    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
	<!-- bootstrap -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../assets/js/config.js"></script>

<script type="text/javascript">
$(function(){
	var checkResultId="";
	
	$("#userEmail").keyup(function(){
		
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/user/emailCheckAjax",
			dataType:"text",
			data:{'${_csrf.parameterName}' : '${_csrf.token}' ,email : $(this).val()},	
			success:function(data){	
				console.log($("#userEmail").val() )
				if($("#userEmail").val()==" "){
					$("#emailCheck").html("fdfd");
				}
				if(data ==0){
					$("#emailCheck").html("사용가능").css("color","blue");
				}else if(data ==1){
					$("#emailCheck").html("중복").css("color","red");
				}
				
				
			}//callback
		});//ajax
		
		
		
		
		
	});
	$("#codeCheck").click(function(){
		codeCheck($("#code").val());
	});
	
	$("#regForm").submit(function(){			
		if($("#regForm :input[name=userId]").val().trim()==""){
			alert("아이디를 입력하세요");	
			$("#regForm :input[name=userId]").focus();
			return false;
		}
		if($("#regForm :input[name=userPassword]").val().trim()==""){
			alert("패스워드를 입력하세요");
			$("#regForm :input[name=userPassword]").focus();
			return false;
		}
		if($("#regForm :input[name=userPassword]").val().trim()!=$("#regForm :input[name=userPassword2]").val().trim()){
			alert("비밀번호가 다릅니다");	
			$("#regForm :input[name=userPassword]").focus();
			return false;
		}
		if($("#regForm :input[name=userName]").val().trim()==""){
			alert("이름을 입력하세요");		
			$("#regForm :input[name=userName]").focus();
			return false;
		}
		if($("#regForm :input[name=userPhone]").val().trim()==""){
			alert("휴대폰 번호를 입력하세요");
			$("#regForm :input[name=userPhone]").focus();
			return false;
		}	
		if($("#iddou").val()==0){
			alert(checkResultId);
			
			alert("아이디 중복확인을 하세요");
			return false;
		}		
	});
	
	
	$("#doubleCheck").click(function(){
		
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/user/idcheckAjax",
			dataType:"text",
			data:"${_csrf.parameterName}=${_csrf.token}&id="+$("#userId").val(),	
			 /*data:{
				"${_csrf.parameterName}":"${_csrf.token}"
			} ,*/
			success:function(data){						
				if(data=="fail"){
					$("#idCheckView").html("중복").css("color","red");
					$("#iddou").val(0);
				}else{						
					$("#idCheckView").html("사용가능").css("color","blue");
					$("#iddou").val(1)
				}
			}//callback			
		});//ajax
	});//keyup
	

	
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
<%-- 			<div class="container">
			<div class="row justify-content-md-center">
                <div class="col-md ">
                  <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                      <h5 class="mb-0">회원가입</h5>
                    </div>
                    <div class="card-body">
                      <form id="regForm" method="post" action="${pageContext.request.contextPath}/user/register">
                        <div class="mb-3">
                          <label class="form-label" >아이디</label><span id="idCheckView"></span>
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
                      	<input type="hidden" id="doubleCheckResult"/>
                    </div>
                  </div>
                </div>
              </div>
              </div>

 --%>
<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				
			<div class="col-lg">
				<div class="login_form_inner">
					<h3>회원가입</h3>
					<form class="row login_form" id="regForm" method="post" action="${pageContext.request.contextPath}/user/register" >
						<div class="col-md-12 form-group">
							<label class="form-label" >아이디</label><span id="idCheckView"></span>
							<input type="text" class="form-control" id="userId" name="userId" />
						</div>
						<div class="col-md-12 form-group">
							<button type="button" class="button button-login w-100" id="doubleCheck" value="">중복확인</button>
						</div>
						
						<div class="col-md-12 form-group">
							<label class="form-label" >이름</label>
							<input type="text" class="form-control" id="userName" name="userName"  />
						</div>
						<div class="col-md-12 form-group">
							<label class="form-label" >비밀번호</label>
							<input type="password" id="userPassword" class="form-control" name ="userPassword"/>
						</div>
						<div class="col-md-12 form-group">
							<label class="form-label" >비밀번호확인</label>
							<input type="password" id="userPassword2" class="form-control" name ="userPassword2"/>
						</div>
						<div class="col-md-12 form-group">
							<label class="form-label" for="basic-default-message">성별</label>
							<select class="form-select" size="1" id="userGender" class="form-control" name ="userGender">
								<option value="M">남자</option>
								<option value="F">여자</option>
							</select>
						</div>
						<div class="col-md-12 form-group">
							<label class="form-label" >휴대폰 번호</label>
							<input type="text" id="userPhone" class="form-control" name ="userPhone"/>
						</div>
						<div class="col-md-12 form-group">
							<label class="form-label" >이메일주소</label><span id="emailCheck"></span>
							<input type="text" id="userEmail" class="form-control" name ="userEmail"/>
						</div>
						<div class="col-md-12 form-group">
							<button type="submit"  class="button button-login w-100">가입하기</button>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<input type="hidden" name="role" value="ROLE_USER">
					</form>
						<input type="hidden" id="doubleCheckResult"/>
					<div style="padding-bottom: 150px;">문제가 있거나 도움이 필요하실 경우 1:1 문의로 연락 주시면 신속하게 해결해드리겠습니다.</div>
				</div>
			</div>
		</div>
	</div>
</section>
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
      	<input type="hidden" id="iddou" value="0"/>
        <button id="codeCheck" type="button" class="btn btn-primary">확인</button>
        <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
      
    </div>
  </div>
</div>
</body>
</html>