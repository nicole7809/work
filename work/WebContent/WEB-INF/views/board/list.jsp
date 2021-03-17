<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
a {
	text-decoration: none;
}
</style>
<html>
<head>
<title>게시판</title>
</head>
<body>
	<center>
	</br>
		<h3>${sessionScope.memId}님&nbsp;환영합니다~!</h3> 
		<b>글목록 총${count}개글</b>
		<table width="400">
			<tr>
				<td align="right"><a href="/work/member/logout.do">로그아웃</a></td>
				<td align="right"><a href="/work/board/writeForm.do">글쓰기</a></td>
			</tr>
		</table>
		<table border="1" width="600px">
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
				<th>id</th>
			</tr>

			<c:forEach var="row" items="${listAll}">
				<tr>
					<td>${row.num}</td>
					
					<td><a href="/work/board/content.do?num=${row.num}">${row.writer}</a></td>
					<td>${row.subject}</td>
					<td>
					<fmt:formatDate value="${row.reg_date}" pattern="yyyy-MM-dd HH:mm:ss"/>   
					<td>${row.id}</td>
				
				</tr>


			</c:forEach>

		</table>
		<c:if test="${count > 0}">
			<c:set var="pageCount"
				value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}" />
			<c:set var="pageBlock" value="${5}" />
			<date:parseNumber var="result" value="${pageNum / pageBlock}"
				integerOnly="true" />
			<c:set var="startPage" value="${result * pageBlock + 1}" />
			<c:set var="endPage" value="${startPage + pageBlock - 1}" />
			<c:if test="${endPage > pageCount}">
				<c:set var="endPage" value="${pageCount}" />
			</c:if>

			<c:if test="${startPage > pageBlock}">
				<a href="/work/board/list.do?pageNum=${startPage - pageBlock }">[이전]</a>
			</c:if>

			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="/work/board/list.do?pageNum=${i}">[${i}]</a>
			</c:forEach>

			<c:if test="${endPage < pageCount}">
				<a href="/work/board/list.do?pageNum=${startPage + pageBlock}">[다음]</a>
			</c:if>
		</c:if>
</body>