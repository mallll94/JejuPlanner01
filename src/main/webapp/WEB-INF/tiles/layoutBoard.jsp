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
		<div id="wrap" style="display: table;">
			<div id="sideBoard" style="display: table-cell; height: 100%">
				<tiles:insertAttribute name="left" />
			</div>
			<div id="content" style="display: table-cell; width: 100%">
				<tiles:insertAttribute name="content" />
			</div>
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>