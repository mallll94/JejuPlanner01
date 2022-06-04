<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
 <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>공지사항 등록</title>
    
    <meta name="description" content="Most Powerful &amp; Comprehensive Bootstrap 5 HTML Admin Dashboard Template built for developers!" />
    <meta name="keywords" content="dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5">
    <!-- Canonical SEO -->
    <link rel="canonical" href="https://themeselection.com/products/sneat-bootstrap-html-admin-template/">
    
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="../assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css" />
    
    

    <!-- Core CSS -->
    <link rel="stylesheet" href="../assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="../assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="../assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    
	      <!-- Core JS -->
	  <!-- build:js assets/vendor/js/core.js -->
	  <script src="../assets/vendor/libs/jquery/jquery.js"></script>
	  <script src="../assets/vendor/libs/popper/popper.js"></script>
	  <script src="../assets/vendor/js/bootstrap.js"></script>
	  <script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
	  
	  <script src="../assets/vendor/js/menu.js"></script>
	  <!-- endbuild -->
	
	  <!-- Vendors JS -->
	  
	  
	
	  <!-- Main JS -->
	  <script src="../assets/js/main.js"></script>

    <!-- Page CSS -->
    
    <!-- Helpers -->
    <script src="../assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../assets/js/config.js"></script>
    
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async="async" src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
    <script>
    window.dataLayer = window.dataLayer || [];

    function gtag() {
      dataLayer.push(arguments);
    }
    gtag('js', new Date());
    gtag('config', 'GA_MEASUREMENT_ID');
    </script>
    <!-- Custom notification for demo -->
    <!-- beautify ignore:end -->
    
<script type="text/javascript">
        
        $(function() {
		 alert(1)	
	
        $("button[value=수정]").click(function() {
        	$("#requestForm").attr("action", "${pageContext.request.contextPath}/admin/notice_updateForm");
			$("#requestForm").submit();
		})
		
        $("button[value=삭제]").click(function() {
        	$("#requestForm").attr("action", "${pageContext.request.contextPath}/noticeDelete");
			$("#requestForm").submit();
		})
     })
        
</script>

</head>
<body>
<div class="row">
  <div class="col-xl">
    <div class="card mb-4">
      <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">공지사항 상세</h5> 
      </div>
      <div class="card-body">
          <div class="mb-3">
            <label class="form-label" for="basic-default-fullname">제목</label>
            <input type="text" class="form-control" id="basic-default-fullname" name="noticeTitle" placeholder="제목을 입력해주세요" value="${notice.noticeTitle}"/>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-default-message">내용</label>
            <textarea id="basic-default-message" class="form-control" name="noticeContent" placeholder="내용을 입력해주세요">${notice.noticeContent}</textarea>
          </div>           
		    <div class="card">
		      <h5 class="card-header">첨부파일</h5>
		      <div class="card-body">
		        <div class="mb-3">
		          <img alt="첨부된 이미지"  src="/images/notice/${notice.noticeAttach}"  width="300" height="300">
		        </div>
		      </div>
		    </div>
		  <form name="requestForm" method="post" id="requestForm">
		      <input type="hidden" name="noticeId" value="${notice.noticeId}">
	          <button type="button" class="btn btn-primary" value="수정">수정하기</button>
	          <button type="button" class="btn btn-primary" value="삭제">삭제하기</button>
          </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>