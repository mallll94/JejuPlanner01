<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDAQyf0XE4ptqpDNkKhiwyhT5MJpSrvpd8&callback&callback=myMap&map_ids=a0f291588508440c&libraries=places&region=kr"></script>
<script type="text/javascript">
	var map;

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
		var infowindow = new google.maps.InfoWindow();	
		map = new google.maps.Map( document.getElementById("map") , mapOptions );
	};
	function markerLine(data,day){
		
		var addr=[];
		for(var j =0;j<data.length;j++){
			addr[j]=[data[j].placeLatitude,data[j].placeLongitude];
		}
		
		var i;
		var color;
		var box1=[];
		var box2=[];
		var box3=[];
		var box4=[];
		var box5=[];
		var box6=[];
		var box7=[];
		var box8=[];
		//var box9=[];
		//var box10=[];
		
		
		for(i =0;i<data.length;i++){
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
			var infowindow = new google.maps.InfoWindow();
			google.maps.event.addListener(marker, 'click', (function(marker, title) {
        		return function() {
					infowindow.setContent(title);
          			infowindow.open(map, marker);
        		}
      		})(marker, title));
				
	  		
	  		
			if(day[i].plannerPlaceDate==1){	
				box1.push(new google.maps.LatLng(addr[i][0], addr[i][1]));		
			}else if(day[i].plannerPlaceDate==2){		
				box2.push(new google.maps.LatLng(addr[i][0], addr[i][1]));
				
			}else if(day[i].plannerPlaceDate==3){
				
				box3.push(new google.maps.LatLng(addr[i][0], addr[i][1]));
				
			}else if(day[i].plannerPlaceDate==4){
				
				box4.push(new google.maps.LatLng(addr[i][0], addr[i][1]));
				
			}else if(day[i].plannerPlaceDate==5){
				
				box5.push(new google.maps.LatLng(addr[i][0], addr[i][1]));
				
			}else if(day[i].plannerPlaceDate==6){
				
				box6.push(new google.maps.LatLng(addr[i][0], addr[i][1]));
				
			}else if(day[i].plannerPlaceDate==7){		
				box7.push(new google.maps.LatLng(addr[i][0], addr[i][1]));
			}else{	
				box8.push(new google.maps.LatLng(addr[i][0], addr[i][1]));
			} 
			
		};
		
		addLine(box1,getLineColor(1));
		addLine(box2,getLineColor(2));
		addLine(box3,getLineColor(3));
		addLine(box4,getLineColor(4));
		addLine(box5,getLineColor(5));
		addLine(box6,getLineColor(6));
		addLine(box7,getLineColor(7));
		addLine(box8,getLineColor(8));
		
		
		
	}
	//선 폴리선 잇는법
	function addLine(targets,lineColor){
	    var line = new google.maps.Polyline({
	      path : targets,
	      geodesic:true,
	      strokeColor: lineColor,
	      strokeOpacity:1.0,
	      strokeWeight:3
	    })
	    line.setMap(map);
	}







	$(function(){

		function selectAll(){
			$.ajax({
				url: "${pageContext.request.contextPath}/planner/select",
				type: "post",
				dataType: "json",
				data: {placeId: "1"},
				success: function(result){
					//alert(result.plannerPlaces[3].plannerPlaceDate)
					var name = result.planner.plannerName;
					var dayNo = result.dayNo;
					
					
					var dayNoLi = "";
					for(let i=0; i < dayNo;i++){
						dayNoLi+=`<option value=${'${i}'}>${'${i+1}'}day</option>`;
					}
					
					$.each(result.plannerPlaces, function(index, item){
						
						
					})
					
					markerLine(result.place,result.plannerPlaces);
					
					
					
					
					
					$("#li").append(dayNoLi);
					$("#name").html(name);
					
				},
				error: function(error){
					alert("장소 정보를 불러오지 못했습니다.")
				}
			})
		}
		selectAll();
		
	})


</script>
<body>
<div class="container">
	<div class="row">
		<div class="col">
			<span id="name"></span>
			<select id="">
					<option value='none'>관리</option>
					<option value='dateUpdate'>일정 수정</option>
					<option value='placeSave'>일정 삭제</option>
					<option value='placeId'>공유하기</option>
					<option value='placeName'>플래너 이름수정</option>
			</select>
			<select id="li">
					<option value='none'>일정</option>
					
			</select>
		</div>
	</div>
</div>
<div id="map" style="width: 100%;height: 600px;"></div>
<div id="test"></div>
</body>
</html>