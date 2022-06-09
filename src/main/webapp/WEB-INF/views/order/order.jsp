<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Core Style CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/order/core-style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/order/style.css">

    <!-- Responsive CSS -->
    <link href="${pageContext.request.contextPath}/css/order/responsive.css" rel="stylesheet">
    
    <!-- jQuery (Necessary for All JavaScript Plugins) -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <!-- Popper js -->
    <script src="${pageContext.request.contextPath}/js/order/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${pageContext.request.contextPath}/js/order/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="${pageContext.request.contextPath}/js/order/plugins.js"></script>
    <!-- Active js -->
    <script src="${pageContext.request.contextPath}/js/order/active.js"></script>
    
<script type="text/javascript">
$(function(){
	function selectAll(){
		$.ajax({
	   			url :"${pageContext.request.contextPath}/order/select" , //서버요청주소
	   			type:"post", //요청방식(method방식 : get | post | put | delete )
	   			dataType:"json"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
	   			data: {},
	   			success :function(result){
					
	   				var data ="";
	   				
	   				
	   				
	   				$.each(result, function(index, item){
	   					data =`<div class='order-details-confirmation'>`;
		   				data =`<div class='cart-page-heading'>`;
		   				data =`<h5>상품명ㅇㄹㅇㄹ</h5><img src='../img/bottom_logo.png' alt='IMG' ></div>`;
		   				data =` <ul class='order-details-form mb-4'>`;
		   				data =`<li><span>사용일</span> <span >2022-05-20</span></li>`;
		   				data =`<li><span>총금액(금액X갯수)</span> <span>$59.90</span></li></ul></div>	`;
					})
					
	   			},error : function(err){  
	   				alert(err+"에러 발생했어요.");
	   			}  //실팽했을때 실행할 함수 
	   		});
	 }
	//selectAll();
	
})

</script>

</head>
<body>
	 <div class="checkout_area section_padding_100">
            <div class="container">
                <div class="row" >

                    <div class="col-12 col-md-6 col-lg-5 ml-lg-auto" id="products">
                    
                        <div class="order-details-confirmation">

                            <div class="cart-page-heading">
                                <h5>상품명ㅇㄹㅇㄹ</h5><img src='../img/bottom_logo.png' alt='IMG' >
                            </div>

                            <ul class="order-details-form mb-4">
                                <li><span>사용일</span> <span >2022-05-20</span></li>
                                <li><span>총금액(금액X갯수)</span> <span>$59.90</span></li>
                            </ul>
                        </div>
                        
                    </div>
                    
                    
					<!--ㅇ오른쪽  -->
                    <div class="col-12 col-md-6 col-lg-5 ml-lg-auto">
                        <div class="order-details-confirmation mb-5">

                            <div class="cart-page-heading">
                                <h5>회원 정보</h5>
                            </div>
                            <ul class="order-details-form mb-4">
                                <li><span>회원 이름</span> <input type="text"></li>
                                <li><span>이메일 주소</span> <input type="text"></li>
                                <li><span>휴대전화 번호</span> <input type="text"></li>
                            </ul>
                        </div>
                        <form>
                        <div class="order-details-confirmation mb-5">
							<div class="row">
	                            <div class="col cart-page-heading">
	                                <h5>예약자 정보</h5>
	                            </div>
	                            <div class="col cart-page-heading text-end">
	                                <input class="form-check-input " type="checkbox" value="" id="flexCheckDefault">회원과 동일
	                            </div>
                            </div>
                            
                            <ul class="order-details-form mb-4">
                                <li><span>회원 이름</span> <input type="text"></li>
                                <li><span>이메일 주소</span> <input type="text"></li>
                                <li><span>휴대전화 번호</span> <input type="text"></li>
                                <span>추가정보 사항</span><p><textarea id="" class="form-control" placeholder="내용을 입력해주세요." name="placeContent"></textarea>
                            </ul>
                            
                        </div>
                        
                        <div class="order-details-confirmation mb-3">

                            <div class="cart-page-heading mb-4">
                                <h5>결재 방법(필수)</h5>
                                
                                <ul class="order-details-form mb-4">
								<div class="form-check">
									<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
									<label class="form-check-label" for="flexRadioDefault1">
										무통장 입금
									</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
									<label class="form-check-label" for="flexRadioDefault2">
										카카오페이
									</label>
								</div>
                            </ul>
                            </div>
                            


                            <a href="#" class="btn karl-checkout-btn">Place Order</a>
                        </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

	
</body>
</html>