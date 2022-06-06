<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카트 test 할 용도</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/cart/cartInsert">
<input type="text" name="goodsId" value="1"/>
<input type="text" name="goodsLineAmount" value="2"/>
<input type="text" name="goodsLineDate" value="2022/06/22"/>
<input type="submit" value="rrr"/>
</form>
</body>
</html>