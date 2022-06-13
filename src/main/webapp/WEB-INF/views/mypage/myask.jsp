<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 게시판</title>

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




</head>
<body>
    
<!-- row -->
<div align="center">
<!-- table section -->
 <div>
   <div class="white_shd full margin_bottom_30">
      <div class="full graph_head">
         <div class="heading1 margin_0">
            <h2 align="center">1:1 문의</h2><p></p>
         </div>
      </div> 
    <div class="table_section padding_infor_info">
       <div class="table-responsive-sm" style="text-align: center;">
          <table class="table" style="width: 800px; margin-left: 230px">
             <thead align="center">
                <tr>
                  <th>순서</th>
                  <th>카테고리</th>
                  <th>제목</th>
                  <th>날짜</th>
                  <th>답변여부</th>
                </tr>
             </thead>
             <c:forEach items="${requestScope.myList}" var="askboard"> 
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
             <p></p>
              
          </div>
        </div>
       
       </div>                    
     </div>
   </div>

<p></p> 
  
      
   
   


</body>
</html>