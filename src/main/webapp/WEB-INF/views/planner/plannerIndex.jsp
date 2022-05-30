<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <title>plannerIndex</title>
        <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
	</head>
	<body>
		<c:forEach items="${plannerList}" var="planner">
			<div class="card" style="width: 18rem;">
				<img src="..." class="card-img-top" alt="...">
				<div class="card-body">
				  <h5 class="card-title">${planner.plannerName}</h5>
				  <p class="card-text">${planner.plannerStart} ~ ${planner.plannerEnd} (DAY)</p>
				  <a href="#" class="btn btn-primary">Go somewhere</a>
				</div>
			  </div>
		</c:forEach>
		
	</body>
</html>
