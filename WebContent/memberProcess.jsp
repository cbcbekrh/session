<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	String nickname=request.getParameter("nickname");
	
	pstmt=conn.prepareStatement("insert into member0118 values(?,?,?)");
	pstmt.setString(1, username);
	pstmt.setString(2, password);
	pstmt.setString(3, nickname);
	pstmt.executeUpdate();
		
%>
</body>
<script>
	alert("등록 완료");
	location.href="index.jsp";
</script>
</html>