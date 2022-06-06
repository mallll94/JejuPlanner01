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
	
<script type = "text/javascript" src = "http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDAQyf0XE4ptqpDNkKhiwyhT5MJpSrvpd8&callback=initMap&map_ids=a0f291588508440c&region=KR"></script>
<script type="text/javascript">
	var mymap;
	var markers=[];
	var line;
	var targets=[];

	$(function(){
		
		alert("${param.plannerId}")
		$(document).on("change","#days", function(){
			
			selectAll($(this).val());
		});
		
		/////이름수정 모달//일정수정
		$("#option").change(function(){
			if($(this).val()=="placeName"){
				// console.log("Ddd",${param.plannerId});
				$('#NameUpdateModal').modal('show');
			}else if($(this).val()=="dateUpdate"){
					
				 $("#UpdateModalForm").attr("action", "${pageContext.request.contextPath}/planner/plannerWrite");//${plannerId}
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
			if($("#shareSelect").val()=="kakao"){
				
			}else if($("#shareSelect").val()=="pdf"){
				pdfPrint();
			}else{
				$("#ShareModalForm").attr("action", "${pageContext.request.contextPath}/planner/plannerShareBoard");
				$("#ShareModalForm").submit();
			}
			
			
			
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

					
					//마커를 지우고 다시찍자 
					//deleteLine(targets);
					deleteMarkers();
					removeRoute();
					
					
					console.log("after",line);
					//deleteLine();
					targets =[];
					////////////////////
					for(let v =0;v<result.place.length;v++){		
						targets.push(new google.maps.LatLng(result.place[v].placeLatitude, result.place[v].placeLongitude))
					}
					addMarker(targets);	
					addLine(targets,getLineColor);		
					
					
					console.log("before",line);
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
		
		function pdfPrint(){
			 // pdf저장 button id	
			    html2canvas($('#pdfDiv')[0]).then(function(canvas) { //저장 영역 div id
				
			    // 캔버스를 이미지로 변환
			    var imgData = canvas.toDataURL('image/png');
				     
			    var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
			    var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
			    var imgHeight = canvas.height * imgWidth / canvas.width;
			    var heightLeft = imgHeight;
			    var margin = 10; // 출력 페이지 여백설정
			    var doc = new jsPDF('p', 'mm');
			    var position = 0;
			       
			    // 첫 페이지 출력
			    doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
			    heightLeft -= pageHeight;
			         
			    // 한 페이지 이상일 경우 루프 돌면서 출력
			    while (heightLeft >= 20) {
			        position = heightLeft - imgHeight;
			        doc.addPage();
			        doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
			        heightLeft -= pageHeight;
			    }
			 
			    // 파일 저장
			    doc.save('file-name.pdf');

				  
				});

		}
	})
//////////////////////////////////////////

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
	//지도생성
	function initMap(){
		const mapDiv= document.getElementById("googleMap");
		mymap = new google.maps.Map(mapDiv,{
			center:new google.maps.LatLng(33.3893, 126.5362),
			zoom:11,
			mapId: "a0f291588508440c",
			streetViewControl: false
		})	
	};
	

	//마커표시
	function addMarker(targets){
		for(let i=0;i<targets.length;i++){
			var position = targets[i];
			//alert(position)
			let marker = new google.maps.Marker({
			position: position,
			map: mymap,
			//animation: google.maps.Animation.Drop
			})
			//마커 배열 저장
			markers.push(marker);
		}
	}
	//선 폴리선 생성
	function addLine(targets,lineColor){ 
		
	    line = new google.maps.Polyline({
	      path : targets,
	      geodesic:true,
	      strokeColor: lineColor,
	      strokeOpacity:1.0,
	      strokeWeight:3
	    })
	    
	    line.setMap(mymap); 
	}

	//마커삭제
	function deleteMarkers() {
		   for (var i = 0; i < markers.length; i++) {
		     markers[i].setMap(null);
		   }
	}
	
	function removeRoute(){
		 if(typeof line !== 'undefined'){
		  line.setMap(null);
		 }
	}
/////////////////////////////////////////////////////////////////////	

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
				<select id="days"></select>
			</div>
		</div>
	</div>
	<div id="googleMap" style="width: 100%;height: 600px;"></div>
	<div id="pdfDiv">
	<div class="latest-news mt-100 mb-150">
		<div class="container" id="card">
	
		</div>
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
                        	<input type="hidden" id="placeId" class="form-control placeId-mask" name="plannerId" value="${param.plannerId}"/>
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
      <form method="post" id="ShareModalForm" action="${pageContext.request.contextPath}/planner/PlannerShareBoard">	
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
                 	<select id="shareSelect" name="shareSelect">
                 		<option value="kakao">카카오톡공유</option>
                 		<option value="pdf">pdf 출력</option>
                 		<option value="board">게시물 공유</option>       	
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
	