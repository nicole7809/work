<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>로그인</title>
<script language="javascript">
	function begin() {
		document.myform.id.focus();
	}
	function checkIt() {
		if (!document.myform.id.value) {
			alert("아이디를 입력하지 않으셨습니다.");
			document.myform.id.focus();
			return false;
		}
		if (!document.myform.password.value) {
			alert("비밀번호를 입력하지 않으셨습니다.");
			document.myform.password.focus();
			return false;
		}

	}
</script>
</head>
<body onload="begin()">
	<form name="myform" action="/work/member/loginPro.do" method="post"
		onSubmit="return checkIt()">
		<table cellSpacing=1 cellPadding=1 width="260" border=1 align="center">
			</br>
			</br>
			</br>
			</br>
			</br>
			<tr height="30">
				<td colspan="2" align="middle""><strong>회원로그인</strong></td>
			</tr>
			<tr height="30">
				<td width="110" align=center>아이디</td>
				<td width="150" align=center>
				<input type="text"
					placeholder="ID입력 하세요~!" name="id" vsize="15" maxlength="12"></td>
			</tr>
			<tr height="30">
				<td width="110" align=center>비밀번호</td>
				<td width="150" align=center>
				<input type=password
					placeholder="비밀번호 입력하세요~!"  name="password" size="20" maxlength="12"></td>
			</tr>
			<tr height="30">
				<td colspan="2" align="middle">
				<input type=submit value="로그인">
					<input type=reset value="다시입력">
					<input type="button"
					value="회원가입" onclick="javascript:window.location='inputForm.do'"></td>
			</tr>
		</table>
	</form>
</body>
</html>