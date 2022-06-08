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
      
       <!-- favicon -->
        
        <!-- google font -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
        <!-- fontawesome -->
       
        <!-- bootstrap -->
        
        <!-- owl carousel -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/diary/owl.carousel.css">
        <!-- magnific popup -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/diary/magnific-popup.css">
        <!-- animate css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/diary/animate.css">
        <!-- mean menu css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/diary/meanmenu.min.css">
        <!-- main style -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/diary/main.css">
        <!-- responsive -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/diary/responsive.css">


        <!-- jquery -->
        <script src="${pageContext.request.contextPath}/js/diary/jquery-1.11.3.min.js"></script>
        <!-- bootstrap -->
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <!-- count down -->
        <script src="${pageContext.request.contextPath}/js/diary/jquery.countdown.js"></script>
        <!-- isotope -->
        <script src="${pageContext.request.contextPath}/js/diary/jquery.isotope-3.0.6.min.js"></script>
        <!-- waypoints -->
        <script src="${pageContext.request.contextPath}/js/diary/waypoints.js"></script>
        <!-- owl carousel -->
        <script src="${pageContext.request.contextPath}/js/diary/owl.carousel.min.js"></script>
        <!-- magnific popup -->
        <script src="${pageContext.request.contextPath}/js/diary/jquery.magnific-popup.min.js"></script>
        <!-- mean menu -->
        <script src="${pageContext.request.contextPath}/js/diary/jquery.meanmenu.min.js"></script>
        <!-- sticker js -->
        <script src="${pageContext.request.contextPath}/js/diary/sticker.js"></script>
        <!-- main js -->
        <script src="${pageContext.request.contextPath}/js/diary/main.js"></script>

        <style>
            .diary-bg-1 {
                background-image: url(../../../img/diary-default.jpg);
            }
            
            .table {
                text-align: center; 
                margin: auto;
                  
            }
        </style>
       
       
       
</head>
<body>
    
<!-- row -->
<div class="row" >
<!-- table section -->
 <div class="col-md-6">
   <div class="white_shd full margin_bottom_30">
      <div class="full graph_head">
         <div class="heading1 margin_0">
            <h2 align="center">1:1 문의</h2><p></p>
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
             <c:forEach items="${requestScope.pageList.content}" var="askboard"> 
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

<p></p> 
  
      <div class="row">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="pagination-wrap"> 
                            <ul>
                                <c:set var="doneLoop" value="false"/>
                                <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
                                    <li><a href="${pageContext.request.contextPath}/board/AskList?nowPage=${startPage-1}">Prev</a></li>
                                </c:if>
                                <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
                                    <c:if test="${(i-1)>=pageList.getTotalPages()}"> <!-- 페이지가 전체페이지보다 크다면 -->
                                        <c:set var="doneLoop" value="true"/> <!-- 다음페이지 돌지마라 -->
                                    </c:if> 
                                    <c:if test="${not doneLoop}" > <!-- 다음페이지가 없으면 -->
                                      <li><a class="paginate_button <c:if test='${nowPage eq i}'>active</c:if>" href="${pageContext.request.contextPath}/board/AskList?nowPage=${i}">${i}</a><li>
                                    </c:if>
                                </c:forEach>
                                <!-- <li><a class="active" href="#">2</a></li>
                                <li><a href="#">3</a></li> -->
                                <c:if test="${(startPage+blockCount)<=pageList.getTotalPages()}">
                                    <li><a href="${pageContext.request.contextPath}/board/AskList?nowPage=${startPage+blockCount}">Next</a></li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   
   


<%-- <nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
     <c:choose>
       <c:when test="${list.first}">
        <li class="page-item disabled">
        <a class="page-link" href="?page=${list.number-1}" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span></a></li> 
       </c:when>
       <c:otherwise>
        <li class="page-item">
        <a class="page-link" href="?page=${list.number-1}" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span></a></li>
       </c:otherwise>
     </c:choose>
     
     <c:choose>
       <c:when test="${list.last}">
        <li class="page-item disabled">
        <a class="page-link" href="?page=${list.number+1}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span></a></li>
       </c:when>
       <c:otherwise>
        <li class="page-item">
        <a class="page-link" href="?page=${list.number+1}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span></a></li>
       </c:otherwise>
     </c:choose>
  </ul>
</nav>
 --%>


</body>
</html>