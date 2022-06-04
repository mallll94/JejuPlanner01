<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- favicon -->
	
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
	
	
	<!-- bootstrap -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/planner2/bootstrap.min.css">
	<!-- owl carousel -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/planner2/owl.carousel.css">
	<!-- magnific popup -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/planner2/magnific-popup.css">
	<!-- animate css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/planner2/animate.css">
	<!-- mean menu css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/planner2/meanmenu.min.css">
	<!-- main style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/planner2/main.css">
	<!-- responsive -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/planner2/responsive.css">
	
	
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
	<!-- bootstrap -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<!-- count down -->
	<script src="${pageContext.request.contextPath}/js/planner2/jquery.countdown.js"></script>
	<!-- isotope -->
	<script src="${pageContext.request.contextPath}/js/planner2/jquery.isotope-3.0.6.min.js"></script>
	<!-- waypoints -->

	<!-- owl carousel -->
	<script src="${pageContext.request.contextPath}/js/planner2/owl.carousel.min.js"></script>
	<!-- magnific popup -->
	<script src="${pageContext.request.contextPath}/js/planner2/jquery.magnific-popup.min.js"></script>
	<!-- mean menu -->
	<script src="${pageContext.request.contextPath}/js/planner2/jquery.meanmenu.min.js"></script>
	<!-- sticker js -->
	<script src="${pageContext.request.contextPath}/js/planner2/sticker.js"></script>
	<!-- main js -->
	<script src="${pageContext.request.contextPath}/js/planner2/main.js"></script>
	

