<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script
	src="<%=request.getContextPath()%>/resource/script/jquery-3.2.1.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resource/script/bootstrap.min.js"></script>
<head>
<title>회원 가입</title>

</head>

<script language="JavaScript">
	function checkIt() {
		var userinput = eval("document.userinput");
		if (!userinput.id.value) {
			alert("ID를 입력하세요");
			return false;
		}

		if (!userinput.password.value) {
			alert("비밀번호를 입력하세요");
			return false;
		}
		if (userinput.password.value != userinput.password2.value) {
			alert("비밀번호를 동일하게 입력하세요");
			return false;
		}

		if (!userinput.username.value) {
			alert("사용자 이름을 입력하세요");
			return false;
		}
		
	}

	/* // 아이디 중복 여부를 판단
	function ajaxConfirmid(userinput) {
		$.ajax({
			url :'inputPro.do',
			data : {
				id : $("#id").val()
			},
			success : function(result) {
				alert(result)
				alert(result == '1')
				if (result == '1') {
					$("#confirm").html("<font color=red>사용불가</font>");
				} else {
					$("#confirm").html("<font color=green>사용가능</font>");
				}
			}
		}); */
		

		// 아이디 중복 여부를 판단
		function ajaxConfirmid(userinput) {
			$.ajax({
				url : "/work/member/confirmId.do",
				data : {
					id : $("#id").val()
				},
				success : function(result) {
					if (result == '1') {
						$("#confirm").html("<font color=red>사용불가</font>");
					} else {
						$("#confirm").html("<font color=green>사용가능</font>");
					}
				}
			});
	}
</script>
</head>
<body>

	<div class="container" id="content">
		<div class="row">
			<div class="col-md-10">
				
					<form method="post" action="/work/member/inputPro.do"
						name="userinput" onSubmit="return checkIt()">
						<table width="600" border="1" cellspacing="0" cellpadding="3"
							align="center">
							</br>
							</br>
							</br>
							</br>
							<tr>
								<td colspan="2" height="39" align="center" bgcolor="">
								<font size="+1"><b>회원 가입</b></font></td>
							</tr>
							<tr>
								<td width="200">사용자 ID</td>
								<td width="400">
								<input type="text" name="id" size="10"
									maxlength="12" id="id"> 
									<!-- <input type="button"
									name="confirm_id" value="ID중복확인"
									OnClick="ajaxConfirmid(this.form)"> <label id="confirm"> -->
									</label>
									</td>
							</tr>
							<tr>
								<td width="200">비밀번호</td>
								<td width="400"><input type="password" name="password"
									size="15" maxlength="12"></td>
							<tr>
								<td width="200">비밀번호 확인</td>
								<td width="400"><input type="password" name="password2"
									size="15" maxlength="12"></td>
							</tr>

							<tr>

								<td width="200">사원 이름</td>
								<td width="400"><input type="text" name="name" size="15"
									maxlength="10"></td>
							</tr>


							<tr>
								<td colspan="2" align="center" bgcolor=""><input
									type="submit" name="confirm" value="등   록"> <input
									type="reset" name="reset" value="다시입력"> <input
									type="button" value="가입안함"
									onclick="javascript:window.location='/work/member/loginForm.do'"></td>
							</tr>

						</table>
					</form>
			</div>
		</div>
	</div>
</body>
