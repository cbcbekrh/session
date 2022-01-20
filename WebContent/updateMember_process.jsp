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
	String id=request.getParameter("id");
	String password=request.getParameter("password1");
	String name=request.getParameter("name");
	String gender=request.getParameter("gender");
	String birth=request.getParameter("birth1")+"/"+request.getParameter("birth2")+"/"+request.getParameter("birth3");
	String mail=request.getParameter("mail1")+"@"+request.getParameter("mail2");
	String phone=request.getParameter("phone");
	String address=request.getParameter("address");
	String A="sysdate";
		
	pstmt=conn.prepareStatement("update member0117 set password=?,name=?,gender=?,birth=?,mail=?,phone=?,address=?,timestamp=sysdate where id=?");
	pstmt.setString(8, id);
	pstmt.setString(1, password);
	pstmt.setString(2, name);
	pstmt.setString(3, gender);
	pstmt.setString(4, birth);
	pstmt.setString(5, mail);
	pstmt.setString(6, phone);
	pstmt.setString(7, address);
	pstmt.executeUpdate();	
	
%>
</body>
<script>
	alert("수정 완료");
	location.href="selectMember.jsp";
</script>
</html>