<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료</title>
	<style type="text/css">
	 .orderline{ color: orange;}
	 .badge {background-color: orange;}
	
	</style>	
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
	function selectAll(){
		$.ajax({
			url:"${pageContext.request.contextPath}/order/orderId", //서버요청주소
			type:"post", 
			traditional: true,
			dataType:"json",
			data: { '${_csrf.parameterName}' : '${_csrf.token}'},
			success: function(result){
				var prices = result[0].ordersPrice.toLocaleString('ko-KR')+"₩";
				var data = `<strong>${'${prices}'}</strong>`;
				var dataId = `${'${result[0].ordersId}'}`;
				$("#orderId").html(dataId);
				$("#totalprice").html(data);
			},
			error: function(error){
				alert(error);
				
			}	
		});//ajax
	}
	selectAll();
	
	
})
</script>
</head>
<body class="bg-light">
    
<div class="container">
  <main>
    <div class="py-5 text-center" >
      <img class="d-block mx-auto mb-4" src="/img/successLogo.png" alt="" width="700" height="200">
      <h2>결제가 완료되었습니다.</h2>
      <p class="lead">제주잇다를 이용해주셔서 감사합니다.</p>
    </div>

    <!-- 결제정보 -->
	
    <div class="row g-5 " >
		<div class="col"></div>
		<div class="col">
        <h4 class="d-flex justify-content-between align-items-center mb-3">
			<span class="orderline">결제정보</span>
			
        </h4>
        <ul class="list-group mb-3">
			<li class="list-group-item d-flex justify-content-between lh-sm">
	            <div>
					<h6 class="my-0">주문 번호</h6>
					
	            </div>
            	<span class="text-muted" id="orderId"></span>
			</li>
			<li class="list-group-item d-flex justify-content-between">
				<span><strong>총금액(￦)</strong></span>
				<span id="totalprice"></span>
			</li>
			
		</ul>
		<a href="${pageContext.request.contextPath}/">홈페이지로 돌아가기</a>
		</div>
		<div class="col"></div>
	</div>
	
 
  </main>

  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2022 제주잇다</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="#">1:1문의</a></li>
      <li class="list-inline-item"><a href="#">이용방법</a></li>
      <li class="list-inline-item"><a href="#">제작자</a></li>
    </ul>
  </footer>
</div> 
</body>
</html>