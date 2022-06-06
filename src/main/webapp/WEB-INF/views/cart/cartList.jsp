<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cart/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cart/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cart/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cart/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cart/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cart/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cart/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cart/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cart/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cart/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cart/main.css">
<!--===============================================================================================-->	
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/js/cart/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/js/popper.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/js/cart/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/js/cart/main.js"></script>	
	<script type="text/javascript">
	
	$(function(){
		
		//수량 변경-
		$("#minus").click(function(){
			alert(2);
		})
		
		//수량 변경+
		$("#check").click(function(){
			alert(2);
		})
		
		//장바구니 뿌려주는
		function selectAll(){
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/cart/selectAll",
				dataType:"json",
				data:{},
				success:function(data){						
					 
				},//callback	
				error: function(err){
					alert(err);
				}		
			});//ajax
		}//selectAll
		selectAll();
	});//jquery
	
	
	</script>
<body >
<!-- Shoping Cart -->
	<form class="bg0 p-t-75 p-b-85" id="cartForm">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
					<div class="m-l-25 m-r--38 m-lr-0-xl">
					
						<div >
							<div class="flex-w flex-m m-r-20 m-tb-5">
								<div class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 m-r-10 pointer m-tb-5">
									<button type="button">전체선택</button>
								</div>	
									
								<div class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5">
									<button type="button">선택한 상품 삭제</button>
								</div>
							</div>	
						</div>
						<div class="wrap-table-shopping-cart">
							<table class="table-shopping-cart">
								<tr class="table_head">
									<th class="column-1">Product</th>
									<th class="column-2"></th>
									<th class="column-3">Price</th>
									<th class="column-6">Date</th>
									<th class="column-4">Quantity</th>
									<th class="column-5">Total</th>
								</tr>

								<tr class="table_row">
									
									<td class="column-1">
										<input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="" checked>
										<div class="how-itemcart1">
											<img src="../img/bottom_logo.png" alt="IMG">
										</div>
									</td>
									<td class="column-2">Fresh Strawberries</td>
									<td class="column-3">$ 36.00</td>
									<td class="column-6">2022/02/22<input type="hidden" name="goodsLineDate"/></td>
									<td class="column-4">
										<div class="wrap-num-product flex-w m-l-auto m-r-0">
											<button type="button" id="minus">
											<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-minus"></i>
											</div>
											</button>

											<input class="mtext-104 cl3 txt-center num-product" type="number" name="goodsLineAmount" value="1">
											
											<button type="button" id="plus">
											<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m" >
												<i class="fs-16 zmdi zmdi-plus"></i>
											</div>
											</button>
										</div>
									</td>
									<td class="column-5">$ 36.00</td>
								</tr>

							</table>
						</div>

						
					</div>
				</div>

				<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
					<div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
						<h4 class="mtext-109 cl2 p-b-30">
							Cart Totals
						</h4>
						<div class="flex-w flex-t bor12 p-b-13"></div>
						<div class="flex-w flex-t p-t-27 p-b-33">
							<div class="size-208">
								<span class="mtext-101 cl2">
									Total:
								</span>
							</div>

							<div class="size-209 p-t-1">
								<span class="mtext-110 cl2">
									$79.65
								</span>
							</div>
						</div>

						<button class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">
							결재 하기
						</button>
					</div>
				</div>
			</div>
		</div>
		
		
		
	</form>
</body>
	
</html>