<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>
</head>
<body>
	<input id="flag" value="${flag}" type="hidden">
</body> 
<script>
	var flag = document.getElementById("flag");
	alert(flag.value)
	window.location = "/work/board/list.do";
</script>
</html>



