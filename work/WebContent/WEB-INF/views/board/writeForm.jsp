<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>게시판</title>
<script>
function validate() {
	var divide = document.getElementById('divide');
	var content = document.getElementById('content');
	var boardTitle = document.getElementById('boardTitle');
	
	if(divide.value=="0"){
		alert("게시판을 선택해주세요");
		return false;
	}
	if(content.value==""){
		alert("내용을 입력해주세요");
		return false;
	}
	if(boardTitle.value==""){
		alert("내용을 입력해주세요");
		return false;
	}
	
}
	</script>
</head>

<body>
	<center>
		<b>글쓰기</b> <br>
		<form method="post" name="writeform" action="/work/board/writePro.do" onsubmit="return writeSave()">
			<table width="400" border="1" cellspacing="0" cellpadding="0"
				align="center">
				<tr>
					<td align="right" colspan="2"><a href="/work/board/list.do">글목록</a></td>
				</tr>
				<tr>
					<td width="70" align="center">이 름</td>
					<td width="330">
					<input type="text" size="10" maxlength="10" name="writer"></td>
				</tr>
				<tr>
					<td width="70" align="center">제 목</td>
					<td width="330">
					<input type="text" size="40" maxlength="50" name="subject"></td>
				</tr>
			
				<tr>
					<td width="70" align="center">내 용</td>
					<td width="330"><textarea name="content" rows="13" cols="40"></textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan=2 align="center">
					<input type="submit" value="글쓰기">
					<input type="reset"  value="다시작성"> 
					<input type="button" value="목록보기" OnClick="window.location='/work/board/list.do'">
					</td>
				</tr>
			</table>
		</form>
</body>
</html> 

