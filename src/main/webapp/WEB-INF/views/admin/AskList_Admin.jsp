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
      <link rel="stylesheet" href="css/bootstrap.min.css" />
      <!-- site css -->
      <link rel="stylesheet" href="style.css" />
      <!-- responsive css -->
      <link rel="stylesheet" href="css/responsive.css" />
      <!-- color css -->
      <link rel="stylesheet" href="css/colors.css" />
      <!-- select bootstrap -->
      <link rel="stylesheet" href="css/bootstrap-select.css" />
      <!-- scrollbar css -->
      <link rel="stylesheet" href="css/perfect-scrollbar.css" />
      <!-- custom css -->
      <link rel="stylesheet" href="css/custom.css" />
      <!-- calendar file css -->
      <link rel="stylesheet" href="js/semantic.min.css" />
      <!-- fancy box js -->
      <link rel="stylesheet" href="css/jquery.fancybox.css" />
 
</head>
<body>
    
    <!-- row -->
<div class="row">
<!-- table section -->
 <div class="col-md-6">
   <div class="white_shd full margin_bottom_30">
      <div class="full graph_head">
         <div class="heading1 margin_0">
            <h2>1:1 문의 목록</h2>
         </div>
      </div> 
    <div class="table_section padding_infor_info">
       <div class="table-responsive-sm">
          <table class="table">
             <c:choose>
             <c:otherwise>
             <c:forEach items="${requseScope.pageList.content}" var="board"> 
             <thead>
                <tr>
                  <th>순서</th>
                  <th>제목</th>
                  <th>날짜</th>
                  <th>답변여부</th>
                </tr>
             </thead>
               <tbody>
                 <tr>
                   <td>순서</td>
                   <td>제목</td>
                   <td>작성한날짜</td>
                   <td>답변완료</td>
                 </tr>
                 <tr>
                   <td>순서</td>
                   <td>제목</td>
                   <td>작성한날짜</td>
                   <td>답변완료</td>
                 </tr>
                 <tr>
                   <td>순서</td>
                   <td>제목</td>
                   <td>작성한날짜</td>
                   <td>답변완료</td>
                 </tr>
                 <tr>
                   <td>순서</td>
                   <td>제목</td>
                   <td>작성한날짜</td>
                   <td>답변완료</td>
                 </tr>
               </tbody>
              </c:forEach> 
              </c:otherwise>
              </c:choose>
            </table>
          <button class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton">작성하기</button>   
          </div>
        </div>
       
       </div>                    
     </div>
   </div>
      <!-- jQuery -->
      <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <!-- wow animation -->
      <script src="js/animate.js"></script>
      <!-- select country -->
      <script src="js/bootstrap-select.js"></script>
      <!-- owl carousel -->
      <script src="js/owl.carousel.js"></script> 
      <!-- chart js -->
      <script src="js/Chart.min.js"></script>
      <script src="js/Chart.bundle.min.js"></script>
      <script src="js/utils.js"></script>
      <script src="js/analyser.js"></script>
      <!-- nice scrollbar -->
      <script src="js/perfect-scrollbar.min.js"></script>
      <script>
         var ps = new PerfectScrollbar('#sidebar');
      </script>
      <!-- fancy box js -->
      <script src="js/jquery-3.3.1.min.js"></script>
      <script src="js/jquery.fancybox.min.js"></script>
      <!-- custom js -->
      <script src="js/custom.js"></script>
      <!-- calendar file css -->    
      <script src="js/semantic.min.js"></script>

</body>
</html>