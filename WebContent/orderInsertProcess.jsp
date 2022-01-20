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
	
	pstmt=conn.prepareStatement("insert into order0117 values(?,?,?,?,?,?)");
	pstmt.setString(1, orderdate);
	pstmt.setString(2, ordername);
	pstmt.setString(3, productid);
	pstmt.setString(4, unitprice);
	pstmt.setString(5, orderqty);
	pstmt.setString(6, orderaddress);
	pstmt.executeUpdate();
	int qty=Integer.parseInt(orderqty);
	int stk=0;
	
	pstmt=conn.prepareStatement("select * from product0117");
	rs=pstmt.executeQuery();
	if(rs.next()){
		stk=rs.getInt("unitsinstock");
	}	
	int L=stk-qty;
	
	pstmt=conn.prepareStatement("update product0117 set unitsinstock=? where productid=?");
	pstmt.setInt(1, L);
	pstmt.setString(2, productid);
	pstmt.executeUpdate();
	
	
%>
</body>
<script>
	alert("오더 완료");
	location.href="orderSelect.jsp";
</script>
</html>