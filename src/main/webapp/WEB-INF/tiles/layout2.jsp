<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%> 

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 메인</title>
</head>
<body>
	<div id="container" style=" display: table;">
		<div id="sidebar" style="width: 200px; margin:0px; display: table-cell;">
			<tiles:insertAttribute name="sidebar" />
		</div>
		<div id="content" style="width: 100%; margin:0px; padding:20px;  display: table-cell;">
			<tiles:insertAttribute name="content" />
		</div>
	</div>
</body>
</html>