<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import="work.spring.model.BoardBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- <c:if test="${flag==1}"> 
	<meta http-equiv="Refresh" content="0;url=/work/board/list.do?pageNum=${pageNum}" >
</c:if>
<c:if test="${flag==0}"> 
본인글아닙니다.
<br>
<a href="javascript:history.go(-1)">[글수정 폼으로 돌아가기]</a>
</c:if> --%> 
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
</head>
<body>
	<input id="flag" value="${flag}" type="hidden">
</body>
<script>
	var c = document.getElementById("flag");
	alert(c.value)
	window.location = "/work/board/list.do";
</script>
</html>



<%-- 

<jsp:useBean id="member" class="work.spring.model.BoardBean">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>


<link href="style.css" rel="stylesheet" type="text/css">

<table width="270" border="0" cellspacing="0" cellpadding="5"
	align="center">
	<tr >
		<td height="39" align="center"><font size="+1">
		<b>글내용 
					수정되었습니다.</b></font></td>
	</tr>
	<tr>
		<td align="center">
			<p>입력하신 내용대로 수정이 완료되었습니다.</p>
		</td>
	</tr>
	<tr>
		<td align="center">
			<form>
				<input type="button" value="메인으로"
					onclick="window.location='/work/spring/board/list.do'">
			</form> 5초후에 메인으로 이동합니다.
			<meta http-equiv="Refresh" content="50;url=list.do">
		</td>
	</tr>
</table>
</body>
</html>
 --%>