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
		var deleteBox = [];
		var orderBox = [];
		var countBox = [];
		//수량 변경- // 가격 변경
		$(document).on("click","#minus",function(){	
			//sumtotal.toLocaleString('ko-KR')
			if($("[name=checkboxNoLabel]")[$(this).val()].checked){
			var id = "#goodsLineAmount"+$(this).val();
			var price = "#price"+$(this).val();
			var totalprice = "#totalprice"+$(this).val();
			var check = "#checkboxNoLabel"+$(this).val();
			var sumtotalprint = 0;
		
			sumtotalprint = parseInt($("#totalPrint").html().replace(/,/g, ""))-parseInt($(price).html().replace(/,/g, ""))*parseInt($(id).val());
			 // 모든 상품 총가격 표시하는 친구
			if($(id).val()>1){	
				$(id).val(parseInt($(id).val())-1)
				$(totalprice).html((parseInt($(price).html().replace(/,/g, ""))*parseInt($(id).val())).toLocaleString('ko-KR')+"₩");
			}

			sumtotalprint +=parseInt($(totalprice).html().replace(/,/g, ""));
			$("#totalPrint").html(sumtotalprint.toLocaleString('ko-KR')+"₩");
			}
			
			

		})	
		//수량 변경+ // 가격 변경
		$(document).on("click","#plus",function(){
			if($("[name=checkboxNoLabel]")[$(this).val()].checked){
			var id = "#goodsLineAmount"+$(this).val()
			var price = "#price"+$(this).val();
			var totalprice = "#totalprice"+$(this).val();	
			var sumtotalprint = 0;
			
			sumtotalprint = parseInt($("#totalPrint").html().replace(/,/g, ""))-parseInt($(price).html().replace(/,/g, ""))*parseInt($(id).val());
			
			$(id).val(parseInt($(id).val())+1)
			$(totalprice).html((parseInt($(price).html().replace(/,/g, ""))*parseInt($(id).val())).toLocaleString('ko-KR')+"₩");
			
			
			sumtotalprint +=parseInt($(totalprice).html().replace(/,/g, ""));
			$("#totalPrint").html(sumtotalprint.toLocaleString('ko-KR')+"₩");
			}
			
		})
		
		
		$(document).on('click','#checkboxNoLabel',function(){     
			
			var id = "#goodsLineAmount"+$(this).attr("mal")
			var price = "#price"+$(this).attr("mal")
			var totalprice = "#totalprice"+$(this).attr("mal")	
			var sumtotalprint = 0;
			
			if($("[name=checkboxNoLabel]")[$(this).attr("mal")].checked){
				sumtotalprint = parseInt($("#totalPrint").html().replace(/,/g, ""))+parseInt($(price).html().replace(/,/g, ""))*parseInt($(id).val().replace(/,/g, ""));
			}else{
				sumtotalprint = parseInt($("#totalPrint").html().replace(/,/g, ""))-parseInt($(price).html().replace(/,/g, ""))*parseInt($(id).val().replace(/,/g, ""));
			}
			
			$("#totalPrint").html(sumtotalprint.toLocaleString('ko-KR')+"₩");
			
		});
		
		
		
		
		
		
		
		var saveSum ="";
		//전체 선택 해제
		$(document).on('click','#allCheck',function(){
			var sum = $("#totalPrint").html()
			 
			if(sum !="0₩"){
				saveSum =sum;
			}
			
			if($("#allCheck").val()==0){        
				$('.form-check-input').prop('checked',true);
				$("#totalPrint").html(saveSum);
				$("#allCheck").val(1);
				
		    }
			else{        
				$('.form-check-input').prop('checked',false);   
				$("#totalPrint").html("0₩"); 
				$("#allCheck").val(0);
			} 
		});
		
		
		//선택된거 삭제
		$(document).on('click','#pointDelete',function(){ 
			var selectLength =$("[name=checkboxNoLabel]").length;
			//alert(selectLength);
			deleteBox = [];
			for (var i=0; i<selectLength; i++) {
					if ($("[name=checkboxNoLabel]")[i].checked == true) {
					deleteBox.push($("[name=checkboxNoLabel]")[i].value); 
				}
			}
			
			CheckDelete(deleteBox);
		})

		//선택된거 주문페이지로 가게하는 함수
		$(document).on('click','#cartOrder',function(){ 
			var selectLength =$("[name=checkboxNoLabel]").length;
			//alert(selectLength);
			orderBox = [];
			for (var i=0; i<selectLength; i++) {
					
					if ($("[name=checkboxNoLabel]")[i].checked == true) {
					orderBox.push($("[name=checkboxNoLabel]")[i].value);
					countBox.push($("#goodsLineAmount"+i).val());
				}
			}
			
			$("#cartId").val(orderBox);
			$("#countCart").val(countBox);
			
			$("#cartForm").submit();
			//CheckOrder(orderBox,countBox);
		})
		
		
		
		
		//장바구니 뿌려주는
		function selectAll(){
			
			$.ajax({
				url:"${pageContext.request.contextPath}/cart/select", //서버요청주소
				type:"post", // 요청방식(get, post)
				//traditional: true,
				dataType:"json",//서버가 응답해주는 데이터타입(text,html,xml,json)
				//data:"${_csrf.parameterName}=${_csrf.token}",//서버에게 보낼 parameter정보
				data: { '${_csrf.parameterName}' : '${_csrf.token}' },
				success: function(result){
					
						var data="";
						var sumtotal = 0;
					$.each(result.goods, function(index, item){
						var price2 = item.goodsPrice.toLocaleString('ko-KR')+"₩";
						var no = `${'${result.cart[index].cartAmount}'}`;
						var price = `${'${item.goodsPrice}'}`;
						var total = no*price;
						var resulttotal=total.toLocaleString('ko-KR')+"₩";
						
						data+=`<tr class='table_row'><td class='column-1'>`;
						data+=`<input class='form-check-input' type='checkbox' id='checkboxNoLabel' mal=${"${index}"} name='checkboxNoLabel' checked value=${"${result.cart[index].cartId}"}>`;
						data+=`<div class='how-itemcart1'><img src='../img/bottom_logo.png' alt='IMG'></div>`;
						data+=`</td>`;
						data+=`<td class='column-2'>${'${item.goodsName}'}</td>`;	
						data+=`<td class='column-3'><span id='price${"${index}"}'>${'${price2}'}</span></td>`;		
						data+=`<td class='column-6'>${'${result.goodsLine[index].goodsLineDate}'}<input type='hidden' name='goodsLineDate'/></td>`;	
						data+=`<td class='column-4'>`;
						data+=`<div class='wrap-num-product flex-w m-l-auto m-r-0'>`;
						data+=`<button type='button' id='minus' value=${"${index}"}>`;
						data+=`<div class='btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m'>`;
						data+=`<i class='fs-16 zmdi zmdi-minus'></i></div></button>`;
						data+=`<input class='mtext-104 cl3 txt-center num-product' min='0' type='number' id='goodsLineAmount${"${index}"}' value=${'${result.cart[index].cartAmount}'}>`;	
						data+=`<button type='button' id='plus' value=${"${index}"}>`;		
						data+=`<div class='btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m' >`;		
						data+=`<i class='fs-16 zmdi zmdi-plus'></i></div></button></div></td>`;		
						data+=`<td class='column-5'><span id='totalprice${"${index}"}'>${'${resulttotal}'}</span></td></tr>`;	
						sumtotal +=total;
					})
					$("#cartTable tr:gt(0)").remove();
					$("#cartTable tr:eq(0)").after(data);
					
					//총가격
				
					//parseInt(xxxx.replace(/,/g , ''));
					
					$("#totalPrint").html(sumtotal.toLocaleString('ko-KR')+"₩")
						

				},
				error: function(err){
					alert(err);
				}	
			});//ajax
		}//selectAll
		
		//삭제하는 함수
		function CheckDelete(box){
			$.ajax({
				url:"${pageContext.request.contextPath}/cart/cartDelete", //서버요청주소
				type:"post", // 요청방식(get, post)
				traditional: true,
				dataType:"text",//서버가 응답해주는 데이터타입(text,html,xml,json)
				//data:"${_csrf.parameterName}=${_csrf.token}",//서버에게 보낼 parameter정보
				data: { '${_csrf.parameterName}' : '${_csrf.token}',deleteBox : box},
				success: function(result){
					selectAll();
				},
				error: function(err){
					alert("delete 오류");
				}	
			});//ajax
		}
		
		
		$("#kakao").click(function(){
			
			$.ajax({
				url:"${pageContext.request.contextPath}/order/kakao", //서버요청주소
				type:"post", // 요청방식(get, post)
				dataType:"json",//서버가 응답해주는 데이터타입(text,html,xml,json)
				//data:"${_csrf.parameterName}=${_csrf.token}",//서버에게 보낼 parameter정보
				data: { '${_csrf.parameterName}' : '${_csrf.token}'},
				success: function(result){
					//alert(result.tid)
					var box =result.next_redirect_pc_url;
					window.open(box);
				},
				error: function(err){
					alert("카카오 오류");
				}	
			});//ajax
		})
		
		

		selectAll();
	});//jquery
	
	
	</script>
