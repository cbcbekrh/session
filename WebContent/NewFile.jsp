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
	String id=request.getParameter("username");
	String pass=request.getParameter("password");	
	
	try{
		String sql="select id,name,password from member0117 where id=?";
		pstmt=conn.prepareStatement(sql);		
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();		
		if(rs.next()){
			String userID=rs.getString(1);
			String userName=rs.getString(2);
			String userPwd=rs.getString(3);
			if(pass.equals(userPwd)){
				%>					
					<%=userName %>님 환영합니다.
				<%
				session.setAttribute("s_Name", userName);
				session.setAttribute("s_Id", userID);
				response.sendRedirect("index.jsp");
			}else{
				%>
					<script>
						alert("패스워드를 잘못 입력하셨습니다.");
						history.back(-1);
					</script>
				<%
			}
		}else{
			%>
				<script>
					alert("등록되지 않은 아이디 입니다.");
					history.back(-1);
				</script>
			<%
		}
		
		System.out.println("성공");
	}catch(SQLException e){
		System.out.println("실패");
	}
	
%>
</body>
</html>