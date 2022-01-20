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
<h1 id="h1">상품 목록</h1>
<%
	int cnt=0;
	pstmt=conn.prepareStatement("select count(*) from product0117");
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
%>
<p id="p">총 <%=cnt %>개의 상품이 있습니다.</p><hr>
<table border=1 id="t2">
<tr>
<th>no</th>
<th>제품코드</th>
<th>상품명</th>
<th>단가</th>
<th>상세정보</th>
<th>제조사</th>
<th>분류</th>
<th>재고수</th>
<th>상태</th>
<th>구분</th>
</tr>

<%
	int no=0;
	pstmt=conn.prepareStatement("select * from product0117");
	rs=pstmt.executeQuery();
	while(rs.next()){
		String productid=rs.getString("productid");
		String name=rs.getString("name");
		String unitprice=rs.getString("unitprice");
		String description=rs.getString("description");
		String category=rs.getString("category");
		String manufacturer=rs.getString("manufacturer");
		String unitsinstock=rs.getString("unitsinstock");
		String condition=rs.getString("condition");
		no++;

%>
<tr>
<td id="td"><%=no %></td>
<td id="td"><%=productid %></td>
<td id="td"><%=name %></td>
<td id="td"><%=unitprice %></td>
<td id="td"><%=description %></td>
<td id="td"><%=manufacturer %></td>
<td id="td"><%=category %></td>
<td id="td"><%=unitsinstock %></td>
<td id="td"><%=condition %></td>
<td align=center>
	<a href="updateproduct.jsp?productid=<%=productid %>">수정</a>/
	<a href="deleteproduct.jsp?productid=<%=productid %>" onclick="if(!confirm('정말 삭제하시겠습니까?'))return false">삭제</a>
</td>
</tr>

<%} %>
</table>
<div style="text-align:center; padding-top:15px;">
<input id="b1" type="button" value="작성" onclick="location.href='addProduct.jsp'">
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>