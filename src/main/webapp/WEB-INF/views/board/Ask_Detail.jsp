<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 상세보기</title>

    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">


    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../libs/ask/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../css/ask/style.css" rel="stylesheet">
    
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="../libs/ask/easing/easing.min.js"></script>
    <script src="../libs/ask/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="../mail/ask/jqBootstrapValidation.min.js"></script>
    <script src="../mail/ask/contact.js"></script>

    <!-- Template Javascript -->
     <script src="../js/ask/main.js"></script> 

<script type="text/javascript">
   
   $(function(){
	   
	   $("button[value=삭제]").click(function() {
       	 $("#requestForm").attr("action", "${pageContext.request.contextPath}/Askdelete");
		   $("#requestForm").submit();
		})	
		
   })
   
</script>    
    

</head>
<body>

    <!-- Contact Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">1:1 문의 상세보기</span></h2> 
        </div>
        
        <div class="row px-xl-5">
            <div class="col-lg-7 mb-5">
                <div class="contact-form">
                    <div id="success"></div>
                    
                    <form name="sentMessage" id="contactForm" novalidate="novalidate">
                    
                    <div class="control-group">
                            카테고리 <input type="text" readonly class="form-control" id="askCategory" name="askCategory" value="${askboard.askCategory}"/>
                            <p class="help-block text-danger"></p>
                    </div>
                    
                    <div class="control-group">
                            제목 <input type="text" readonly class="form-control" id="askTitle" name="askTitle" value="${askboard.askTitle}"/>
                            <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                           내용 <textarea readonly class="form-control" rows="6" id="askContent" name="askContent">${askboard.askContent}</textarea>
                            <p class="help-block text-danger"></p>
                    </div>
	               
	                <h5 class="card-header">첨부파일</h5>
		             <div class="card-body">
		              <div class="mb-3">
		                <img alt = "첨부된 이미지" src="/images/ask/${askboard.askAttach}" width="300" height="300">
		              </div>
		            </div>
	                
	                
	                
                   </form> 
                   
                   <form name="requestForm" method = "post" id="requestForm">
                     <input type="hidden" name="askId" value="${askboard.askId}">
                       <div align="right">
                         <button type="button" class="btn btn-primary py-2 px-4" value="삭제">삭제하기</button>
                       </div>
                   </form>    
                      
                </div>
            </div>
 
        </div>
    </div>
    <!-- Contact End -->

<!-- Reply -->
<div class="control-group">
답변 
<c:forEach items="${replylist}" var="reply">
<div>
  <textarea readonly class="form-control" rows="6" id="askReplyContent" name="askReplyContent">
	${reply.askReplyContent}
  </textarea>
 </div> 
 <div align="right">  
   <span>
     <a href="${pageContext.request.contextPath}/reply/delete/${reply.askReplyId}/${askboard.askId}">삭제하기</a>
   </span>
</div>
</c:forEach>     
</div>


</body>
</html>