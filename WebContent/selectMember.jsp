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
<h1 id="h1">회원 목록</h1>
<%
	int cnt=0;
	pstmt=conn.prepareStatement("select count(*) from member0117");
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
%>
<p id="p">총 <%=cnt %>명의 회원이 있습니다.</p><hr>
<table border=1 id="t2">
<tr>
<th>아이디</th>
<th>성명</th>
<th>비밀번호</th>
<th>남성</th>
<th>생년월일</th>
<th>이메일</th>
<th>연락처</th>
<th>주소</th>
<th>입력일</th>
<th>구분</th>
</tr>

<%
	pstmt=conn.prepareStatement("select * from member0117");
	rs=pstmt.executeQuery();
	while(rs.next()){
		String id=rs.getString("id");
		String password=rs.getString("password");
		String name=rs.getString("name");
		String gender=rs.getString("gender");
		String birth=rs.getString("birth");
		String mail=rs.getString("mail");
		String phone=rs.getString("phone");
		String address=rs.getString("address");
		String timestamp=rs.getString("timestamp");

%>
<tr>
<td><%=id %></td>
<td><%=password %></td>
<td><%=name %></td>
<td><%=gender %></td>
<td><%=birth %></td>
<td><%=mail %></td>
<td><%=phone %></td>
<td><%=address %></td>
<td><%=timestamp %></td>
<td align=center>
	<a href="updateMember.jsp?id=<%=id %>">수정</a>/
	<a href="deleteMember.jsp?id=<%=id %>" onclick="if(!confirm('정말 삭제하시겠습니까?'))return false">삭제</a>
</td>
</tr>

<%} %>
</table>
<div style="text-align:center; padding-top:15px;">
<input id="b1" type="button" value="작성" onclick="location.href='addMember.jsp'">
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>