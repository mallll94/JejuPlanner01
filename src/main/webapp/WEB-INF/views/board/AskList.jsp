<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 게시판</title>

  <!-- site icon -->
      <link rel="icon" href="images/fevicon.png" type="image/png" />
      <!-- bootstrap css -->
      <link rel="stylesheet" href="../css/ask/bootstrap.min.css" />
      <!-- site css -->
      <link rel="stylesheet" href="../css/ask/style.css" />
      <!-- responsive css -->
      <link rel="stylesheet" href="../css/ask/responsive.css" />
      <!-- color css -->
      <link rel="stylesheet" href="../css/ask/color_2.css" />
      <!-- select bootstrap -->
      <!--  <link rel="stylesheet" href="../css/ask/bootstrap-select.css" /> -->
      <!-- scrollbar css -->
      <link rel="stylesheet" href="../css/ask/perfect-scrollbar.css" />
      <!-- custom css -->
      <link rel="stylesheet" href="../css/ask/custom.css" />
      <!-- calendar file css -->
      <link rel="stylesheet" href="../css/ask/semantic.min.css" />
      <!-- fancy box js -->
      <link rel="stylesheet" href="../css/ask/jquery.fancybox.css" />
 
      <!-- jQuery -->
      <script src="../js/ask/jquery.min.js"></script>
      <script src="../js/ask/popper.min.js"></script>
      <script src="../js/ask/bootstrap.min.js"></script>
      <!-- wow animation -->
     <script src="../js/ask/animate.js"></script> 
      <!-- select country -->
     <script src="../js/ask/bootstrap-select.js"></script>
      <!-- owl carousel -->
      <script src="../js/ask/owl.carousel.js"></script> 
      <!-- chart js -->
      <script src="../js/ask/Chart.min.js"></script>
      <script src="../js/ask/Chart.bundle.min.js"></script>
      <script src="../js/ask/utils.js"></script>
      <script src="../js/ask/analyser.js"></script>
      <!-- nice scrollbar -->
      <!-- <script src="../js/ask/perfect-scrollbar.min.js"></script>
      <script>
         var ps = new PerfectScrollbar('#sidebar');
      </script>  -->
      <!-- fancy box js -->
      <!--  <script src="../js/ask/jquery-3.3.1.min.js"></script>
      <script src="../js/ask/jquery.fancybox.min.js"></script> -->
      <!-- custom js -->
      <!--  <script src="../js/ask/custom.js"></script> -->
      <!-- calendar file css -->    
      <script src="../js/ask/semantic.min.js"></script>
       
       
       
</head>
<body>
    
<!-- row -->
<div class="row">
<!-- table section -->
 <div class="col-md-6">
   <div class="white_shd full margin_bottom_30">
      <div class="full graph_head">
         <div class="heading1 margin_0">
            <h2 align="center">1:1 문의 목록</h2><p></p>
         </div>
      </div> 
    <div class="table_section padding_infor_info">
       <div class="table-responsive-sm">
          <table class="table">
             <thead>
                <tr>
                  <th>순서</th>
                  <th>카테고리</th>
                  <th>제목</th>
                  <th>날짜</th>
                  <th>답변여부</th>
                </tr>
             </thead>
             <c:forEach items="${requestScope.list}" var="askboard"> 
               <tbody>
                 <tr>
                   <td>${askboard.askId}</td>
                   <td>${askboard.askCategory}</td>
                   <td>
                    <a href = "${pageContext.request.contextPath}/board/Ask_Detail/${askboard.askId}">
                      ${askboard.askTitle}
                    </a> 
                   </td>
                   <td>${askboard.askRegdate}</td>
                   <td>${askboard.askComplete}</td>
                 </tr>
               </tbody>
              </c:forEach> 
            </table>
             <div align="right"> 
              <button onclick="location = '/board/AskBoard'" class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton">작성하기</button> 
             </div>   
          
          </div>
        </div>
       
       </div>                    
     </div>
   </div>
    

</body>
</html>