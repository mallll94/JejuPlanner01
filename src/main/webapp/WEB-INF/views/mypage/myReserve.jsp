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
		height: 32px;
		background: #e9ecef;
		color: black;
		border: none;
		
		border-radius: 0.3rem;
		cursor: pointer;
		}
		
		.property-list {
			margin-left: 60px;
			padding-top: 20px;
			padding-left: 20px;
			padding-right: 20px;
			border: 0.5px solid #e9ecef;
		
		}
    </style>
<script type="text/javascript">

$(function(){
	
	$(document).on("click","#nowPage", function(){
		if($(this).text() == "NEXT"){
			selctAll($("#NextPage").val())
		}else if($(this).text() == "PREV"){
			selctAll($("#PrevPage").val())
		}else{
			selctAll($(this).text())
		}
	});
	
	
	function selctAll(paramNowPage){
		$.ajax({
			url: "${pageContext.request.contextPath}/user/reserveAll",
			type: "post",
			dataType: "json",
			data: { '${_csrf.parameterName}' : '${_csrf.token}', nowPage :paramNowPage },
			success: function(result){
				var now = new Date();
				var year = now.getFullYear();
				var month = now.getMonth();
				var date = now.getDate();
				var maxDay = year+"-"+(month+1)+"-"+date;
				
				var test = new Date(maxDay);
				//alert(test)
				var data = "";
				console.log(result);
				$.each(result.goods,function(index,item){//${"${item.goodsPhoto}"}
					var state = "";
					if(result.orderLine[index].orderLineState =="BU"){
						state="사용전";
					}else if(result.orderLine[index].orderLineState =="CU"){
						state="사용완료";
					}else if(result.orderLine[index].orderLineState =="EX"){
						state="기간만료";
					}else if(result.orderLine[index].orderLineState =="RF"){
						state="환불";
					}
					var bookTiem = new Date(result.goodsLine[index].goodsLineDate)
					if(bookTiem< maxDay ){
						state="기간만료";
					}
					console.log(result.orderLine[index]);
					var price =result.orderLine[index].orderLinePrice.toLocaleString('ko-KR')+"₩";
					data+=`<h5 class='property-title mb-3'>${'${result.goodsLine[index].goodsLineDate}'}</h5>`;
					data+=`<div class='single-property-item'>`;
					data+=`<div class='row'>`;
					data+=`<div class='col-md-3'>`;
					data+=`<div class='property-pic'>`;
					data+=`<img src='${pageContext.request.contextPath}/img/place/7dbf3d3f-efa4-430d-a05f-8b5598631638Do.jpg' alt='상품사진'>`;
					data+=`</div></div>`;
					data+=` <div class='col-md-6'>`;
					data+=`<div class='property-text'>`;
					data+=`<div class='s-text'>${"${state}"}</div>`;
					data+=`<h5 class='r-title'>${"${item.goodsName}"}</h5>`;  
					data+=`<div class='room-price'>`;   
					data+=`<span>가격</span>`;
					data+=`<h5>${"${price}"}</h5></div>`;
					data+=`<div class='properties-location'><i class='icon_pin'></i>${"${item.goodsAddr}"}</div>`;
					data+=`<p>${"${item.goodsContent}"}</p></div></div>`;
					data+=`<div class='col-lg-3'>`;
					data+=`<button type='button' class='search-btn mb-4' id='ask' value=''>1대1 문의</button>`;
					
					
					if(result.replyCheck[index] ==0){
						data+=`<button type='button' class='search-btn mb-4' id='reply' value='${"${result.goods[index].goodsId}"}'>후기 작성</button>`;
					}else{
						data+=`<button type='button' class='search-btn mb-4' id='replySelect' value='${"${result.goods[index].goodsId}"}'>후기 보러가기</button>`;
					}
					
					
					
					
					data+=`<button type='button' class='search-btn mb-4' id='cancle' value='${"${result.orderLine[index].orderLineId}"}'>예약 취소</button>`;
					if(state=="환불"){
						data+=`<button type='button' class='search-btn mb-4' id='delete' value='${"${result.orderLine[index].orderLineId}"}'>삭제</button>`;
					}
					data+=`</div></div></div>`;    
				})
				var paging ="";
				if((result.startPage-result.blockCount) > 0){	
					paging +=`<a class='pagination-newer' href='#' id='nowPage'>PREV</a>`
					paging +=`<input type='hidden' id='PrevPage' value=${'${result.startPage-1}'}>`;
				}	
				paging +=`<span class='pagination-inner'>`;
			    for(let i=result.startPage ; i<=(result.startPage-1)+result.blockCount ;i++ ){
			    	if((i-1) >= result.totalPages)break
			    	paging +=`<a class='${i==nowPage?"pagination-active":page}' href='#'  id='nowPage'>${"${i}"}</a>`;
			    	
			    }
				paging +=`</span>`;
				if((result.startPage+result.blockCount)<=result.totalPages){	
					paging +=`<a class='pagination-older' href='#' id='nowPage'>NEXT</a>`;
					paging +=`<input type='hidden' id='NextPage' value=${'${result.startPage+result.blockCount}'}>`;
				}	

				$("#paging").html(paging);
				
				
				
				
				
				
				
				$("#myOrder").html(data);
			},
			error: function(error){
				alert("장소 정보를 불러오지 못했습니다.")
			}
		})
	}
	selctAll();
	//후기작성
	$(document).on("click", "#reply", function(){
		var goodsId = $(this).val();
		location.href = "${pageContext.request.contextPath}/review/mypage/goodsReply_Write/" + goodsId;
	})
	
	//후기 보러가는거
	$(document).on("click", "#replySelect", function(){
		var goodsId = $(this).val();
		location.href = "${pageContext.request.contextPath}/goods/view/goods_View/" + goodsId;
	})
	
	$(document).on("click","#ask",function(){
		
		location.href = "${pageContext.request.contextPath}/board/AskBoard";
		
	})
	
	$(document).on("click","#cancle",function(){
		
		$("[name=orderLineId]").val($(this).val());
		$('#deleteModal').modal('show');
		
	})
	
	$(document).on("click","#delete",function(){
		
		
		$.ajax({
			url: "${pageContext.request.contextPath}/user/deleteOrder",
			type: "post",
			dataType: "text",
			data: { '${_csrf.parameterName}' : '${_csrf.token}',orderLineId : $(this).val() },
			success: function(result){
				selctAll();
			},
			error: function(error){
				alert("장소 정보를 불러오지 못했습니다.")
			}
		})
		
	})
})
</script>    
    

