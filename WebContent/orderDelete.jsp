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
	String productid=request.getParameter("productid");
	pstmt=conn.prepareStatement("delete from order0117 where productid=?");
	pstmt.setString(1, productid);
	pstmt.executeUpdate();

%>
</body>
<script>
	alert("삭제 완료");
	location.href="selectProduct.jsp";
</script>
</html>