<body >
<!-- Shoping Cart -->
	<form method="post" class="bg0 p-t-75 p-b-85" id="cartForm" action="${pageContext.request.contextPath}/cart/cartOrder">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
					<div class="m-l-25 m-r--38 m-lr-0-xl">
					
						<div >
							<div class="flex-w flex-m m-r-20 m-tb-5">
								<div class="flex-c-m stext-101 cl0 size-118 bg3 bor14 hov-btn3 p-lr-15 trans-04 m-r-10 pointer m-tb-5">
									<button type="button" id="allCheck" value='1'>전체선택</button>
								</div>	
									
								<div class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5">
									<button type="button" id="pointDelete">선택한 상품 삭제</button>
								</div>
							</div>	
						</div>
						
						<div class="wrap-table-shopping-cart">
							<table class="table-shopping-cart" id="cartTable">
								<tr class="table_head">
									<th class="column-1">Product</th>
									<th class="column-2"></th>
									<th class="column-3">Price</th>
									<th class="column-6">Date</th>
									<th class="column-4">Quantity</th>
									<th class="column-5">Total</th>
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
								<span class="mtext-110 cl2" id ="totalPrint">
									
								</span>
							</div>
						</div>

						<button type="button" class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer" id="cartOrder">
							결재 하기
						</button>
					</div>
				</div>
			</div>
		</div>
	
		<input type="hidden" name="cartId" id="cartId">
		<input type="hidden" name="countCart" id="countCart">
	</form>

	
	
	<input type="hidden" id="sumtotalcheck" value = "1">
	<input type="hidden" id="sumtotalcount" value ="1">
</body>
	
</html>