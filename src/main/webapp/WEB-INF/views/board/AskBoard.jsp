<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 등록하기</title>

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
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">

</head>
<body>

    <!-- Contact Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">1:1 문의</span></h2> 
        </div>
        
        <div class="row px-xl-5">
            <div class="col-lg-7 mb-5">
                <div class="contact-form">
                    <div id="success"></div>
                    
                    <form name="sentMessage" id="contactForm" novalidate="novalidate">
                        
                <div class="control-group">
                         상담유형 <select class="form-select" aria-label="Default select example">
                            <option selected>Category</option>
                            <option value="1">회원문의</option>
                            <option value="2">상품문의</option>
                            <option value="3">구매문의</option>
                            <option value="4">플래너문의</option>
                            <option value="5">사이트이용방법</option>
                         </select>
                            <p class="help-block text-danger"></p>
                        </div>
                       
                       
                    <div class="control-group">
                            제목 <input type="text" class="form-control" id="subject" placeholder="Subject"
                                required="required" data-validation-required-message="Please enter a subject" />
                            <p class="help-block text-danger"></p>
                        </div>
                    <div class="control-group">
                           내용 <textarea class="form-control" rows="6" id="message" placeholder="Message"
                                required="required"
                                data-validation-required-message="Please enter your message"></textarea>
                            <p class="help-block text-danger"></p>
                        </div>
	            <div class="control-group">
                            첨부파일 <input type="file" class="form-control" id="file" placeholder="File"
                                required="required" data-validation-required-message="Please enter a file" />
                            <p class="help-block text-danger"></p>
	                    </div> 

                        <div>
                            <button class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton">등록하기</button>
                        </div>
                    </form>
                
                </div>
            </div>
 
        </div>
    </div>
    <!-- Contact End -->

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    
</body>
</html>