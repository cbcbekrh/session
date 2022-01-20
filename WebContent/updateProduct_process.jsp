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
	String productid=request.getParameter("productid");
	String name=request.getParameter("name");
	String unitprice=request.getParameter("unitprice");
	String description=request.getParameter("description");
	String category=request.getParameter("category");
	String manufacturer=request.getParameter("manufacturer");
	String unitsinstock=request.getParameter("unitsinstock");
	String condition=request.getParameter("condition");

	pstmt=conn.prepareStatement("update product0117 set name=?,unitprice=?,description=?,category=?,manufacturer=?,unitsinstock=?,condition=? where productid=?");
	pstmt.setString(8, productid);
	pstmt.setString(1, name);
	pstmt.setString(2, unitprice);
	pstmt.setString(3, description);
	pstmt.setString(4, category);
	pstmt.setString(5, manufacturer);
	pstmt.setString(6, unitsinstock);
	pstmt.setString(7, condition);
	pstmt.executeUpdate();
%>
</body>
<script>
	alert("수정 성공");
	location.href="selectProduct.jsp";
</script>
</html>