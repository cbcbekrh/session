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
	String id=request.getParameter("id");
	pstmt=conn.prepareStatement("delete from member0117 where id=?");
	pstmt.setString(1, id);
	pstmt.executeUpdate();

%>
</body>
<script>
	alert("삭제 완료");
	location.href="selectMember.jsp";
</script>
</html>