<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <title>::플래너 작성하기::</title>
        <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
		<!--GoogleMap-->
		<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDAQyf0XE4ptqpDNkKhiwyhT5MJpSrvpd8&callback=initMap&map_ids=a0f291588508440c&region=KR"></script>
		<style>
			div.body-main{
				display: table;
				width:100%;
				height:100%;
			}
			div.jeju-sidebar-left{
				position: absolute;
				width: 25%;
				height:100%;
				left: 0;
				background-color: gainsboro;
				text-align: center;
			}
			div.jeju-sidebar-right{
				position: absolute;
				width: 20%;
				height:100%;
				right: 0;
				background-color: gainsboro;
				text-align: center;
			}
			div.jeju-googleMap{ 
				display: table-cell;
				width: 100%;
				background-color: azure;
			}
			div.sidebar-left-area, div.sidebar-right-area{
				box-sizing: border-box;
				display: inline-block;
			}
			/* Always set the map height explicitly to define the size of the div
			* element that contains the map. */
			#googleMap {
				height: 100%;
			}
			/* Optional: Makes the sample page fill the window. */
			html, body {
				height: 100%;
				margin: 0;
				padding: 0;
			}
			.search-place-keyword{
				float: left;
			}
			input[ class="category-input"]{
				display: none;
			}
			.ul-spot{
				padding: 0px;
				margin: 0px;
			}
			.spot-card{
				padding: 1px;
			}
			.spot-info{
				width: 200px;
				height: 60px;
				border: 1px solid gray;
				margin:2px;
			}
			.spot-info-photo{
				box-sizing: inherit;
				float: left;
				width: 65px;
				height: 100%;
				background-color: antiquewhite;
				
			}
			.spot-info-detail{
				box-sizing: inherit;
				float: left;
				width:100px;
				height: 100%;
				
			}
		</style>
		<script>
			/*googleMap*/
			var markers =[];
			//위치 위도 경도
			var targets =[
			{ lat: 33.4582 ,lng: 126.9425 },
			{ lat: 33.4351 ,lng: 126.9231 },
			{ lat: 33.4242 ,lng: 126.9311 }
			];
			var mymap;

			function initMap() {  
			const mapDiv= document.getElementById("googleMap");
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

			$(function(){
				var targetPlanner='${planner}';

				//기본 플래너 정보 조회
				function getplannerInfo(){
					$.ajax({
						url:"${pageContext.request.contextPath}/planner/selectBy",
						type:"post",
						dataType:"text",
						data:{planner: targetPlanner},
						success: function(result){
							alert(result)
						},
						error: function(result){
							alert("플래너 정보가 없습니다.")
						}
					})
				}


				//오른쪽 사이드바 - 추천장소, 추천숙소 버튼동작
				$("input[class='category-input']").click(function(){
					var category =$(this).val();
					//alert(category)
					$.ajax({
						url: "${pageContext.request.contextPath}/planner/recommend",
						type:"post",
						dataType:"json",
						data:{category: category},
						success: function(result){
							//alert(result)
							let str="";
							$.each(result,function(index,place){
								
								str+="<il class='spot-card'>"
								str+=`<div class="spot-info" id=${'${place.placeId}'}}>`
									str+= `<div class="spot-info-photo"><img src="/place/\${place.placePhoto}" alt="장소상세사진"></div>`
									str+= `<div class="spot-info-detail"><span>\${place.placeName}</span></div>`
								str+=`</div>`
								str+="</il>"
							})
							$("#spotList").html("");
							$("#spotList").append(str);

						},
						error: function(error){
							alert("항목을 불러오지 못했습니다.")
						}
					})
				})

				//오른쪽 사이드바 - 검색하기

				//getplannerInfo();
			})
			
		</script>
		<script>
		$(function() {
			//datepicker 설정
			$.datepicker.setDefaults({
				dateFormat: 'yy-mm-dd',
				prevText: '이전 달',
				nextText: '다음 달',
				monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				dayNames: ['일', '월', '화', '수', '목', '금', '토'],
				dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
				dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
				showMonthAfterYear: true,
				yearSuffix: '년'
			});

			$(".datepicker").datepicker();
		})

		</script>

		

	</head>
	<body>
		<div class="body-main">
			<!-- 메인 구글지도 -->
			<div class="jeju-googleMap">
				<div id="googleMap" class="gmap-write"></div>
			</div>
			<!--LEFT SIDEBAR-->
			<div class="jeju-sidebar-left" id="sidebar-left">
				<div class="sidebar-left-area">
					<!-- 날짜설정 사이드바(좌측상단) -->
					<div class="planner-container">
						<div class="planner-info-wrapper">
							<div class="planner-info-container">
								<c:choose>
									<c:when test="${not empty planner}">
										<div class="planner-name"><span>${planner.plannerName}</span></div>
									</c:when>
									<c:otherwise>
										<div class="planner-name"><span>제주도</span></div>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="planner-calander">
							</div>
						</div>
					</div>
					<!-- 일정설정 사이드바(좌측하단) -->
					<div class="planner-make-plan">

					</div>
				</div>
			</div>

			


			<!--RIGHT SIDEBAR-->
			<div class="jeju-sidebar-right" id="sidebar-right">
				<div class="sidebar-right-area">
					<!--검색어 입력 사이드바(우측상단)-->
					<div class="search-container">
						<div class="search-place-keyword-wrapper">
							<div class="search-place-keyword">
								<input id="searchPlaceKeyWord" type="text" class="keyword-input" placeholder="검색어를 입력하세요" autocomplete="off"/>
								<button class="search-place-button" id="searchPlaceButton" onclick="searchPlaceButton()" type="button">
									<img alt="검색" src="/icon/search.png" class="icon-sidebar-search-place" style="width: 15px; height: inherit;">
								</button>
							</div>
						</div>
						<div class="search-place-category">
							<input class="category-input" id="selected-hotel" type="button" name="searchPlaceCategory" value="숙소" />
							<label class="category-input" for="selected-hotel" >
								<img alt="숙소아이콘" src="/icon/bed.png" class="icon-selected-hotel" style="width: 15px; height: inherit;">
								<span>추천숙소</span>
							</label>
							<input class="category-input" id="selected-place" type="button" name="searchPlaceCategory" value="장소" />
							<label class="category-input" for="selected-place" >
								<img alt="장소아이콘" src="/icon/gps.png" class="icon-selected-place" style="width: 15px; height: inherit;">
								<span>추천장소</span>
							</label>
						</div>
					</div>
					<!--검색장소 목록 사이드바 (우측하단)-->
					<div class="sidebar-spot-wrapper">
						<ul class="ul-spot" id="spotList"></ul>
					</div>
					<!--페이징처리-->
					<div id="pageSearch" class="paging-center">
						<div class="page-search-nav">
							<a id="spot-page-P" href="#" onclick="searchSpotNextPage('p')" >이전</a>
							<span id="pageList"></span>
							<a id="spot-page-N" href="#" onclick="searchSpotNextPage('n')" >이후</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
	</body>
</html>
