<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

<script async defer src="https://maps.googleapis.com/maps/api/js?key=key&callback=myMap&libraries=places&region=kr"></script>
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
			zoom:10,
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
		
		
		
		//google.maps.event.addListener(map, 'click', function(event) {
			//placeMarker(event.latLng,map);
			
		//});
	}
	
	
	
	function placeMarker(location,map){
		var latPosition = location.lat();
		var lngPosition = location.lng();
		document.getElementById("lat").value=latPosition;//위도 찍기
		document.getElementById("lng").value=lngPosition;//경도 찍기
		
		var content = "<div style ='width:200px; height:100px'>위도 : "+latPosition+"<br/> 경도 "+lngPosition+"</div>";

		//말풍성 크기및 사이즈 생성
		var infowindow = new google.maps.InfoWindow({
			content: content,
			size: new google.maps.Size(200,100)
		});

		var marker = new google.maps.Marker({
		    position: location,
		    map: map
		  });
		
		//마커 클릭시 말풍선 생성
		google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(map, marker);
		});
		
		//box.push(location); //선으로 이을 박스 생성
		
		//선 폴리선 잇는법
		/*
		var line= new google.maps.Polyline({
		    path: box,
		    geodesic: true,
		    strokeColor: '#FF0000',
		    strokeOpacity: 1.0,
		    strokeWeight: 2
		});
		line.setMap(map);
		*/
	}
	
</script>
</head>
<body>
<div>구글맵 위도 : <input type="text" value="" id=lat size="50px"> </div>
<div>구글맵 경도 : <input type="text" value="" id=lng size="50px"> </div>
<div id="map" style="width: 100%;height: 700px;"></div>
</body>
</html>