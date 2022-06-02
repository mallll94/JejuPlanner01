<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
 <head>
      <!-- basic -->
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>관리자 공지사항 관리</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->
      <link rel="stylesheet" href="../css/notice/bootstrap.min.css" />
      <!-- site css -->
      <link rel="stylesheet" href="../css/notice/style.css" />
      <!-- responsive css -->
      <link rel="stylesheet" href="../css/notice/responsive.css" />
      <!-- color css -->
      <link rel="stylesheet" href="../css/notice/colors.css" />
      <!-- select bootstrap -->
      <link rel="stylesheet" href="../css/notice/bootstrap-select.css" />
      <!-- scrollbar css -->
      <link rel="stylesheet" href="../css/notice/perfect-scrollbar.css" />
      <!-- custom css -->
      <link rel="stylesheet" href="../css/notice/custom.css" />
      <!-- calendar file css -->
      <link rel="stylesheet" href="../css/notice/semantic.min.css" />
      <!-- fancy box js -->
      <link rel="stylesheet" href="../css/notice/jquery.fancybox.css" />
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
      
      <!-- jQuery -->
      <script src="../js/notice/jquery.min.js"></script>
      <script src="../js/notice/popper.min.js"></script>
      <script src="../js/notice/bootstrap.min.js"></script>
      <!-- wow animation -->
      <script src="../js/notice/animate.js"></script>
      <!-- select country -->
      <script src="../js/notice/bootstrap-select.js"></script>
      <!-- owl carousel -->
      <script src="../js/notice/owl.carousel.js"></script> 
      <!-- chart js -->
      <script src="../js/notice/Chart.min.js"></script>
      <script src="../js/notice/Chart.bundle.min.js"></script>
      <script src="../js/notice/utils.js"></script>
      <script src="../js/notice/analyser.js"></script>
      <!-- nice scrollbar 
      <script src="../js/notice/perfect-scrollbar.min.js"></script> -->
      <!-- fancy box js 
      <script src="../js/notice/jquery-3.3.1.min.js"></script>
      <script src="../js/notice/jquery.fancybox.min.js"></script> -->
      <!-- custom js 
      <script src="../js/notice/custom.js"></script> -->
      <!-- calendar file css -->    
      <script src="../js/notice/semantic.min.js"></script>
 </head>
	<body>
       <div class="col-md-12">
          <div class="white_shd full margin_bottom_30">
             <div class="full graph_head">
                <div class="heading1 margin_0">
                   <h2>관리자 공지사항 관리</h2>
                </div>
             </div>
	             <div class="table_section padding_infor_info">
	                <div class="table-responsive-sm">
	                   <table class="table">
	                      <thead>
	                         <tr>
	                            <th>순서</th>
	                            <th>제목</th>
	                            <th>등록일</th>
	                         </tr>
	                      </thead>
	           			  <c:forEach items="${requestScope.list}" var="notice">   
		                      <tbody>
		                      	<tr>
		                         	<td>${notice.noticeId}</td>
		                            <td> <span><a href="${pageContext.request.contextPath}/admin/notice_Detail/${notice.noticeId}">${notice.noticeTitle}</a></span></td>
		                            <td>${notice.noticeRegdate}</td>  
		                         </tr>
		                      </tbody>
		                  </c:forEach>
	                   </table>
	                </div>
	             </div>
             <button onclick="location='./notice_Write'">작성</button>
          </div>
       </div>
	</body>
</html>