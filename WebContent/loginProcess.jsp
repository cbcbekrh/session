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
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	String password2="";
	String nickname="";
	pstmt=conn.prepareStatement("select * from member0118 where username=?");
	pstmt.setString(1, username);
	rs=pstmt.executeQuery();
	if(rs.next()){
		password2=rs.getString("password");
		nickname=rs.getString("nickname");
		if(password.equals(password2)){
			%>
			<script>
			var N="<%=nickname %>";
				alert(N+"님이 접속하셨습니다.");
				history.back(-1);
			</script>
			<%	
		}else{
			%>
			<script>
				alert("유저네임과 패스워드가 일치하지 않습니다.");
				history.back(-1);
			</script>
			<%	
		}
		
	}else{
		%>
		<script>
			alert("유저네임을 잘못 입력했습니다.");
			history.back(-1);
		</script>
		<%
	}
	
%>
</body>
</html>