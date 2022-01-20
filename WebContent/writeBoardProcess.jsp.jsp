<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
	String name=request.getParameter("name");
	String title=request.getParameter("title");
	String password=request.getParameter("password");
	String memo=request.getParameter("memo");
		
	pstmt=conn.prepareStatement("insert into board values (board_seq.nextval,?,?,?,?,sysdate,0,0,0,0)");
	pstmt.setString(1, name);	
	pstmt.setString(2, password);
	pstmt.setString(3, title);
	pstmt.setString(4, memo);
	pstmt.executeUpdate();
	
	
	
%>
</body>
<script>
	alert("작성 완료");
	location.href="list.jsp";
</script>
</html>