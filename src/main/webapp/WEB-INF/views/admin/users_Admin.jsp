<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>Pluto - Responsive Bootstrap Admin Panel Templates</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
       <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/css/bootstrap.min.css" />
		<!-- site css -->
		<style type="text/css">
		
		
		
		</style>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/css/style.css" />
		<!-- responsive css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/css/responsive.css" />
		<!-- color css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/css/color_2.css" />
		<!-- select bootstrap -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/css/bootstrap-select.css" />
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      $(function(){
			var box1;
   	 		var box2;
    	 	var box3;
    	  	var box4;
    	  	
    	  

          function drawBasic() {
        	 
        	  var data = google.visualization.arrayToDataTable([
        	        ['카테고리', '매출',],
        	        ['대여', box1],
        	        ['액티비티', box3],
        	        ['입장권', box2],
        	        ['스파/힐링', box4]

        	      ]);

        	      var options = {
        	        title: 'Population of Largest U.S. Cities',
        	        chartArea: {width: '80%'},
        	        hAxis: {
        	          title: '총매출',
        	          minValue: 0
        	        },
        	        vAxis: {
        	          title: '카테고리'
        	        }
        	      };
        	      
        	      var chart = new google.visualization.BarChart(document.getElementById('chart_div'));

        	      chart.draw(data, options);
          }
          
          $(document).on("click","#nowPage", function(){
	  			if($(this).text() == "NEXT"){
	  				selectAll($("#NextPage").val())
	  			}else if($(this).text() == "PREV"){
	  				selectAll($("#PrevPage").val())
	  			}else{
	  				selectAll($(this).text())
	  			}
  			});
          
          $(document).on("click","#nowPage1", function(){
	   			if($(this).text() == "NEXT"){
	   				orderAll($("#NextPage1").val())
	   			}else if($(this).text() == "PREV"){
	   				orderAll($("#PrevPage1").val())
	   			}else{
	   				orderAll($(this).text())
	   			}
   			});
          
          
          $("#li").change(function(){
        	  
        	  if($(this).val()=='user'){
        		 
        		  $("#typehi").val(0);
        		  selectAll();
        		  
        	  }else{
        		 
        		  $("#typehi").val(1);
        		  orderAll();
        	  }
        	  
        	  
          })
          
        
        	function selectAll(paramNowPage){ //전,	
      			if(paramNowPage == "undefined" || paramNowPage=="" || paramNowPage==null){
      				paramNowPage=1;
      			}
      			
      			$.ajax({
      					url:"${pageContext.request.contextPath}/admin/userAdmin", //서버요청주소
      					type:"post", // 요청방식(get, post)
      					dataType:"json",//서버가 응답해주는 데이터타입(text,html,xml,json)
      					data: {'${_csrf.parameterName}' : '${_csrf.token}' ,name : $("#name").val(), nowPage :paramNowPage},//서버에게 보낼 parameter정보
      					success: function(result){
      						
      						var paging ="";
      						var data = "<table class='table' >";
      						data+="<tr>";
      						data+="<td>번호</td>";
      						data+="<td>아이디</td>";
      						data+="<td>이름</td>";
      						data+="<td>이메일</td>";
      						data+="<td>핸드폰</td>";
      						data+="<td>탈퇴여부</td>";
      						data+="</tr>";
      						$.each(result.pageList.content, function(index, item){
      						
      						 	data+="<tr>";
      							data+="<td>"+(index+1)+"</td>";
      							data+="<td>"+item.userId+"</td>";
      							data+="<td>"+item.userName+"</td>";
      							data+="<td>"+item.userEmail+"</td>";
      							data+="<td>"+item.userPhone+"</td>";
      							data+="<td>"+item.userState+"</td>";
      							data+="</tr>";
      							 
      						})
      						data+="</table>";
      						
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
      						$("#table").html(data);
      						
      					},
      					error: function(err){
      						alert(err);
      					}	
      			});//ajax
      		};
       
        	//주문관리
      		function orderAll(paramNowPage){ //전,	
      			if(paramNowPage == "undefined" || paramNowPage=="" || paramNowPage==null){
      				paramNowPage=1;
      			}
      			
      			$.ajax({
      					url:"${pageContext.request.contextPath}/admin/orderUserAdmin", //서버요청주소
      					type:"post", // 요청방식(get, post)
      					dataType:"json",//서버가 응답해주는 데이터타입(text,html,xml,json)
      					data: {'${_csrf.parameterName}' : '${_csrf.token}' ,filter :$("#li").val(),name : $("#name").val(), nowPage :paramNowPage},//서버에게 보낼 parameter정보
      					success: function(result){
      						
      						var paging ="";
      						var data = "<table class='table' >";
      						data+="<tr>";
      						data+="<td>번호</td>";
      						
      						data+="<td>주문일</td>";
      						data+="<td>이름</td>";
      						data+="<td>이메일</td>";
      						data+="<td>결제금액</td>";
      						data+="<td>결제방법</td>";
      						data+="</tr>";
      						$.each(result.pageList.content, function(index, item){
      						
      						 	data+="<tr>";
      							data+="<td>"+(index+1)+"</td>";
      							
      							data+="<td>"+item.ordersDate+"</td>";
      							data+="<td>"+item.ordersBookName+"</td>";
      							data+="<td>"+item.ordersBookEmail+"</td>";
      							data+="<td>"+item.ordersPrice+"</td>";
      							data+="<td>"+item.ordersPayment+"</td>";
      							data+="</tr>";
      							 
      						})
      						data+="</table>";
      						
      						if((result.startPage-result.blockCount) > 0){	
      							paging +=`<a class='pagination-newer' href='#' id='nowPage1'>PREV</a>`
      							paging +=`<input type='hidden' id='PrevPage1' value=${'${result.startPage-1}'}>`;
      						}	
      						paging +=`<span class='pagination-inner'>`;
      					    for(let i=result.startPage ; i<=(result.startPage-1)+result.blockCount ;i++ ){
      					    	if((i-1) >= result.totalPages)break
      					    	paging +=`<a class='${i==nowPage?"pagination-active":page}' href='#'  id='nowPage1'>${"${i}"}</a>`;
      					    	
      					    }
      						paging +=`</span>`;
      						if((result.startPage+result.blockCount)<=result.totalPages){	
      							paging +=`<a class='pagination-older' href='#' id='nowPage1'>NEXT</a>`;
      							paging +=`<input type='hidden' id='NextPage1' value=${'${result.startPage+result.blockCount}'}>`;
      						}
      						
      						$("#paging").html("");
      						$("#table").html("");
      						$("#paging").html(paging);
      						$("#table").html(data);
      						
      					},
      					error: function(err){
      						alert(err);
      					}	
      			});//ajax
      		};
      
          
          
          
          
          
  		$("#goodsCategory").change(function(){
  			catagory($(this).val())
  			
  		})
  		
  		var nono = 0;
    	  
  		function catagory(goodsCategory){
  			$.ajax({
					url:"${pageContext.request.contextPath}/admin/totalData", //서버요청주소
					type:"post", // 요청방식(get, post)
					dataType:"json",//서버가 응답해주는 데이터타입(text,html,xml,json)
					data: {'${_csrf.parameterName}' : '${_csrf.token}',goodsCategory: goodsCategory},//서버에게 보낼 parameter정보
					success: function(result){
						var cataSum =result.cataSum;
						var totalSum =result.totalSum;
						var monthSum = result.monthSum;				
						
						$("#cataSum").html("");
						$("#totalSum").html("");
						$("#monthSum").html("");
						$("#cataSum").html(cataSum.toLocaleString('ko-KR')+"₩");
						$("#totalSum").html(totalSum.toLocaleString('ko-KR')+"₩");
						$("#monthSum").html(monthSum.toLocaleString('ko-KR')+"₩");

						box1 =parseInt(result.rentSum);
						box2 =parseInt(result.inSum);
						box3 =parseInt(result.actSum);
						box4 =parseInt(result.spaSum);
						
						if(nono==0){
							
							google.charts.load('current', {packages: ['corechart', 'bar']});
							google.charts.setOnLoadCallback(drawBasic);
							nono=1;
						}
				  		
						
					},
					error: function(err){
						alert(err);
					}	
			});//ajax
  			
  			
  		};
  		
  		
  		
   		 catagory("입장권");
  		
         selectAll();
         
    	  
        
    	  
    	  
    	  
      })
    </script>




   </head>
   <body class="dashboard dashboard_2">
      <div class="full_container">
         <div class="inner_container">
            <div id="content">
               <!-- dashboard inner -->
               <div class="midde_cont">
                  <div class="container-fluid">
                     <div class="row column_title">
                        <div class="col-md-12">
                           <div class="page_title">
                           </div>
                        </div>
                     </div>
                     <div class="row column1">
                        <div class="col-md-6 col-lg-4">
                           <div class="full counter_section margin_bottom_30 yellow_bg">
                              <div class="couter_icon">
                                 <div> 
                                    <i class="fa fa-user"></i>
                                 </div>
                              </div>
                              <div class="counter_no">
                                 <div>
                                    <p class="total_no" id="totalSum"></p>
                                    <p class="head_couter">총판매량</p>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-4">
                           <div class="full counter_section margin_bottom_30 blue1_bg">
                              <div class="couter_icon">
                                 <div> 
                                    <i class="fa fa-clock-o"></i>
                                 </div>
                              </div>
                              <div class="counter_no">
                                 <div>
                                    <p class="total_no" id="monthSum"></p>
                                    <p class="head_couter">월간 판매량</p>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-4">
                           <div class="full counter_section margin_bottom_30 green_bg">
                              <div class="couter_icon">
                                 <div> 
                                    <i class="fa fa-cloud-download"></i>
                                 </div>
                              </div>
                              <div class="counter_no">
                                 <div>
                                    <p class="total_no" id="cataSum"></p>
                                    <p class="head_couter">카테고리별 </p>
                                 </div>
                              </div>
                           </div>
                        </div>
                        
                     </div>
                     
                     <!-- graph -->
                     <div class="row column2 graph margin_bottom_30">
                        <div class="col-md-l2 col-lg-12">
                           <div class="white_shd full">
                              <div class="full graph_head">
                                 <div class="heading1 margin_0">
                                    <h2>
	                                    <select id="goodsCategory">
											<option value='입장권'>입장권</option>
											<option value='액티비티'>액티비티</option>
											<option value='대여'>대여</option>
											<option value='스파/힐링'>스파/힐링</option>
										</select>
									</h2>
                                 </div>
                              </div>
                              <div class="full graph_revenue">
                                 <div class="row">
                                    <div class="col-md-12">
                                       <div class="content">
                                          <div class="area_chart">
                                             <div class="row" id="chart_div">
                                                <div  style="width: 900px; height: 500px"></div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     
                     
                     <!-- 테이블만들기 -->
                     <div class="col-md-12">
			          <div class="white_shd full margin_bottom_30">
			             <div class="full graph_head">
			                <div class="heading1 margin_0">
			                   <h2>회원 관리</h2>
									<select id="li">
										<option value='user'>전체 회원 관리</option>
										<option value='order'>주문 관리</option>
									</select>
			                </div>
			             </div>
			              <form name="requestForm" method="post" id="requestForm">	
				             <div class="table_section padding_infor_info">
				                <div class="table-responsive-sm" id="table">
				                   테이블 장소
				                </div>
				                <div class="row">
					 				<div class="container">
			      						<div class="row">
			          						<div class="col-lg-12 text-center">
												<div class="pagination-wrap" id="paging"> 
					                  
												</div>
					         				</div>
					     				</div>
					  				</div>
								</div>  
				             </div>
				           </form>
			          </div>
			       </div>
                         
					
					<input type="hidden" id="typehi" value="0">
                  </div>
               </div>
               <!-- end dashboard inner -->
            </div>
         </div>
      </div>

      <script src="${pageContext.request.contextPath}/js/adminUser/popper.min.js"></script>
      <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

      <script src="${pageContext.request.contextPath}/js/adminUser/bootstrap-select.js"></script>
      <!-- owl carousel -->

   </body>
</html>