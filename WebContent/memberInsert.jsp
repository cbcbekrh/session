<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<h1 id="h1">사용자 등록 화면</h1>
<form name="form" method="post" action="memberProcess.jsp">
<table border=1 style="margin:0 auto;">
<tr>
<th>UserName</th>
<td><input type="text" name="username"></td>
</tr>

<tr>
<th>Password</th>
<td><input type="text" name="password"></td>
</tr>

<tr>
<th>별명</th>
<td><input type="text" name="nickname"></td>
</tr>

<tr>
<td colspan=2 align=center>
	<input type="submit" value="등록">
</td>
</tr>

</table>
</form>
</section>
<%@ include file="nav.jsp" %>
</body>
</html>