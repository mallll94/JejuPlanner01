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
   .form-control {display: inline-block; width: 40%;}
   .form-control-label {width: 30%; text-align: center;}
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
		        
              </div>
            </div>
          </div>
        </div>
       </div> 
      </div>
</body>
</html>