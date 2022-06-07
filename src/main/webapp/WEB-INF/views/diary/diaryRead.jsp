<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <title>제주잇다::다이어리::</title>
        
	</head>
	<body>
		<section class="review-view">
			<h1>후기 게시판</h1>
			<div class="review-content-title">
				<h4>${diary.diaryTitle}</h4>
				<div>
					<span>
						<strong class="plannerDate">${diary.planner.plannerStart} ~ ${diary.planner.plannerEnd}</strong>
					<span>
						<span>${diary.diaryType}</span>
						<span>${diary.diaryCount}</span>
					</span>
				</div>
			</div>
			<div class="review-contentview">
				<div class="review-Image">
					
				</div>
				<div class="review-content-area">
					<c:forEach items="${diaryline.content}" var="diaryline">
						<h3>${diaryline.placeName}</h3>
						<span>다이어리 내용~</span>
					</c:forEach>
				</div>
			</div>
	
					
		</section>
		
	</body>
</html>