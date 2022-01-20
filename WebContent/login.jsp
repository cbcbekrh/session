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
<h1 id="h1">Login</h1>
<form name="form" method="post" action="loginProcess.jsp">
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
<td colspan=2 align=center>
	<input type="submit" value="Login">
</td>
</tr>

</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>