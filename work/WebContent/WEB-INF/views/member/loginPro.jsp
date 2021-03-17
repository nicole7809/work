<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${check == 1}">
	<script>
		window.location = "/work/board/list.do";
	</script>
</c:if>
<c:if test="${check == 0}">
	<script>
		alert("아이디/비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
</c:if>