<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <title>maptest</title>
        <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
	
        <style>
        #boxes{
            display: flex;
            flex-direction: row;
            justify-content: center;
            height: 100%;
        }
        #leftbox{
            flex-basis: 260px;
            flex-shrink: 0;
            background-color: gold;
            overflow: hidden;
            height: 100%;
            order: 0;
        }
        /* Always set the map height explicitly to define the size of the div
        * element that contains the map. */
        #map {
           flex-basis: 100%;
           height: 600px;
           order: 1;
        }
        #rightbox{
            flex-basis: 260px;
            flex-shrink: 0;
            background-color: darkslategray;
            overflow: hidden;
            height: 100%;
            order: 2;
        }
        /* Optional: Makes the sample page fill the window. */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
        </style>
        <script>
            var markers =[];
            //위치 위도 경도
            var targets =[
            { lat: 33.4582 ,lng: 126.9425 },
            { lat: 33.4351 ,lng: 126.9231 },
            { lat: 33.4242 ,lng: 126.9311 }
            ];
            var mymap;
        
            function initMap() {  
              const mapDiv= document.getElementById("map");
              mymap = new google.maps.Map(mapDiv,{
                center: targets[0],
                zoom: 13,
                mapId: "a0f291588508440c",
                streetViewControl: false
              })
        
              //마커표시
              /*
              for(let i=0;i<targets.length;i++){
                var position = targets[i];
                alert(position)
                let marker = new google.maps.Marker({
                    position: position,
                    map: mymap,
                  //animation: google.maps.Animation.Drop
                })
                //마커 배열 저장
                markers.push(marker);
              }
              
              
              //선잇기
              var line = new google.maps.Polyline({
                path : targets,
                geodesic:true,
                strokeColor: "#ff841f",
                strokeOpacity:1.0,
                strokeWeight:5
              })
              line.setMap(mymap);
              */
              addMarker(targets);
              addLine(targets);
            }
        
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
        
            //선잇기
            function addLine(targets){
              var line = new google.maps.Polyline({
                path : targets,
                geodesic:true,
                strokeColor: "#ff841f",
                strokeOpacity:1.0,
                strokeWeight:5
              })
              line.setMap(mymap);
            }
        

          </script>
          <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDAQyf0XE4ptqpDNkKhiwyhT5MJpSrvpd8&callback=initMap&map_ids=a0f291588508440c&region=KR"></script>
          
	</head>
	<body>
        <div id="boxes">
            <div id="leftbox">dfdf</div>
            <div id="map"></div>
            <div id="rightbox">afdadf</div>
        </div>
          
          
	</body>
</html>