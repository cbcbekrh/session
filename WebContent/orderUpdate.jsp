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
<script>
function on(){
	document.form.submit();
}
</script>
<%
	String productid=request.getParameter("productid");
	String orderdate=request.getParameter("orderdate");
	String ordername=request.getParameter("ordername");	
	String orderqty=request.getParameter("orderqty");
	
	
	String orderaddress=request.getParameter("orderaddress");
	if(orderaddress == null){
		orderaddress="";
	}
	if(orderdate == null){
		orderdate="";
	}
	if(ordername == null){
		ordername="";
	}
	if(productid == null){
		productid="";
	}
	
	String unitprice="";
	String productname="";
	int qty=0;
	int tot=0;
	int stk=0;
	if(orderqty == null || orderqty.equals("")){
		qty=0;
	}else{
		qty=Integer.parseInt(orderqty);
	}
	pstmt=conn.prepareStatement("select * from product0117 where productid=?");	
	pstmt.setString(1, productid);
	rs=pstmt.executeQuery();
	if(rs.next()){
		unitprice=rs.getString("unitprice");
		productname=rs.getString("name");
		stk=rs.getInt("unitsinstock");		
		if(stk < qty){
			%>
			<script>
				alert("주문수량이 재고수량보다 많습니다.");
			</script>
			<%
			qty=0;
		}else{
			tot=rs.getInt("unitprice")*qty;
		}		
		
	}else{
		productid="";
	}
	
	
	

%>

<section>
<h1 id="h1">주문수정 화면</h1>
<form name="form" method="post" action="orderInsert.jsp">
<table border=1 id="t0">
<tr>
<th id="th">주문일자</th>
<td><input id="in3" type="text" name="orderdate" value="<%= orderdate%>"></td>
<th id="th">주문자이름</th>
<td><input id="in3" type="text" name="ordername" value="<%= ordername%>"></td>
</tr>

<tr>
<th id="th">상품코드</th>
<td><input id="in3" type="text" name="productid" value="<%= productid%>" onchange="on();"></td>
<th id="th">상품명</th>
<td><input id="in3" type="text" name="productname" value="<%= unitprice%>"></td>
</tr>

<tr>
<th id="th">단가</th>
<td><input id="in3" type="text" name="unitprice" value="<%= unitprice%>"></td>
<th id="th">주문수량</th>
<td><input id="in3" type="text" name="orderqty" onchange="on();"  value="<%= qty%>"></td>
</tr>

<tr>
<th id="th">주문금액</th>
<td><input id="in3" type="text" name="total" value="<%= tot%>"></td>
<th id="th">주문주소</th>
<td><input id="in3" type="text" name="orderaddress"  value="<%=orderaddress %>"></td>
</tr>

<tr>
<td colspan=4 align=center>
	<input id="b" type="button" value="취소" onclick="location.href='as.jsp'">
	<input id="b" type="submit" value="수정" onclick="check()">
</td>
</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
<script>
function check(){
	if(document.form.orderdate.value==""){
		alert("주문일자를 입력하세요.");
		document.form.orderdate.focus();
	}else if(document.form.ordername.value==""){
		alert("주문자이름을 입력하세요.");
		document.form.ordername.focus();
	}else if(document.form.productid.value==""){
		alert("상품코드를 입력하세요.");
		document.form.productid.focus();
	}else if(document.form.orderaddress.value==""){
		alert("주문주소를 입력하세요.");
		document.form.orderaddress.focus();
	}else{
		form.action="orderUpdateProcess.jsp";
	}
}
</script>
</html>