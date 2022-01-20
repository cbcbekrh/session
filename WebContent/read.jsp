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
	String name=request.getParameter("name");
	int num=0;
	pstmt=conn.prepareStatement("select hit from board where name=?");
	pstmt.setString(1, name);
	rs=pstmt.executeQuery();
	if(rs.next()){
		num=rs.getInt(1)+1;	
		System.out.println(num);
		System.out.println(name);
		pstmt=conn.prepareStatement("update board set hit=? where name=?");
		pstmt.setInt(1, num);
		pstmt.setString(2, name);
		pstmt.executeUpdate();
	}	
%>


</body>
</html>