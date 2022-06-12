<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- CSS Files -->
  <link href="../assets/mypage2/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
  <style type="text/css">
   .container-fluid {padding-left: 300px; width:1600px;}
   .form-control {display: inline-block; width: 40%; text-align: center;}
   .form-control-label {width: 30%; text-align: center;}
   .modal-header{text-align: center; display: block;}
   
   .form-label{display: inline-block; width: 25%;}
   .modal-body{text-align: center;}
   .modal-footer{text-align: center; display: block;}
   .form-select{display: inline-block; width: 40%; text-align: center;}
   .btn-close{display: none;}
  </style>
</head>
<body>
<!-- Page content -->
    <div class="container-fluid mt--7">
      <div class="row">
        <div class="col-xl-4 order-xl-2 mb-5 mb-xl-0">
          <div class="card card-profile shadow">
            <div class="row justify-content-center">
              <div class="col-lg-3 order-lg-2">
                <div class="card-profile-image">
                  <a href="#">
                    <img src="../img/myPage_logo.png" class="rounded-circle">
                  </a>
                </div>
              </div>
            </div>
            <div class="card-body pt-0 pt-md-4">
              <div class="row">
                <div class="col">
                  <div class="card-profile-stats d-flex justify-content-center mt-md-5">

                    <div>
                      <span class="heading"></span>
                      <span class="description"></span>
                    </div>
                    <div>
                      <span class="heading"></span>
                      <span class="description"></span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="text-center">
                <h2>내정보</h2>
                  <div class="mb-3">
		            <label class="form-control-label" for="basic-default-fullname">회원아이디 : &nbsp;</label>
		            <input type="text" class="form-control form-control-alternative" id="basic-default-fullname" name="" value=""/>
		        </div>
		          <div class="mb-3">
		            <label class="form-control-label" for="basic-default-fullname">이름 : &nbsp;</label>
		            <input type="text" class="form-control form-control-alternative" id="basic-default-fullname" name="" value=""/>
		          </div>
                <div class="mb-3">
		            <label class="form-control-label" for="basic-default-fullname">성별 : &nbsp;</label>
		            <input type="text" class="form-control form-control-alternative" id="basic-default-fullname" name="" value=""/>
		          </div>
                <div class="mb-3">
		            <label class="form-control-label" for="basic-default-fullname">주소 : &nbsp;</label>
		            <input type="text" class="form-control form-control-alternative" id="basic-default-fullname" name="" value=""/>
		        </div>
		        <div class="mb-3">
		            <label class="form-control-label" for="basic-default-fullname">이메일주소 : &nbsp;</label>
		            <input type="text" class="form-control form-control-alternative" id="basic-default-fullname" name="" value=""/>
		        </div>
		       
		        <!-- (정보수정 / 회원탈퇴) -->
		        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modifyInfor">
				  정보수정
				</button>
		        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#dropInfor">
				  회원탈퇴
				</button>
              </div>
            </div>
          </div>
        </div>
       </div> 
      </div>
      
		<!-- Modal (정보수정) -->
		<div class="modal fade" id="modifyInfor" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h2 class="modal-title" id="exampleModalLabel">내정보 수정하기</h2>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		            <form>					
						<div class="col-md-12 form-group">
							<label class="form-label" ><h3>비밀번호</h3></label>
							<input type="password" id="userPassword" class="form-control" name ="userPassword"/>
						</div>
						<div class="col-md-12 form-group">
							<label class="form-label" ><h3>비밀번호확인</h3></label>
							<input type="password" id="userPassword2" class="form-control" name ="userPassword2"/>
						</div>
						<div class="col-md-12 form-group">
							<label class="form-label" for="basic-default-message" ><h3>성별</h3></label>
							<select  id="userGender" class="form-select" name ="userGender"  aria-label=".form-select-lg example">
							    <option selected>선택하기</option>
								<option value="M">남자</option>
								<option value="F">여자</option>
							</select>
						</div>
						<div class="col-md-12 form-group">
							<label class="form-label" ><h3>휴대폰 번호</h3></label>
							<input type="text" id="userPhone" class="form-control" name ="userPhone"/>
						</div>
						<div class="col-md-12 form-group">
							<label class="form-label" ><h3>이메일주소</h3></label>
							<input type="text" id="userEmail" class="form-control" name ="userEmail"/>
						</div>
					</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary">수정하기</button>
		      </div>
		    </div>
		  </div>
		</div>
     
     
     	<!-- Modal (회원탈퇴) -->
     		<div class="modal fade" id="dropInfor" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h2 class="modal-title" id="exampleModalLabel" style="text-align: center;">탈퇴하기</h2>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		            <form>					
						<div class="col-md-12 form-group">
							<label class="asd" >비밀번호를 입력해주세요</label>
							<input type="password" id="userPassword" class="form-control" name ="userPassword"/>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<input type="hidden" name="role" value="ROLE_USER">
					</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary">탈퇴하기</button>
		      </div>
		    </div>
		  </div>
		</div>
     
</body>
</html>