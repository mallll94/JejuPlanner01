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
       <div class="col-md-12">
          <div class="white_shd full margin_bottom_30">
             <div class="full graph_head">
                <div class="heading1 margin_0">
                   <h2>소통게시판 게시판</h2>
                </div>
             </div>
            	   <div align="left">
            	    <span><button type="button" id="all" class=" btn" style="background-color: grey;" onclick="location.href='freeBoard'">전체보기</button></span>
					 <button type="button" id="recommend" class=" btn" name="여행추천" style="background-color: grey;">여행추천</button>
					 <button type="button" id="recommend" class="btn" name="장소추천" style="background-color: grey;">장소추천</button>
					</div>
	             <div class="table_section padding_infor_info">
	                <div class="table-responsive-sm">
	                   <table class="table">
	                      <thead>
	                         <tr>
	                            <th>카테고리</th>
	                            <th>제목</th>
	                            <th>등록일</th>
	                            <th>조회수</th>
	                         </tr>
	                      </thead>
	           			  <c:forEach items="${requestScope.pageList.content}" var="freeboard">   
		                      <tbody>
		                      	<tr>
		                         	<td>${freeboard.freeCategory}</td>
		                            <td> <span><a href="${pageContext.request.contextPath}/board/freeBoard_Detail/${freeboard.freeId}">${freeboard.freeTitle}</a></span></td>
		                            <td>${freeboard.freeRegdate}</td>  		                    
		                            <td>${freeboard.freeReadnum}</td>  
		                         </tr>
		                      </tbody>
		                  </c:forEach>
	                   </table>
	                </div>
	             </div>
             <button onclick="location='./freeBoard_Write'">작성</button>
          </div>
       </div>
       
<div class="row">
  <div class="container">
      <div class="row">
          <div class="col-lg-12 text-center">
              <div class="pagination-wrap"> 
                  <ul>
                    <c:set var="doneLoop" value="false"/>
                      <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
                        <a href="${pageContext.request.contextPath}/board/freeBoard?nowPage=${startPage-1}">Prev</a>
                      </c:if>
                      <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
                        <c:if test="${(i-1)>=pageList.getTotalPages()}"> <!-- 페이지가 전체페이지보다 크다면 -->
                          <c:set var="doneLoop" value="true"/> <!-- 다음페이지 돌지마라 -->
                        </c:if> 
                        <c:if test="${not doneLoop}" > <!-- 다음페이지가 없으면 -->
                          <a class="paginate_button <c:if test='${nowPage eq i}'>active</c:if>" href="${pageContext.request.contextPath}/board/freeBoard?nowPage=${i}">${i}</a>
                        </c:if>
                      </c:forEach>
                                 <!-- <li><a class="active" href="#">2</a></li>
                                 <li><a href="#">3</a></li> -->
                     <c:if test="${(startPage+blockCount)<=pageList.getTotalPages()}">
                      <a href="${pageContext.request.contextPath}/board/freeBoard?nowPage=${startPage+blockCount}">Next</a>
                     </c:if>
                 </ul>
             </div>
         </div>
     </div>
  </div>
</div> 

   <!--Css시도-->
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
                     <button type="button" id="all" class=" btn" style="background-color: grey;" onclick="location.href='freeBoard'">전체보기</button>
                     <button type="button" id="recommend" class=" btn" name="여행추천" style="background-color: grey;">여행추천</button>
                     <button type="button" id="recommend" class="btn" name="장소추천" style="background-color: grey;">장소추천</button>
                    </div>
                 </div>
                  <div class="property-list">
                     <div class="single-property-item">
                        <div class="row">
                           <div class="property-text">
                              <div class="s-text">For Sale</div>
                              <h5 class="r-title">Villa 9721 Glen Creek</h5>
                              <div class="room-price">
                                    <span>Start From:</span>
                                    <h5>$3.000.000</h5>
                              </div>
                              <div class="properties-location"><i class="icon_pin"></i> 9721 Glen Creek Ave.
                                    Ballston Spa, NY</div>
                              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                    incididunt ut labore.</p>
                              <ul class="room-features">
                                    <li>
                                       <i class="fa fa-arrows"></i>
                                       <p>5201 sqft</p>
                                    </li>
                                    <li>
                                       <i class="fa fa-bed"></i>
                                       <p>8 Bed Room</p>
                                    </li>
                                    <li>
                                       <i class="fa fa-bath"></i>
                                       <p>7 Baths Bed</p>
                                    </li>
                                    <li>
                                       <i class="fa fa-car"></i>
                                       <p>1 Garage</p>
                                    </li>
                              </ul>
                           </div>
                             
                        </div>
                     </div>
                   
                  </div>
                  <div class="property-pagination">
                     <a href="#">1</a>
                     <a href="#">2</a>
                     <a href="#">3</a>
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