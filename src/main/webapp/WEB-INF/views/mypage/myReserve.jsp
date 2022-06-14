<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900&display=swap"
        rel="stylesheet">

	<!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myReserve/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/myReserve/font-awesome.min.css" type="text/css">
    <%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myReserve/elegant-icons.css" type="text/css"> --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myReserve/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myReserve/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myReserve/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myReserve/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myReserve/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myReserve/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myReserve/style.css" type="text/css">
    
    <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath}/js/myReserve/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/myReserve/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/myReserve/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/myReserve/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/myReserve/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/js/myReserve/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/myReserve/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/myReserve/main.js"></script>
    <style type="text/css">
    
	    .search-btn {
		width: 100%;
		font-size: 16px;
		height: 25px;
		background: #fe9f29;
		color: #ffffff;
		border: none;
		border: 1px solid #fe9f29;
		border-radius: 0.3rem;
		cursor: pointer;
		}
    </style>
<script type="text/javascript">

$(function(){
	
	function selctAll(){
		
		
		$.ajax({
			url: "${pageContext.request.contextPath}/user/reserveAll",
			type: "post",
			dataType: "json",
			data: { '${_csrf.parameterName}' : '${_csrf.token}' },
			success: function(result){
					//alert(result)
				
				
				$.each(result,function(index,item){
					
					$.each(item.ordersLineList,function(index,last){
						
						console.log(last.goodsLine.goods.goodsName)
					})
					
				})
				
			},
			error: function(error){
				alert("장소 정보를 불러오지 못했습니다.")
			}
		})
		
		
	}
	selctAll();
	
	
})
</script>    
    

<title>나의 예약 페이지</title>
</head>
<body>
	<section class="property-section spad">
        <div class="container">
            <div class="row">
                
                <div class="col-lg-9">
                    <h4 class="property-title">Property</h4>
                    <div class="property-list">
                    <h5 class="property-title mb-3">2022년 6월 20일</h5>
                        <div class="single-property-item">
                        
                            <div class="row">
                                <div class="col-md-2">
                                    <div class="property-pic">
                                        <img src="${pageContext.request.contextPath}/img/place/7dbf3d3f-efa4-430d-a05f-8b5598631638Do.jpg" alt="상품사진">
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <div class="property-text">
                                        <div class="s-text">예약 확정</div>
                                        <h5 class="r-title">상품명</h5>
                                        <div class="room-price">
                                            <span>가격</span>
                                            <h5>$3.000.000</h5>
                                        </div>
                                        <div class="properties-location"><i class="icon_pin"></i>주소</div>
                                        <p>상품내용 </p>
                                    </div>
                                </div>
                                <div class="col-lg-3">
               						<button type="submit" class="search-btn mb-4">상품 보기</button>
                					<button type="submit" class="search-btn mb-4">1대1 문의</button>
                					<button type="submit" class="search-btn mb-4">예약 취소</button>
                				</div>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </section>
</body>
</html>