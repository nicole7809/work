<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>게시판</title>
<script language="JavaScript" src="script.js"></script>
</head>

<body>  
<center><b>글수정</b>
<br>
<form method="post" name="writeform" action="/work/board/updatePro.do?pageNum=${pageNum}" onsubmit="return writeSave()">
<table width="400" border="1" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td  width="70" align="center">이 름</td>
    <td align="left" width="330">
       <input type="text" size="10" maxlength="10" name="writer" value="${c.writer}">
	   <input type="hidden" name="num" value="${c.num}"></td>
  </tr>
  <tr>
    <td  width="70" align="center" >제 목</td>
    <td align="left" width="330">
       <input type="text" size="40" maxlength="50" name="subject" value="${c.subject}"></td>
  </tr>
 
  <tr>
    <td  width="70" align="center" >내 용</td>
    <td align="left" width="330">
     <textarea name="content" rows="13" cols="40">${c.content}</textarea></td>
  </tr>
 
  <tr>      
   <td colspan=2 align="center"> 
     <input type="submit" value="글수정" >  
     <input type="reset" value="다시작성">
     <input type="button" value="목록보기" 
       onclick="document.location.href='/work/board/list.do?pageNum=${pageNum}'">
   </td>
 </tr>
 </table>
</form>
</body>
</html>      
     