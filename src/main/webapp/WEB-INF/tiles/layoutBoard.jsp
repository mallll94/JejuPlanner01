<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%> 

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>string</title>
</head>
<body>
	<div id="container" >
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="body" style="display: flex;">
			<div id="sideBoard" style=" min-width: 350px;max-width: 550px;float: left;">
				<tiles:insertAttribute name="left" />
			</div>
			<div id="content" style=" width:1000px" >
				<tiles:insertAttribute name="content" />
			</div>
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>