<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDAQyf0XE4ptqpDNkKhiwyhT5MJpSrvpd8&callback=myMap&map_ids=a0f291588508440c&libraries=places&region=kr"></script>
<script type="text/javascript">
	var map;
	
	var box1=[];
	var box2=[];
	var box3=[];
	var box4=[];
	var box5=[];
	var box6=[];
	var box7=[];
	var box8=[];
	function getColor(place,plannerPlace){
		if(place.placeCategory =='장소'){
			if(plannerPlace.plannerPlaceDate==1){
				return 'skyblue';
			}else if(plannerPlace.plannerPlaceDate==2){
				return 'pink'
			}else if(plannerPlace.plannerPlaceDate==3){
				return 'yellow'
			}else if(plannerPlace.plannerPlaceDate==4){
				return 'red'
			}else if(plannerPlace.plannerPlaceDate==5){
				return 'green'
			}	
		}else{
			return 'black';
		}
		
	}
	
	function getLineColor(day){	
			if(day==1){
				return "#00C3FF";
			}else if(day==2){
				return "#FFDD00";
			}else if(day==3){
				return "#7C8C91";
			}else if(day==4){
				return "#FF0000";
			}else if(day==5){
				return "#5100FF";
			}else if(day==6){
				return "#FF841F";
			}else if(day==7){
				return "#E9F086";
			}
	}
	
	
	
	
	
	
	function myMap(){//지도생성
		var mapOptions = { 
			center:new google.maps.LatLng(33.3893, 126.5362),
			zoom:11,
			mapId: "a0f291588508440c",
			disableDefaultUI:true,
	        zoomControl: true
		};
		
		map = new google.maps.Map( document.getElementById("map") , mapOptions );
	};
	
	
	function markerLine(data,day){//data = List<PlaceDTO>위도 경도,  숫자 1,2,3,  - > day = List<PlannerPlace>

		
		var addr=[];
		for(var j =0;j<data.length;j++){
			addr[j]=[data[j].placeLatitude , data[j].placeLongitude];
		}
		
		var i;
		var color;
		box1=[];
		box2=[];
		box3=[];
		box4=[];
		box5=[];
		box6=[];
		box7=[];
		box8=[];
		
		//let arr =[[],[],[]];

		
		
		for(i =0;i<data.length;i++){ //List<PlaceDTO> 길만큼 잠
			
			color = getColor(data[i],day[i]);
			var title = data[i].placeName;
		
			var marker = new google.maps.Marker({
				position: new google.maps.LatLng(addr[i][0], addr[i][1]),
				map: map,
				icon:{
					path:google.maps.SymbolPath.CIRCLE,
					strokeWeight:0,
					fillOpacity:1,
					fillColor:color,
					scale:10
				}
			 });
			
			
			google.maps.event.addListener(marker, 'click', (function(marker, title) {
        		return function() {
					infowindow.setContent(title);
          			infowindow.open(map, marker);
        		}
      		})(marker, title));
			
			
			for(let a=1 ; a<=data.length ; a++){
				let b = eval("box"+a);
				
				
				if(day[i].plannerPlaceDate==a){
					b.push(new google.maps.LatLng(addr[i][0], addr[i][1]));	
					break;
				}
				
			}
			 
		};
		
		for(let c=1; c<=data.length ; c++){
			
		    let obj= eval("box"+c);
			addLine(obj , getLineColor(c));
		}
		
		
		
		var infowindow = new google.maps.InfoWindow();
	}
	//선 폴리선 잇는법
	function addLine(targets,lineColor){
		//alert("")
		var line;
	    line = new google.maps.Polyline({
	      path : targets,
	      geodesic:true,
	      strokeColor: lineColor,
	      strokeOpacity:1.0,
	      strokeWeight:3
	    })

	    line.setMap(map);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	$(function(){
		$(document).on("change","#days", function(){
			
			selectAll($(this).val());
		});
		
		/////이름수정 모달//일정수정
		$("#option").change(function(){
			if($(this).val()=="placeName"){
				$('#NameUpdateModal').modal('show');
			}else if($(this).val()=="dateUpdate"){
				 $("#UpdateModalForm").attr("action", "${pageContext.request.contextPath}/planner/plannerWrite/1");//${plannerId}
				 $("#UpdateModalForm").submit();
			}else if($(this).val()=="placeDelete"){
				$('#DeleteModal').modal('show');
			}else if($(this).val()=="share"){
				$('#shareModal').modal('show');
			}
			
		});
		//이름수정
		$("#update").click(function(){
			 $("#UpdateModalForm").attr("action", "${pageContext.request.contextPath}/planner/nameUpdate");
			 $("#UpdateModalForm").submit();	
		})
		
		$("#PlannerDelete").click(function(){	
			 $("#DeleteModalForm").attr("action", "${pageContext.request.contextPath}/planner/plannerDelete");
			 $("#DeleteModalForm").submit();	
		})
		$("#share").click(function(){	 
			 $("#ShareModalForm").submit();	
		})
		

		function selectAll(no){
			$.ajax({
				url: "${pageContext.request.contextPath}/planner/select",
				type: "post",
				dataType: "json",
				data: {plannerId: '1' ,DayPlanner : no},
				success: function(result){
					let card = "";
					var name = result.planner.plannerName;
					var dayNo = result.dayNo;			
					var dayNoLi = "<option value='0'>일정</option>";
					console.log(result.planner.plannerEnd,result.planner.plannerStart)
					var saveDayNo= result.dayNo;
					
					
					
					if(no!=0){
						dayNo=no;
					}
					
					
					
					for(let i=0; i <saveDayNo ;i++){
						dayNoLi+=`<option value=${'${i+1}'}>${'${i+1}'}day</option>`;
					}
					

					
					for(let j=1; j<=dayNo;j++){
						
						card+=`<div class='row row-cols-10' class='list'>`;
						card+=`<h1>${'${j}'}Day</h1>`;
						$.each(result.place, function(index, item){
							
							if(item.day==(j)){
							
							card+=`<div class='col-lg-3 col-md-3'>`;
							card+=`<div class='single-latest-news'>`;
							card+=`<div class='latest-news-bg news-bg-1'>${'${item.placePhoto}'}</div>`;
							card+=`<div class='news-text-box'>`;
							card+=`<h3><a href=''>${'${item.placeName}'}</a></h3><p class='blog-meta'>`;
							card+=`<span class='author'><i class='fas fa-user'></i> ${'${result.planner.plannerType}'}</span>`;
							card+=`<span class='date'><i class='fas fa-calendar'></i> ${'${result.planner.plannerStart}'}</span>`;
							card+=`</p><p class='excerpt'>${'${item.placeAddr}'}</p>`;
							card+=`<a href="" class='read-more-btn'>자세히 보기<i class='fas fa-angle-right'></i></a>`;
							card+=`</div></div></div>`;
							}
							
						})
						card+=`</div>`;
						
					}

					if(no==0){
						markerLine(result.place,result.plannerPlaces);
					}else{
						markerLine(result.place,result.plannerPlaces);
					}
					
					
					$("#days").empty();
					$("#days").append(dayNoLi);
					$("#days").val(no);
					
					$("#name").html(name);
					$("#card").empty();
					$("#card").html(card);
					
					
				},
				error: function(error){
					alert("장소 정보를 불러오지 못했습니다.")
				}
			})
		}
		selectAll(0);
		
	})


</script>

<body>
<div class="container">
	<div class="row">
		<div class="col">
			<span id="name"></span>
			
			<select id="option">
					<option value='none'>관리</option>
					<option value='dateUpdate' >일정 수정</option>
					<option value='placeDelete'>일정 삭제</option>
					<option value='share'>공유하기</option>
					<option value='placeName'>플래너 이름수정</option>
			</select>
			
			
			<select id="days">
					
					
			</select>
		</div>
	</div>
</div>
<div id="map" style="width: 100%;height: 600px;"></div>
<div class="latest-news mt-100 mb-150">
	<div class="container" id="card">

	</div>
</div>





<!-- Modal 이름 수정-->
<div class="modal fade" id="NameUpdateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form method="post" id="UpdateModalForm" action="${pageContext.request.contextPath}/planner/nameUpdate" >	
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">플래너 이름 수정</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        
	 		<div class="col-xxl">
                  <div class="card mb-4">
                    <div class="card-header d-flex align-items-center justify-content-between">
                      <h5 class="mb-0">플래너 이름 수정</h5>
                      <small class="text-muted float-end">Default label</small>
                    </div>
                    <div class="card-body">
                      
                       <div class="row mb-3">
                          <label class="col-sm-4 col-form-label" for="basic-default-name">변경할 이름</label>
                          
                         <div class="col-sm-10">
                        	<input type="hidden" id="placeId" class="form-control placeId-mask" name="plannerId" value="1"/>
                         	<input type="text" id="placeCategory" class="form-control placeCategory-mask" name="plannerName"/>
                          </div>
                       </div>
                    </div>
                  </div>
                </div>

      </div>
      <div class="modal-footer">
        <button id="update" type="button" class="btn btn-primary">수정하기</button>
        <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
      </form>  
    </div>
  </div>
</div>

<!-- Modal 삭제 모달-->
<div class="modal fade" id="DeleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form method="post" id="DeleteModalForm" action="${pageContext.request.contextPath}/planner/plannerDelete" >	
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">플래너 삭제</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        
		<div class="col-xxl">
		  <div class="card mb-4">
		    <div class="card-header d-flex align-items-center justify-content-between">
		      <h5 class="mb-0">플래너 삭제</h5>
		    </div>
		    <div class="card-body">
		      
		       <div class="row mb-3">
		          
		          <h4>정말로 삭제 하시겠습니까??</h4>	          
         		  <div class="col-sm-10">
		        	<input type="hidden" id="plannerId" class="form-control placeId-mask" name="plannerId" value="1"/>
		          </div>
		       </div>
		    </div>
		  </div>
		</div>

      </div>
      <div class="modal-footer">
        <button id="PlannerDelete" type="button" class="btn btn-primary">삭제하기</button>
        <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
      </form>  
    </div>
  </div>
</div>

<!-- Modal 공유 하기 모달-->
<div class="modal fade" id="shareModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form method="post" id="ShareModalForm" action="${pageContext.request.contextPath}/planner/shareUpdate">	
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">플래너 공유하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        
		<div class="col-xxl">
            <div class="card mb-4">
              <div class="card-header d-flex align-items-center justify-content-between">
                <h5 class="mb-0">플래너 이름 수정</h5>
              </div>
              <div class="card-body">
                
                 <div class="row mb-3">
                 	<select id="shareSelect">
                 		<option value="kakao">카카오톡공유</option>
                 		<option value="kakao">pdf 출력</option>
                 		<option value="kakao">게시물 공유</option>       	
                 	</select>
                                   
                   <div class="col-sm-10">
                  	<input type="hidden" id="placeId" class="form-control placeId-mask" name="plannerId" value="1"/>
                    </div>
                 </div>
              </div>
            </div>
          </div>

      </div>
      <div class="modal-footer">
        <button id="share" type="button" class="btn btn-primary">공유하기</button>
        <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
      </form>  
    </div>
  </div>
</div>





	
	
</body>

</html>