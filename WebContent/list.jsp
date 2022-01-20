<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
table{
	margin:0 auto;
	width:100%;
	border-collapse:collapse;
	
}
.line{
	border-bottom:1px solid lightgray;
}
#td{
	height:35px;
}
</style>
</head>
<%@ include file="DBConn.jsp" %>
<%
	int cnt=0;
	pstmt=conn.prepareStatement("select count(*) from board");
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}

%>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<p style="padding-left:25px;">총게시물:<%=cnt %>개</p>
<table>
<tr height=5 ><td width=5></td></tr>
<tr style="background:url('images/table_mid.gif') repeat-x; text-align:center;">
<td width=5><img src="images/table_left.gif" width=5 height=30></td>
<td width=73>번호</td>
<td width=379>제목</td>
<td width=73>적성자</td>
<td width=164>작성일</td>
<td width=58>조회수</td>
<td width=7><img src="images/table_right.gif" width=7 height=30></td>
</tr>

<%
	pstmt=conn.prepareStatement("select * from board order by num desc");
	rs=pstmt.executeQuery();
	while(rs.next()){		
		String num=rs.getString("num");	
		String title=rs.getString("title");	
		String time=rs.getString("time");	
		String name=rs.getString("name");	
		String hit=rs.getString("hit");		
		
%>
<tr>
<td></td>
<td id="td" class="line" align=center><%=num %></td>
<td id="td" class="line" align=center><a href="read.jsp?name=<%=name %>"><%=title %></a></td>
<td id="td" class="line" align=center><%=name %></td>
<td id="td" class="line" align=center><%=time %></td>
<td id="td" class="line" align=center><%=hit %></td>
<td></td>
</tr>


<%} %>
</table>

<%
	if(checkName == null){
%>	
	<div style="text-align:center; margin-top:10px">
	<input style="width:150px; height:30px;" type="button" value="글쓰기" onclick="check()">
</div>
<% 
}else{
%>
<div style="text-align:center; margin-top:10px">
	<input style="width:150px; height:30px;" type="button" value="글쓰기" onclick="location.href='writeBoard.jsp'">
</div>
<%} %>
</section>
<%@ include file="footer.jsp" %>
</body>
<script>
function check(){
	alert("로그인 하셔야 글쓰기가 가능합니다.");
	location.href="index.jsp";
}
</script>
</html>