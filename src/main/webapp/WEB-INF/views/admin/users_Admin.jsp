<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

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
    	  
          google.charts.load('current', {'packages':['corechart']});
          google.charts.setOnLoadCallback(drawChart);

          function drawChart() {
            var data = google.visualization.arrayToDataTable([
              ['Year', 'Sales', 'Expenses'],
              ['2004',  1000,      400],
              ['2005',  1170,      460],
              ['2006',  660,       1120],
              ['2007',  1030,      540]
            ]);

            var options = {
              title: 'Company Performance',
              curveType: 'function',
              legend: { position: 'bottom' },
              chartArea :{width:'100%',height:'90%'}
            };

            var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

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
		
  		function selectAll(paramNowPage){ //전,	
  			if(paramNowPage == "undefined" || paramNowPage=="" || paramNowPage==null){
  				paramNowPage=1;
  			}
  			
  			$.ajax({
  					url:"${pageContext.request.contextPath}/admin/userAdmin", //서버요청주소
  					type:"post", // 요청방식(get, post)
  					dataType:"json",//서버가 응답해주는 데이터타입(text,html,xml,json)
  					data: {filter :$("#li").val(),name : $("#name").val(), nowPage :paramNowPage},//서버에게 보낼 parameter정보
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
  							data+="<td>"+index+1+"</td>";
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
                                    <p class="total_no">2500</p>
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
                                    <p class="total_no">123.50</p>
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
                                    <p class="total_no">1,805</p>
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
                                    <h2>Extra Area Chart</h2>
                                 </div>
                              </div>
                              <div class="full graph_revenue">
                                 <div class="row">
                                    <div class="col-md-12">
                                       <div class="content">
                                          <div class="area_chart">
                                             <div class="row" id="curve_chart">
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