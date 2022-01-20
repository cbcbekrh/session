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
<%@ include file="DBConn.jsp" %>
<section>
<h1 id="h1">주문 목록</h1>
<%
	int cnt=0;
	pstmt=conn.prepareStatement("select count(*) from order0117");
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
%>
<p id="p">총 <%=cnt %>개의 주문정보가 있습니다.</p><hr>
<table border=1 id="t2">
<tr>
<th>no</th>
<th>주문일자</th>
<th>주문자성명</th>
<th>상품번호</th>
<th>상품명</th>
<th>단가</th>
<th>주문수량</th>
<th>주문자정보</th>
<th>구분</th>
</tr>

<%
	int no=0;
	pstmt=conn.prepareStatement("select to_char(a.orderdate,'yyyy-mm-dd'),a.ordername,a.productid,a.unitprice,a.orderqty,a.orderaddress,b.name from order0117 a, product0117 b where a.productid=b.productid");
	rs=pstmt.executeQuery();
	while(rs.next()){
		String orderdate=rs.getString(1);
		String ordername=rs.getString(2);		
		String productid=rs.getString(3);
		String unitprice=rs.getString(4);
		String orderqty=rs.getString(5);
		String orderaddress=rs.getString(6);
		String name=rs.getString(7);
		no++;

%>
<tr>
<td id="td"><%=no %></td>
<td id="td"><%=orderdate %></td>
<td id="td"><%=ordername %></td>
<td id="td"><%=productid %></td>
<td id="td"><%=name %></td>
<td id="td"><%=unitprice %></td>
<td id="td"><%=orderqty %></td>
<td id="td"><%=orderaddress %></td>
<td align=center>
	<a href="orderUpdate.jsp
	?productid=<%=productid %>
	&orderdate=<%=orderdate %>
	&ordername=<%=ordername %>
	&orderaddress=<%=orderaddress %>
	&orderqty=<%=orderqty %>
	">수정</a> /
	<a href="orderDelete.jsp?productid=<%=productid %>" onclick="if(!confirm('정말 삭제하시겠습니까?'))return false">삭제</a>
</td>
</tr>

<%} %>
</table>
<div style="text-align:center; padding-top:15px;">
<input id="b1" type="button" value="작성" onclick="location.href='orderInsert.jsp'">
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>