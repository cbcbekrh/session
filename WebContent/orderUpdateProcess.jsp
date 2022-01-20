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
	String orderdate=request.getParameter("orderdate");
	String ordername=request.getParameter("ordername");
	String productid=request.getParameter("productid");
	String productname=request.getParameter("productname");
	String unitprice=request.getParameter("unitprice");
	String orderqty=request.getParameter("orderqty");
	String orderaddress=request.getParameter("orderaddress");
	String total=request.getParameter("total");
	
	pstmt=conn.prepareStatement("update order0117 set productid=?,unitprice=?,orderqty=?,orderaddress=? where orderdate=? and ordername=?");
	pstmt.setString(1, productid);	
	pstmt.setString(2, unitprice);
	pstmt.setString(3, orderqty);
	pstmt.setString(4, orderaddress);
	pstmt.setString(5, orderdate);
	pstmt.setString(6, ordername);
	pstmt.executeUpdate();
	
	
%>
</body>
<script>
	alert("수정 완료");
	location.href="orderSelect.jsp";
</script>
</html>