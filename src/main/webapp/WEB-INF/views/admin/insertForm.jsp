<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
	function readImage(input){
	    // 인풋 태그에 파일이 있는 경우
	    if(input.files && input.files[0]) {
	        // 이미지 파일인지 검사 (생략)
	        // FileReader 인스턴스 생성
	        const reader = new FileReader()
	        // 이미지가 로드가 된 경우
	        reader.onload = e => {
	            const previewImage = document.getElementById("preview-image")
	            previewImage.src = e.target.result
	        }
	        // reader가 이미지 읽도록 하기
	        reader.readAsDataURL(input.files[0])
	    }
	}
	const inputImage = document.getElementById("ss")
	inputImage.addEventListener("change", e => {
	    readImage(e.target)
	})	
	
	
})
	
		
		





</script>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/perfect-scrollbar.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${pageContext.request.contextPath}/js/config.js"></script>




<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<h1>플래너데이터 - 등록</h1>
		<form method="post" action="${pageContext.request.contextPath}/admin/placeInsert" >
			<div class="col-xxl">
                  <div class="card mb-4">
                    <div class="card-header d-flex align-items-center justify-content-between">
                      <h5 class="mb-0">Basic Layout</h5>
                      <small class="text-muted float-end">Default label</small>
                    </div>
                    <div class="card-body">
                      
                       <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-name">분류</label>
                          
                         <div class="col-sm-10">
                          	<select id="li" name="placeCategory">
								<option value='장소'>장소</option>
								<option value='숙소'>숙소</option>
							</select>
                          </div>
                       </div>
                       <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-company">명칭</label>
                          <div class="col-sm-10">
                            <input type="text" class="form-control" id="basic-default-company" placeholder="내용을 입력해주세요." name="placeName" />
                          </div>
                       </div>
                        
                       <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-message">설명</label>
                          <div class="col-sm-10">
                            <textarea id="basic-default-message" class="form-control" placeholder="내용을 입력해주세요." name="placeContent"></textarea>
                          </div>
                       </div>
                        
                       <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-phone">주소</label>
                          <div class="col-sm-10">
                            <input type="text" id="basic-default-addr" class="form-control addr-mask" placeholder="내용을 입력해주세요." name="placeAddr"/>
                          </div>
                       </div>
                        
                       <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-phone">위도</label>
                          <div class="col-sm-10">
                            <input type="text" id="basic-default-placeLatitude" class="form-control placeLatitude-mask" placeholder="ex)125.3032" name="placeLatitude"/>
                          </div>
                       </div>
                        
                       <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-phone">경도</label>
                          <div class="col-sm-10">
                            <input type="text" id="basic-default-placeLongitude" class="form-control placeLongitude-mask" placeholder="ex)45.3032" name="placeLongitude"/>
                          </div>
                       </div>
                       
                       <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-phone">연결 링크</label>
                          <div class="col-sm-10">
                            <input type="text" id="basic-default-URL" class="form-control URL-mask" name="placeUrl"/>
                          </div>
                       </div>
                       
                       <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-phone">첨부 사진</label>
                          <div class="col-sm-10">
                          
                          	<input type="file" id="ss" name="file"/>
                          	<img style="width: 500px;" id="preview-image" src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
                          </div>
 
                       </div> 

                        <div class="row justify-content-end">
                          <div class="col-sm-10">
                            <button type="submit" class="btn btn-primary">Send</button>
                          </div>
                        </div>
                     
                    </div>
                  </div>
                </div>
            </form>  
            
            
</body>
<script src="${pageContext.request.contextPath}/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/js/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
</html>