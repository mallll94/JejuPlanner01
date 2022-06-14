<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <!-- Google Font -->
 <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

 <!-- Css Styles -->
<link rel="stylesheet" href="/css/azentaMaster/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="/css/azentaMaster/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/css/azentaMaster/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="/css/azentaMaster/themify-icons.css" type="text/css">
<link rel="stylesheet" href="/css/azentaMaster/nice-select.css" type="text/css">
<link rel="stylesheet" href="/css/azentaMaster/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="/css/azentaMaster/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="/css/azentaMaster/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="/css/azentaMaster/style.css" type="text/css">

<!-- Owl Stylesheets -->
<link rel="stylesheet" href="/css/owlCarousel/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="/css/owlCarousel/owl.theme.default.min.css">
    
<style>
   .property-list{
      margin-top: 20px;
      margin-bottom: 20px;
      border-top: solid 2px rgb(189, 189, 189);
      border-bottom: 2px solid rgb(189, 189, 189);
      padding: 10px;
      
   }
   .property-text{display: table;padding: 10px;}
   .category{display: table-cell;}
   .title{
      display: table-cell;
      width: 500px;
      font-size: medium;
      font-weight: bold;
      color: rgb(59, 59, 59);
      padding-left: 10px;
      padding-right: 10px;
   }
   .title:hover{color: #ffc107;}
   .info{display: table-cell;color: rgb(109, 109, 109); font-size: small;}
   .recommend-trip{
      background-color: rgb(255, 195, 42);
      font-size: small;
      color: #ffffff;
      font-weight: 500;
      text-transform: uppercase;
      letter-spacing: 1px;
      display: inline-block;
      padding: 3px 20px;
      margin-left: 5px;
   }
   .recommend-place{
      background-color: skyblue;
      font-size: small;
      color: #ffffff;
      font-weight: 500;
      text-transform: uppercase;
      letter-spacing: 1px;
      display: inline-block;
      padding: 3px 20px;
      margin-left: 5px;
   }
   .write-btn{
      height: 50px;
      line-height: 40px;
      border: 3px solid rgb(189, 189, 189);
      color: rgb(156, 156, 156);
      font-weight: bold;
      font-size: larger;
      width: 200px;
      text-align: center;
      border-radius: 4px;	
   }
</style>
     <script type="text/javascript">
   
     $(function(){
   	  $(document).on("click", "#recommend", function(){
   		  var target=$(this).attr("name")
   		    
   		  let url = "${pageContext.request.contextPath}/board/freeBoard?freeCategory=" + target
   		  location.replace(url)		  
   	  })
   	  
   	  
     })

    </script>   
    
</head>
	<body>'
       

   <!-- Property Section Begin -->
   <section class="property-section spad">
      <div class="container">
         <div class="row">
            <div class="col-lg-3">
               <div class="property-sidebar">
                  <div class="best-agents">
                     <h4>Board</h4>
                     <a href="${pageContext.request.contextPath}/board/notice" class="ba-item">
                        <div class="ba-text">
                           <h5><i class="menu-icon fa-solid fa-user-large"></i> 공지사항</h5>
                           <span>제주잇다의 소식을 확인하세요</span>
                        </div>
                     </a>
                     <a href="${pageContext.request.contextPath}/board/PlanboardList" class="ba-item">
                        <div class="ba-text">
                           <h5><i class="fa-solid fa-thumbtack"></i> 플래너 게시판</h5>
                           <span>좋았던 여행을 공유하세요</span>
                        </div>
                     </a>
                     <a href="${pageContext.request.contextPath}/board/freeBoard" class="ba-item">
                        <div class="ba-text">
                           <h5><i class="fa-solid fa-comments"></i> 소통 게시판</h5>
                           <span>정보를 나누고 교류하세요</span>
                        </div>
                     </a>
                     <a href="${pageContext.request.contextPath}/board/crew" class="ba-item">
                        <div class="ba-text">
                           <h5><i class="fa-solid fa-user-group"></i> 동행 구하기 게시판</h5>
                           <span>여러 사람과 더 즐거운 여행을 즐기세요</span>
                        </div>
                     </a>
                  </div>
               </div>
            </div>
            <div class="col-lg-9">
                  <h4 class="property-title">소통 게시판</h4>
                  <div class="sidebar-btn">
                     <div>
                     <button type="button" id="all" class="btn btn-outline-dark shadow-none"  onclick="location.href='freeBoard'">전체보기</button>
                     <button type="button" id="recommend" class="btn btn-outline-dark shadow-none" name="여행추천" >여행추천</button>
                     <button type="button" id="recommend" class="btn btn-outline-dark shadow-none" name="장소추천" >장소추천</button>
                    </div>
                 </div>
                  <div class="property-list">
                     <c:forEach items="${freelist}" var="freeboard">   
                        <div class="row">
                           <a href="${pageContext.request.contextPath}/board/freeBoard_Detail/${freeboard.freeId}">
                           <div class="property-text">
                              <div class="category">
                                 <c:choose>
												<c:when test="${freeboard.freeCategory eq '여행추천'}">
                                       <span class="recommend-trip">${freeboard.freeCategory}</span>
												</c:when>
												<c:when test="${freeboard.freeCategory eq '장소추천'}">
                                       <span class="recommend-place" >${freeboard.freeCategory}</span>
												</c:when>
										   </c:choose>
                              </div>
                              <div class="title">${freeboard.freeTitle}</div>
                              <div class="info">
                                 <span>등록일: ${freeboard.freeRegdate}</span>
                                 <span>조회수: ${freeboard.freeReadnum}</span>
                              </div>
                           </div>
                           </a>
                        </div>
                     </c:forEach>
                  </div>
                   
                  <div style="text-align: right;">
                     <a href="${pageContext.request.contextPath}/board/freeBoard_Write" class="btn btn-outline-dark shadow-none">작성하기</a>
                  </div>
                  <!-- 페이징 처리 -->
                  <div style="text-align: center">
                     <nav class="pagination-container">
                        <!--페이징 내용-->
                        <div class="property-pagination">
                           <c:set var="doneLoop" value="false"/>
                           <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
                              <a href="${pageContext.request.contextPath}/board/freeBoard?nowPage=${startPage-1}">Prev</a>
                           </c:if>
                           <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
                              <c:if test="${(i-1)>=totalPage}">
                                 <c:set var="doneLoop" value="true"/>
                              </c:if> 
                              <c:if test="${not doneLoop}" >
                                 <a class="paginate_button <c:if test='${nowPage eq i}'>style='background-color:#2cbdb8;' </c:if>" href="${pageContext.request.contextPath}/board/freeBoard?nowPage=${i}">${i}</a>
                              </c:if>
                           </c:forEach>
                           <c:if test="${(startPage+blockCount)<=totalPage}">
                           <a href="${pageContext.request.contextPath}/board/freeBoard?nowPage=${startPage+blockCount}">Next</a>
                           </c:if>
                        </div>
                        <!--페이징 내용 끝-->
                     </nav>
                  </div>
                  <!-- 페이징 처리끝 -->
               </div>
                  
            </div>
         </div>
      </div>
   </section>
   <!-- Property Section End -->



    <!--JQuery-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

    <!-- Js Plugins -->
    <script src="/js/azentaMaster/bootstrap.min.js"></script>
    <script src="/js/azentaMaster/jquery.magnific-popup.min.js"></script>
    <script src="/js/azentaMaster/jquery.nice-select.min.js"></script>
    <script src="/js/azentaMaster/jquery.slicknav.js"></script>
    <script src="/js/azentaMaster/jquery-ui.min.js"></script>
    <script src="/js/owlCarousel/owl.carousel.min.js"></script>
    <script src="/js/azentaMaster/main.js"></script>


</body>
</html>