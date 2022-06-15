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
             <c:forEach items="${requestScope.asklist}" var="askboard"> 
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
             
             <div align="right" style="margin-right: 230px"> 
              <button onclick="location = '/board/AskBoard'" class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton">작성하기</button> 
             </div> 
              
          </div>
        </div>
       
       </div>                    
     </div>
   </div>

<p></p> 
  
           <!-- 페이징 처리 -->
          <div style="text-align: center">
            <nav class="pagination-container">
              <!--페이징 내용-->
              <div class="property-pagination">

                <c:set var="doneLoop" value="false" />
                <c:if test="${(startPage-blockCount) > 0}">
                  <a class="pagination-newer" href="${pageContext.request.contextPath}/mypage/myask?nowPage=${startPage-1}">PREV</a>
                </c:if>

                <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'>
                  <c:if test="${(i-1)>=pageList.getTotalPages()}">
                    <c:set var="doneLoop" value="true" />
                  </c:if>
                  <c:if test="${not doneLoop}">
                    <a class="paginate_button" href="${pageContext.request.contextPath}/mypage/myask?nowPage=${i}">${i}</a>
                  </c:if>
                </c:forEach>

                <c:if test="${(startPage+blockCount)<=pageList.getTotalPages()}">
                  <a class="pagination-older" href="${pageContext.request.contextPath}/mypage/myask?nowPage=${startPage+blockCount}">NEXT</a>
                </c:if>

              </div>
              <!--페이징 내용 끝-->
            </nav>
          </div>
          <!-- 페이징 처리끝 -->
      
   
   


</body>
</html>