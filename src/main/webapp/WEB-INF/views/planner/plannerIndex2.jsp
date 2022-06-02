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
var box = [];
var markerbox =[];
function myMap(){
	var marker,i;
	
	var addr = [[33.4518,126.4417],
				[33.4638,126.4754],
				[33.4738,126.4954]];
	
	
	var mapOptions = { 
		center:new google.maps.LatLng(33.3893, 126.5362),
		zoom:11,
		mapId: "a0f291588508440c",
		disableDefaultUI:true,
        zoomControl: true
	};
	
	
	var infowindow = new google.maps.InfoWindow();
	
	map = new google.maps.Map( document.getElementById("map") , mapOptions );
	
	
	
	for(i =0;i<addr.length;i++){
		
		box.push(new google.maps.LatLng(addr[i][0], addr[i][1]));
		
		var marker = new google.maps.Marker({
			position: new google.maps.LatLng(addr[i][0], addr[i][1]),
			map: map
		 });
		
		google.maps.event.addListener(marker, 'click', (function(marker, i) {
    		return function() {
				infowindow.setContent(i+"제발되라");
      			infowindow.open(map, marker);
    		}
  		})(marker, i));	
	};
	
	
	//선 폴리선 잇는법
	var line= new google.maps.Polyline({
	    path: box,
	    geodesic: true,
	    strokeColor: '#FF0000',
	    strokeOpacity: 1.0,
	    strokeWeight: 2
	});
	line.setMap(map);

	box.push(location); //선으로 이을 박스 생성
};
	$(function(){
		
		function selectAll(){
			$.ajax({
				url: "${pageContext.request.contextPath}/planner/select",
				type: "post",
				dataType: "json",
				data: {placeId: "1"},
				success: function(result){
					alert(1);
					
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
			<span>플래너 이름</span>
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