<title>나의 예약 페이지</title>
</head>
<body>
	<section class="property-section spad">
        <div class="container">
            <div class="row">
                
                <div class="col-lg-9">
                    <h4 class="property-title">나의 여행</h4>
                    <div class="property-list" id="myOrder">
   
                    </div>
                </div>
            </div>
        </div>
        
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="pagination-wrap" id="paging"> 
					          
					</div>
				</div>
			</div>
		</div>
		
    </section>
    
    <!-- 예약 취소 모달-->
	<div id="deleteModal" class="modal fade" role="dialog">
           <div class="modal-dialog modal-dialog-centered">
               <!-- Modal content-->
               <div class="modal-content">
                   <div class="modal-header">
                       <h4 class="modal-title" id="NameUpdateModal-Title">예약 취소</h4>
                   </div>
				<form name="deleteForm" method="post" action="${pageContext.request.contextPath}/user/cancleOrder" >
					<div class="modal-body">
						<div class="row">
							<div class="col-lg-12">
								<p id="delete-check-message">정말로 예약을 취소 하시겠습니까?</p>
							</div>
						</div>
						<div class="modal-footer">
							
							<button id="delete-bnt" class='btn btn-default' name="orderLineId" value=""> 확인 </button>
							<button type="button" class="btn btn-default" data-bs-dismiss="modal">취소</button>
						</div>
                       </div>
				</form>
               </div>
           </div>
       </div>
    
    
    
    
</body>
</html>