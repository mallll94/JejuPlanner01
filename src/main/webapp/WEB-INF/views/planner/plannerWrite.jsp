<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <title>::플래너 작성하기::</title>

		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/3d026d01cb.js" crossorigin="anonymous"></script>
		<!-- jQuery -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
	    <!-- jQuery ui -->
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<!-- jQuery ui -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        


        <!-- <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
		<!--GoogleMap-->
		<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDAQyf0XE4ptqpDNkKhiwyhT5MJpSrvpd8&callback=initMap&map_ids=a0f291588508440c&region=KR"></script>
		<style>
			.body-main{
				display: flex;
				flex-direction: row;
				justify-content: center;
				height: 100%;
			}
			div{
				box-sizing: inherit;
			}
			div.jeju-sidebar-left{
				flex-basis: 350px;
				flex-shrink: 0;
				background-color: gainsboro;
				height: 100%;
				order: 0;
				text-align: center;
			}
			div.planner-plan-addList{
				overflow: auto;
			}
			div.jeju-sidebar-right{
				flex-basis: 250px;
				flex-shrink: 0;
				background-color: gainsboro;
				height: 100%;
				order: 2;
				text-align: center;
			}
			div.sidebar-spot-wrapper{
				overflow: auto;
			}
			div.jeju-googleMap{ 
				flex-basis: 100%;
				height: 100%;
				order: 1;
			}
			div.sidebar-left-area, div.sidebar-right-area{
				display: inline-block;
			}
			/* Always set the map height explicitly to define the size of the div
			* element that contains the map. */
			#googleMap {height: 100%;}
			/* Optional: Makes the sample page fill the window. */
			html, body {height: 100%;margin: 0;padding: 0;}
			.search-place-keyword{float: left;}
			input[ class="category-input"]{display: none;}
			.ul-spot{padding: 0px;margin: 0px;}
			.spot-card{padding: 1px;}
			.spot-info{width: 200px;height: 60px;border: 1px solid gray;margin:2px;}
			.spot-info-photo{box-sizing: inherit;float: left;width: 65px;height: 100%;background-color: antiquewhite;}
			.spot-info-detail{box-sizing: inherit;float: left;width:135px;height: 100%;}
			.set-datepicker{width: 200px; font-size: 15px; text-align: center;}
			p{margin:0px;}
			ul,li{list-style-type: none;}
			#placeContent{word-wrap: break-word;font-size: small;padding-bottom: 5px;}
			#placeAddr{font-size: small;}
		</style>
		<script>
			/*googleMap*/
			var markers =[];
			//위치 위도 경도
			var targets =[{ lat: 33.3893 ,lng: 126.5362 }];
			var mymap;
			let line;
			var lineArr=[];

			//지도 조회
			function initMap() {  
				const mapDiv= document.getElementById("googleMap");
				mymap = new google.maps.Map(mapDiv,{
					center: targets[0],
					zoom: 11,
					mapId: "a0f291588508440c",
					streetViewControl: false
				})

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

			//마커삭제
			function deleteMarkers() {
				for (var i = 0; i < markers.length; i++) {
					markers[i].setMap(null);
				}
			}
			
			
			//선 색 설정
			function getLineColor(day){	
				if(day="1"){
					return "#00C3FF";
				}else if(day="2"){
					return "#FFDD00";
				}else if(day="3"){
					return "#7C8C91";
				}else if(day="4"){
					return "#FF0000";
				}else if(day="5"){
					return "#5100FF";
				}else if(day="6"){
					return "#FF841F";
				}else if(day="7"){
					return "#E9F086";
				}
			}


			//선잇기
			function addLine(lineArr, lineColor){
				line = new google.maps.Polyline({
					path : lineArr,
					geodesic:true,
					//strokeColor: "#ff841f",
					strokeColor: lineColor,
					strokeOpacity:1.0,
					strokeWeight:5
				})
				line.setMap(mymap);
			}

			//선삭제
			function removeRoute(){
				alert("선삭제하기")
				//if(typeof line !== 'undefined'){
				// for (i=0; i<lineArr.length; i++) { 
				// 	//lineArr[i].setMap(null);
				// 	lineArr[i].setVisible(false);
				// }
				line.setMap(null)
			}


			$(function(){
				let targetPlanner= "${planner}";
				let targetPlannerId= "${planner.plannerId}";
				let targetPlanStartDay =new Date('${planner.plannerStart}')
				let targetPlanEndDay =new Date('${planner.plannerEnd}')
				let loginUserId = '${planner.user.userId}'
				


				//왼쪽 사이드바 - 플래너 일정 정보 조회
				function selectPlaceByMyPlanner(){
					alert("플래너 일정 정보 조회")
					$.ajax({
						url: "${pageContext.request.contextPath}/planner/selectPlannerPlace",
						type: "post",
						dataType: "json",
						data: {plannerId: targetPlannerId},
						success: function(result){
							//alert("db저장된 일정::"+result.plist)
							var Dday = result.Dday;
							$("#plannerId").val(targetPlannerId)
							$("#plan-placeList").html("")
							$("#plan-hotelList").html("")

							//마커 초기화
							targets =[];
							lineArr=[];

							//마커를 지우고 다시찍자 
							//deleteLine(targets);
							deleteMarkers();
							removeRoute();

							// let lineDay=plannerplace.plannerPlaceDate;
							// for(var i=1;i<=Dday+1;i++){

							// }
							let lineDay="1";
							$.each(result.plist, function(index,plannerplace){

								if(plannerplace.plannerPlaceDate==lineDay){
									let str="";
										str+=`<li class='add-plan-card' ppDate="${'${plannerplace.plannerPlaceDate}'}">`
											str+=`<div class="add-plan-info">`
											str+=`<div><select class='add-plan-setday' plannerPlaceId="${'${plannerplace.plannerPlaceId}'}" >`
												for(var i=1;i<=Dday+1;i++){
													if(plannerplace.plannerPlaceDate!=i){
														str+=`<option value=${'${i}'}>\${i} 일차</option>`
													}else{
														str+=`<option value=${'${i}'} selected>\${i} 일차</option>`
													}
												}
											str+=`</select></div>`
											str+=`<div class="add-plan-detail"><span><h7>\${plannerplace.placeName}</h7><span>`
											str+=`<span class="badge rounded-pill text-dark"><a href="javascript:void(0);" id="delete-plan-bnt" plannerPlaceId="${'${plannerplace.plannerPlaceId}'}">x</a></span></div>`
											str+=`</div>`
										str+=`</li>`
									if(plannerplace.placeCategory==="장소"){
										$("#plan-placeList").append(str);
									}else if(plannerplace.placeCategory==="숙소"){
										$("#plan-hotelList").append(str);
									}
									//마커찍을 배열저장
									targets.push({ lat: plannerplace.placeLatitude*=1 ,lng: plannerplace.placeLongitude*=1 })
									lineArr.push({ lat: plannerplace.placeLatitude*=1 ,lng: plannerplace.placeLongitude*=1 })
									//마커 찍기
									addMarker(targets);	
									addLine(lineArr,getLineColor(plannerplace.plannerPlaceDate));
									console.log(plannerplace.plannerPlaceDate)
								}else{
									lineArr=[];
									lineDay=plannerplace.plannerPlaceDate

									let str="";
										str+=`<li class='add-plan-card' ppDate="${'${plannerplace.plannerPlaceDate}'}">`
											str+=`<div class="add-plan-info">`
											str+=`<div><select class='add-plan-setday' plannerPlaceId="${'${plannerplace.plannerPlaceId}'}" >`
												for(var i=1;i<=Dday+1;i++){
													if(plannerplace.plannerPlaceDate!=i){
														str+=`<option value=${'${i}'}>\${i} 일차</option>`
													}else{
														str+=`<option value=${'${i}'} selected>\${i} 일차</option>`
													}
												}
											str+=`</select></div>`
											str+=`<div class="add-plan-detail"><span><h7>\${plannerplace.placeName}</h7><span>`
											str+=`<span class="badge rounded-pill text-dark"><a href="javascript:void(0);" id="delete-plan-bnt" plannerPlaceId="${'${plannerplace.plannerPlaceId}'}">x</a></span></div>`
											str+=`</div>`
										str+=`</li>`
									if(plannerplace.placeCategory==="장소"){
										$("#plan-placeList").append(str);
									}else if(plannerplace.placeCategory==="숙소"){
										$("#plan-hotelList").append(str);
									}
									//마커찍을 배열저장
									targets.push({ lat: plannerplace.placeLatitude*=1 ,lng: plannerplace.placeLongitude*=1 })
									lineArr.push({ lat: plannerplace.placeLatitude*=1 ,lng: plannerplace.placeLongitude*=1 })
									//마커 찍기
									addMarker(targets);	
									addLine(lineArr,getLineColor(plannerplace.plannerPlaceDate));
									console.log(plannerplace.plannerPlaceDate)

								}
								
								
							})
							$(".planner-plan-hotelList").hide();
							$(".planner-plan-placeList").show();

							
							
							
						},
						error: function(error){
							alert("장소 정보를 불러오지 못했습니다.")
						}
					})

				}


				//왼쪽 사이드바 - 플래너 날짜 정보 조회
				function getplannerInfo(){
					
					//기존에 생성된 플래너라면
					if(targetPlanner){
						$.ajax({
							url:"${pageContext.request.contextPath}/planner/selectByUserId",
							type:"post",
							dataType:"text",
							data:{plannerId: targetPlannerId},
							success: function(result){
								//날짜 조회
								if(result==targetPlannerId){
									$('#plan-startday').datepicker('setDate',targetPlanStartDay);
									$('#plan-endday').datepicker('setDate',targetPlanEndDay);
									var inputdays = (targetPlanEndDay-targetPlanStartDay)/1000/60/60/24;
									$("#planner-dayset-day").html(Math.abs(inputdays)+1)
									selectPlaceByMyPlanner();
								}else{
									alert("플래너 정보가 없습니다.")
								}
							},
							error: function(result){
								alert("플래너 정보가 없습니다.")
							}
						})
					}else{
						$("#plan-startday").focus()
					}
					
				}

				

				//여행 일자 수정
				function showDays(){
					startDay= $('#plan-startday').datepicker('getDate'); //Mon Aug 15 2022 00:00:00 GMT+0900 (한국 표준시)
					endDay = $('#plan-endday').datepicker('getDate');

					//두 날짜가 비어있으면 함수 빠져나가기
					if($('#plan-startday').val()=="" || $('#plan-endday').val()=="" ){
						return;
					}
					//alert("showDays()!"+startDay)
					let StartDate = startDay.toLocaleDateString('en-US'); //8/15/2022
					let EndDate = endDay.toLocaleDateString('en-US'); //8/15/2022

					//기존에 생성된 플래너라면 날짜만 변경
					if(targetPlanner){
						$.ajax({
						url: "${pageContext.request.contextPath}/planner/updateDate",
						type:"post",
						dataType:"json",
						data:{plannerId: targetPlannerId, plannerStart: StartDate, plannerEnd: EndDate},
							success: function(result){
								var dbplannerPlace = result.plannerPlace;
								var Dday = result.Dday;
								$("#planner-dayset-day").html(Dday+1);
							},
							error: function(error){
								alert("여행날짜를 변경하지 못 했습니다.")
							}
						})
					}else{//플래너 새로 생성하기
						$.ajax({
						url: "${pageContext.request.contextPath}/planner/insert",
						type:"post",
						dataType:"json",
						data:{plannerStart: StartDate, plannerEnd: EndDate},
						success: function(result){
							var dbplannerPlace = result.plannerPlace;
							var Dday = result.Dday;
							$("#planner-dayset-day").html(Dday+1);
							$("#plannerId").val(result.planner.plannerId);
							targetPlannerId= result.planner.plannerId
							
						},
						error: function(error){
							alert("플래너를 생성하지 못 했습니다.")
						}
					})
					}
					
				}
								
				
				
				//datepicker 설정
				$.datepicker.setDefaults({
					dateFormat: 'yy년 mm월 dd일(DD)',
					prevText: '이전 달',
					nextText: '다음 달',
					monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
					monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
					dayNames: ['일', '월', '화', '수', '목', '금', '토'],
					dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
					dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
					showMonthAfterYear: true,
					yearSuffix: '년',
					onSelect: showDays()
				});
				//왼쪽 사이드바 -여행 시작일 설정 후 이벤트
				$('#plan-startday').datepicker();
				$('#plan-startday').datepicker("option","maxDate",$("#plan-endday").val());
				$('#plan-startday').datepicker("option","onClose",function(selectedDate){
					$('#plan-endday').datepicker("option","minDate",selectedDate);
					showDays();
				})

				//왼쪽 사이드바 -여행 종료일 설정 후 이벤트
				$('#plan-endday').datepicker();
				$('#plan-endday').datepicker("option","minDate",$("#plan-startday").val());
				$('#plan-endday').datepicker("option","onClose",function(selectedDate){
					$('#plan-startday').datepicker("option","maxDate",selectedDate);
					showDays();
				})

				


				//오른쪽 사이드바 - 추천장소, 추천숙소 버튼동작
				$("input[class='category-input']").click(function(){
					var category =$(this).val();
					$.ajax({
						url: "${pageContext.request.contextPath}/planner/recommend",
						type:"get",
						dataType:"json",
						data:{category: category},
						success: function(result){
							//alert(result)
							let str="";
							$.each(result,function(index,place){
								str+="<il class='spot-card'>"
								str+=`<div class="spot-info" id="${'${place.placeId}'}">`
									str+= `<div class="spot-info-photo"><img src="/place/\${place.placePhoto}" alt="장소상세사진"></div>`
									str+= `<div class="spot-info-detail"><span><h7>\${place.placeName}</h7><span>`
										str+=`<div class="spot-bnt-wrap"><span ><button type="button" id="plan-info-bnt" class='badge rounded-pill bg-light text-dark' data-bs-toggle="modal" data-bs-target="#placeInfoModal"  placeId="${'${place.placeId}'}">i</button></span>`
										str+=`<span><a id="plan-add-bnt" class="badge rounded-pill bg-info text-dark" href="javascript:void(0);" category="${'${place.placeCategory}'}" placeId="${'${place.placeId}'}">+</a></span></div>`
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
			
				

				//오른쪽 사이드바 - 모달 정보 ajax
				function modalInfoPlace(placeId){
					$.ajax({
						url: "${pageContext.request.contextPath}/planner/selectPlace",
						type: "post",
						dataType: "json",
						data: {placeId: placeId},
						success: function(result){
							$("#placeNameModal").text(result.placeName);
							$("#placeAddrModal").text(result.placeAddr);
							$("#placeContentModal").text(result.placeContent);
							$("placePhotoModal").attr("src", "/images/place/"+result.placePhoto )
							$("modal-link-bnt").attr("urlInfo",result.placeUrl);

						},
						error: function(error){
							alert("정보를 불러올 수 없습니다.")
						}
					})
				}

				


				//오른쪽 사이드바 - 장소 추가하기 버튼동작
				$(document).on("click","#plan-add-bnt",function addPlaceToPlanner(){
					//alert(targetDate)
					let targetPlaceId = $(this).attr("placeId")
					let targetPlaceCategory = $(this).attr("category")

					if(targetPlaceCategory=="숙소"){
						var targetDate=$("#plan-hotelList").children().last().attr("ppDate");
					}else if(targetPlaceCategory=="장소"){
						var targetDate=$("#plan-placeList").children().last().attr("ppDate");
					}
					
					if(targetDate==null){
						var targetDate="1"
						alert(targetDate)
						alert(targetPlannerId)
						//alert(targetPlaceId)
					}

					//두 날짜가 비어있으면 함수 빠져나가기
					if($('#plan-startday').val()=="" || $('#plan-endday').val()=="" ){
						alert("우선 여행 날짜를 선택해주세요.");
						return;
					}

					//왼쪽 사이드바에 일정추가하기
					$.ajax({
						url: "${pageContext.request.contextPath}/planner/addPlace",
						type: "post",
						dataType: "json",
						data: {plannerId: targetPlannerId ,placeId: targetPlaceId, inputDate: targetDate},
						success: function(result){
							var dbCategory =result.placeCategory
							//왼쪽 사이드바 갱신한다.
							selectPlaceByMyPlanner();
						},
						error: function(error){
							alert("일정을 추가하지 못했습니다.")
						}
					})
					
				})

				//왼쪽 사이드바 - 장소/숙소 버튼
				$("#planner-hotel-bnt").on("click",function(){
					$(".planner-plan-placeList").hide();
					$(".planner-plan-hotelList").show();
				})
				$("#planner-place-bnt").on("click",function(){
					$(".planner-plan-hotelList").hide();
					$(".planner-plan-placeList").show();
				})

				//왼쪽사이드바 - 일정 Day변경
				$(document).on("change","select",function(){
					//alert("Day변경!")
					let targetUpdatePlan=$(this).attr('plannerPlaceId')
					let updatetargetDay =$(this).val();
					$.ajax({
						url: "${pageContext.request.contextPath}/planner/updatePlanPlace",
						type: "post",
						data: {plannerplaceId: targetUpdatePlan, date: updatetargetDay},
						success: function(){
							selectPlaceByMyPlanner();
						},
						error: function(){
							alert("일정을 수정하지 못했습니다.")
						}

					})
				})

				//왼쪽 사이드바 - 장소/숙소 삭제 버튼
				$(document).on("click","#delete-plan-bnt",function(){
					//alert("삭제하기!")
					let targetDeletePlan=$(this).attr('plannerPlaceId')
					$.ajax({
						url: "${pageContext.request.contextPath}/planner/deletePlan",
						type: "post",
						data: {plannerplaceId: targetDeletePlan},
						success: function(){
							selectPlaceByMyPlanner();
						},
						error: function(){
							alert("일정을 삭제하지 못했습니다.")
						}

					})
				})

				//오른쪽 사이드바 - 장소 정보 모달 버튼동작
				$(document).on("click","#plan-info-bnt",function(){
					modalInfoPlace($(this).attr('placeId'));

				})

				//모달-일정 추가하기 버튼 동작
				$(document).on("click","#modal-add-plan-bnt",function(){
					addPlaceToPlanner()

				})

				//왼쪽사이드바 - 작업완료
				$(document).on("click","#finish-wirte-bnt", function(){
					//두 날짜가 비어있으면 함수 빠져나가기
					if($('#plan-startday').val()=="" || $('#plan-endday').val()=="" ){
						alert("우선 여행 날짜를 선택해주세요.");
						return;
					}else{
						let url = "${pageContext.request.contextPath}/planner/plannerIndex2?plannerId="+ targetPlannerId
						location.replace(url)
					}
				})


				getplannerInfo();
				
			})

			function getSearchList(){
				//alert("검색하기")
				let serchKeyword = $("#searchPlaceKeyWord").val()
				let nowPage =1;
				alert(serchKeyword)
				$.ajax({
					url: "${pageContext.request.contextPath}/planner/searchPlace",
					type: "post",
					dataType: "json",
					data:{keyword: serchKeyword, nowPage: nowPage} ,
					success: function(result){
						alert("검색success")
						alert("totalPages"+result.totalPages)
						let str="";
						$.each(result.pageList,function(index,place){
							str+="<il class='spot-card'>"
							str+=`<div class="spot-info" id="${'${place.placeId}'}">`
								str+= `<div class="spot-info-photo"><img src="/place/\${place.placePhoto}" alt="장소상세사진"></div>`
								str+= `<div class="spot-info-detail"><span><h7>\${place.placeName}</h7><span>`
									str+=`<div class="spot-bnt-wrap"><span ><button type="button" id="plan-info-bnt" class='badge rounded-pill bg-light text-dark' data-bs-toggle="modal" data-bs-target="#placeInfoModal"  placeId="${'${place.placeId}'}">i</button></span>`
									str+=`<span><a id="plan-add-bnt" class="badge rounded-pill bg-info text-dark" href="javascript:void(0);" category="${'${place.placeCategory}'}" placeId="${'${place.placeId}'}">+</a></span></div>`
							str+=`</div>`
							str+="</il>"
						})
						$("#spotList").html("");
						$("#spotList").append(str);

					},
					error: function(error){
						alert("정보를 불러올 수 없습니다.")
					}
				})
			}

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
					<!-- 플래너기본설정 사이드바(좌측상단) -->
					<div class="planner-info-wrapper">
						<!--플래너 이름-->
						<div class="planner-info-name">
							<c:choose>
								<c:when test="${not empty planner}">
									<div class="planner-name"><span>${planner.plannerName}</span></div>
								</c:when>
								<c:otherwise>
									<div class="planner-name"><span>제주도</span></div>
								</c:otherwise>
							</c:choose>
						</div>
						<!--플래너 날짜-->
						<div class="planner-info-day">
							<div class="planner-dayset">
								<span id="planner-dayset-day" class="plan-showdays"></span>
								<span class="plan-showdays"> DAY</span>
							</div>
							<div class="planner-calender">
								<input type="text" id="plan-startday" class="datepicker set-datepicker" readonly="readonly">
								~<input type="text" id="plan-endday" class="datepicker set-datepicker" readonly="readonly">
							</div>
						</div>
					</div>
					<!-- 일정설정 사이드바(좌측하단) -->
					<div class="planner-myplan-wrapper">
						<div class="planner-plan-category">
							<input class="myPlan-category" id="planner-hotel-bnt" type="button" name="myPlanCategory" value="숙소" />
							<input class="myPlan-category" id="planner-place-bnt" type="button" name="myPlanCategory" value="장소" />
						</div>
						<div class="planner-plan-addList">
							<div class="planner-plan-hotelList">
								<ul class="ul-plan-hotel" id="plan-hotelList"></ul>
							</div>
							<div class="planner-plan-placeList">
								<ul class="ul-plan-place" id="plan-placeList"></ul>
							</div>
						</div>
					</div>
					<!--완료버튼(좌측 하단)-->
					<div class="planner-save-area">
						<!-- <form id="planner-insert-save" name="planner-insert-save" method="post" action="${pageContext.request.contextPath}/planner/plannerIndex2">
							<input type="hidden" name="plannerId" value="">
							<input type="submit" value="작업 완료">
						</form> -->
						<!-- <a href="#" id="planner-insert-save" >작업완료</a> -->
						<a href="#" id="finish-wirte-bnt" class="btn btn-primary">작업완료</a>
						
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
									<input id="searchPlaceKeyWord" type="text" class="keyword-input" placeholder="검색어를 입력하세요" autocomplete="off" onKeyDown="javascript:if (event.keyCode == 13) getSearchList();"/>
									<button class="search-place-button" id="searchPlaceButton" type="button" onclick="getSearchList()">
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
					<!--검색 페이징처리-->
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
		
		<!--모달2-->
		<div id="placeInfoModal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="placeInfoTitleModal"></h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-6">
                                <img class="img-fluid" id="placePhotoModal" src="">
                                <!-- 썸네일 이미지 -->
                            </div>
                            <div class="col-6">
                                <div class="row">
                                    
                                    <div class="col-8">
										
                                        <p id="placeNameModal"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    
                                    <div class="col-8" id="placeContentModal-area">
                                        <p id="placeContentModal"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    
                                    <div class="col-8">
                                        <p id="placeAddrModal"></p>
                                    </div>
                                </div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal" id="modal-link-bnt">링크</button>
									<button type="button" class="btn btn-default" data-dismiss="modal" id="modal-add-plan-bnt" >추가하기</button>
								</div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>



		
	</body>
</html>
