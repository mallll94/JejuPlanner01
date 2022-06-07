<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    
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




</body>
</html>