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
	var box = [];
	
		//회원 예약자 동일
		$("#check").click(function(){

			if($("#check")[0].checked==true){
				$("#bookName").val($("#name").val());
				$("#bookEmail").val($("#email").val());
				$("#bookPhone").val($("#phone").val());
			}else{
				$("#bookName").val("");
				$("#bookEmail").val("");
				$("#bookPhone").val("");
			}
			
			
		});

	
		function selectAll(){
			$.ajax({
				url:"${pageContext.request.contextPath}/order/select", //서버요청주소
				type:"post", // 요청방식(get, post)
				traditional: true,
				dataType:"json",//서버가 응답해주는 데이터타입(text,html,xml,json)
				//data:"${_csrf.parameterName}=${_csrf.token}",//서버에게 보낼 parameter정보
				data: { '${_csrf.parameterName}' : '${_csrf.token}',goods : ${requestScope.goods}},
	   			success :function(result){
					
	   					var data ="";
	   					var sutotal =0;
	   					$.each(result.goods, function(index, item){
		   					var price =`${'${item.goodsPrice}'}`;
		   					var no =`${'${result.goodsLine[index].goodsLineAmount}'}`;
		   					var sum =price*no; 
		   					sutotal +=sum;
		   					data +=`<div class='order-details-confirmation mb-5'>`;
			   				data +=`<div class='cart-page-heading'>`;
			   				data +=`<h5>${'${item.goodsName}'}</h5><img src='../img/bottom_logo.png' alt='IMG' ></div>`; //${"${item.goodsPhoto}"}
			   				data +=` <ul class='order-details-form mb-4'>`;
			   				data +=`<li><span>사용일</span> <span >${'${result.goodsLine[index].goodsLineDate}'}</span></li>`;
			   				data +=`<li><span>총금액(금액X갯수)</span> <span>${'${sum}'}</span></li></ul></div>`;
			   				
						})
						
						data +=`<div class='order-details-confirmation mb-5'>`;
						data +=`<div class='cart-page-heading'>`;
						data +=`<h5>총 금액</h5> <span id='sutotal'>${'${sutotal}'}</span>`;
						data +=`</div></div>`;

						$("#name").val(result.user.userName);
						$("#email").val(result.user.userEmail);
						$("#phone").val(result.user.userPhone);
						
						$("#products").html(data);
					
	   				},error : function(err){  
	   					alert(err+"에러 발생했어요.");
	   				}  //실팽했을때 실행할 함수 
	   			});
		}

		$("#order").click(function(){
			
			if($("#kakao")[0].checked){
				$.ajax({
					url:"${pageContext.request.contextPath}/order/kakao", //서버요청주소
					type:"post", // 요청방식(get, post)
					traditional: true,
					dataType:"json",//서버가 응답해주는 데이터타입(text,html,xml,json)
					//data:"${_csrf.parameterName}=${_csrf.token}",//서버에게 보낼 parameter정보
					data: { '${_csrf.parameterName}' : '${_csrf.token}',goods : ${requestScope.goods}, name : $("#bookName").val(),
						email : $("#bookEmail").val(), phone : $("#bookPhone").val(), totalPrice : $("#sutotal").html()
						,text: $("#text").val()},
					success: function(result){
						//alert(result.tid)
						var options = 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no';
						var box =result.next_redirect_pc_url;
						window.open(box,"카카오페이",options);
						
						location.href = "${pageContext.request.contextPath}/order/success";
					},
					error: function(err){
						alert(err);
					}	
				});//ajax
			}else{
				$.ajax({
					url:"${pageContext.request.contextPath}/order/bankBook", //서버요청주소
					type:"post", // 요청방식(get, post)
					traditional: true,
					dataType:"json",//서버가 응답해주는 데이터타입(text,html,xml,json)
					//data:"${_csrf.parameterName}=${_csrf.token}",//서버에게 보낼 parameter정보
					data: { '${_csrf.parameterName}' : '${_csrf.token}',goods : ${requestScope.goods}, name : $("#bookName").val(),
						email : $("#bookEmail").val(), phone : $("#bookPhone").val(), totalPrice : $("#sutotal").html()
						,text: $("#text").val()},
					success: function(result){
						alert("가상계좌 : "+result);
						location.href = "${pageContext.request.contextPath}/order/success";
					},
					error: function(err){
						alert("실패");
					}	
				});//ajax
			}

		})
		
		selectAll();

})

</script>

</head>
<body>
	 <div class="checkout_area section_padding_100">
            <div class="container">
                <div class="row" >

                    <div class="col-12 col-md-6 col-lg-5 ml-lg-auto" id="products">

                    </div>
                    
                    
					<!--ㅇ오른쪽  -->
                    <div class="col-12 col-md-6 col-lg-5 ml-lg-auto">
                        <div class="order-details-confirmation mb-5">

                            <div class="cart-page-heading">
                                <h5>회원 정보</h5>
                            </div>
                            <ul class="order-details-form mb-4">
                                <li><span>회원 이름</span> <input type="text" id ="name"></li>
                                <li><span>이메일 주소</span> <input type="text" id ="email"></li>
                                <li><span>휴대전화 번호</span> <input type="text" id ="phone"></li>
                            </ul>
                        </div>

                        <form>
                        <div class="order-details-confirmation mb-5">
							<div class="row">
	                            <div class="col cart-page-heading">
	                                <h5>예약자 정보</h5>
	                            </div>
	                            <div class="col cart-page-heading text-end">
	                                <input class="form-check-input " type="checkbox" name="check"  id="check">회원과 동일
	                            </div>
                            </div>
                            
                            <ul class="order-details-form mb-4">
                                <li><span>회원 이름</span> <input type="text" id="bookName" name="bookName"></li>
                                <li><span>이메일 주소</span> <input type="text" id="bookEmail"  name="bookEmail"></li>
                                <li><span>휴대전화 번호</span> <input type="text" id="bookPhone"  name="bookPhone"></li>
                                <span>추가정보 사항</span><p><textarea id="text"  name="bookText" class="form-control" placeholder="내용을 입력해주세요." name="placeContent"></textarea>
                            </ul>
                            
                        </div>
                        
                        <div class="order-details-confirmation mb-3">

                            <div class="cart-page-heading mb-4">
                                <h5>결재 방법(필수)</h5>
                                
                                <ul class="order-details-form mb-4">
								<div class="form-check">
									<input class="form-check-input" type="radio" name="flexRadioDefault" id="none">
									<label class="form-check-label" for="flexRadioDefault1">
										무통장 입금
									</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="flexRadioDefault" id="kakao" checked>
									<label class="form-check-label" for="flexRadioDefault2">
										카카오페이
									</label>
								</div>
                            </ul>
                            </div>

                            <button type="button" class="btn karl-checkout-btn" id="order">결재 하기</button>
                        </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

</body>
</html>