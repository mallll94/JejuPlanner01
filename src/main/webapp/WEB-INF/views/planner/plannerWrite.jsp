<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <title>::플래너 작성하기::</title>
        <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
		<style>
			input[ class="category-input"]{
				display: none;
			}
		</style>
		<script>
			function searchPlaceButton(){
				alert("검색하기")
			}
			/*
			function selectCategory(category){
				alert(category)
			}
			*/
			$(function(){
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
									str+= `<div class="spot-info-photo"><img src="/place/\${place.placePhoto}" alt="장소상세사진"><div>`
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
			})
			
		</script>

	</head>
	<body>
		<h3>플래너 작성하기</h3>
		
		<!-- 일정작성 사이드바(왼쪽) -->
		<div class="jeju-sidebar-left" id="sidebar-left">
			
		</div>
		
		<!-- 메인 구글지도 -->
		<div>
			<div id="googleMap" class="gmap-write"></div>
		</div>

		<!--SIDEBAR-->
		<!--검색어 입력 사이드바(우측상단)-->
		<div class="search-sidebar">
			<div class="search-container">
				<div class="search-place-keyword-wrapper">
					<div class="search-place-keyword">
						<input id="searchPlaceKeyWord" type="text" class="keyword-input" placeholder="검색어를 입력하세요" autocomplete="off"/>
					</div>
					<button class="search-place-button" id="searchPlaceButton" onclick="searchPlaceButton()" type="button">
						<img alt="검색" src="/icon/search.png" class="icon-sidebar-search-place" style="width: 15px; height: inherit;">
					</button>
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
		</div>
		<!--검색장소 목록 사이드바 (우측하단)-->
		<div class="sidebar-spot-wrapper">
			<ul class="ul-spot" id="spotList"></ul>
		</div>
	</body>
</html>
