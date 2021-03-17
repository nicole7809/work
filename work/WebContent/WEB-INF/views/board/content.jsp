<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>게시판</title>

<style type='text/css'>

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	
}

a:active {
	text-decoration: underline;
}

a:hover {
	text-decoration: underline;
	background-image: url('text_dottdeline.gif');
	background-repeat: repeat-x;
	background-position: 50% 100%;
}

</style>
<style>

@font-face {
	font-family: 굴림;
	src: url();
}

body, td, a, div, p, pre, input, textarea {
	font-family: 굴림;
	font-size: 9pt;
}

</style>
</head>
<body>
	<center>
		<b>글내용 보기</b> <br>
		<form>
			<table width="500" border="1" cellspacing="0" cellpadding="0"
				align="center">
				<tr height="30">
					<td align="center" width="125" >글번호</td>
					<td align="center" width="125" align="center">${oen.num}</td>
					<td align="center" width="125" >작성자 아이디</td>
					<td align="center" width="125" align="center">${oen.id}</td>
				</tr>
				<tr height="30">
					<td align="center" width="125" >작성자</td>
					<td align="center" width="125" align="center">${oen.writer}</td>
					<td align="center" width="125" >작성일</td>
					<td align="center" width="125" align="center">${oen.reg_date}</td>
				</tr>
				<tr height="30">
					<td align="center" width="125" >글제목</td>
					<td align="center" width="375" align="center" colspan="3">${oen.subject}</td>
				</tr>
				<tr>
					<td align="center" width="125">글내용</td>
					<td align="left" width="375" colspan="3"><pre>${oen.content}</pre></td>
				</tr>
				<tr height="30">
					<td colspan="4"  align="right">
					<input
						type="button" value="글수정"
						onclick="document.location.href='/work/board/updateForm.do?num=${oen.num}&pageNum=${pageNum}'">
						&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="button" value="글 삭제"
						onclick="document.location.href='/work/board/deletePro.do?num=${oen.num}&pageNum=${pageNum}'">	
						&nbsp;&nbsp;&nbsp;&nbsp; 
						<%-- <input type="button" value="답글쓰기"
						onclick="document.location.href='/work/board/writeForm.do?num=${oen.num}&ref=${oen.ref}&re_step=${article.re_step}&re_level=${article.re_level}'">
						&nbsp;&nbsp;&nbsp;&nbsp;  --%>
						<input type="button" value="글목록"
						onclick="document.location.href='/work/board/list.do'">
					</td>
				</tr>
			</table>
		</form>
		
</body>
</html>
<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="date" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>
</head>
<body>

	<table border="1" widtr="700px">
		<tr>
			<td><h5>${oen.writer}</h5></td>
		</tr>
		<tr>
			<td><h1>&ensp; ${oen.subject} &ensp;</h1></td>
		</tr>
		<tr>
			<td><h4>${oen.id}</h4><h5><date:formatDate value="${oen.reg_date}" pattern="yy-MM-dd HH:mm"/></h5></td>
<!-- 			현재 시간 - db에서 가져온 시간을 뺀다. (하는법모르겠음) -->
		</tr>
		<tr>
			<td>내용 : ${oen.content}</td> <!-- 나중에 내용 지움 -->
		</tr>
	</table>
	<c:if test=" ${oen.signatureId} eq ${세션으로 받음} }">  세션과 id 가 같으면 삭제버튼이 생김
<button type="button" onclick="location.href='/work/board/deletePro.do?num=${oen.num}'">글 삭제</button>
	</c:if>
<button type="button" onclick="location.href='/work/board/list.do'">전으로 돌아가기</button><!-- 페이징처리하면 페이징 값도 &이후추가 -->
</body>
</html>
 --%>