<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<header>
<%
	String checkName="";
	checkName=(String)session.getAttribute("s_Name");
	System.out.println(checkName);
%>
<%
	if(checkName==null){
%>
<h4 style="color:blue; float:left; font-size:0.8em; padding-left:15px; display:inline-block;">쇼핑몰에 오신 것을 환영합니다.</h4>

<div style="font-size:0.5em; float:right; padding-right:25px;">
<form name="form" method="post" action="NewFile.jsp">
<fieldset style="border:none;">
<label style="color:white;">회원ID:</label><input style="width:80px;" type="text" name="username">
<label style="color:white;">비밀번호:</label><input style="width:80px;" type="password" name="password">
        <input type="button" value="로그인" onclick="check()">
        <a style="text-decoration:none;" href="addMember.jsp">회원가입</a>
</fieldset>
</form>
</div>
<%
}else{
	session.setMaxInactiveInterval(100);
%>
<h4 style="color:blue; float:left; font-size:0.8em; padding-left:15px; display:inline-block;">쇼핑몰에 오신 것을 환영합니다.</h4>
<div style="font-size:0.5em; float:right; padding-right:25px;">
<%=checkName %>님 환영합니다.
<a href="logout.jsp">logout</a>
<a href="addMember.jsp">회원가입</a>
</div>
<%} %>
</header>
</body>
<script>
function check(){
	if(document.form.username.value==""){
		alert("아이디를 입력하세요.")
		document.form.username.focus();
	}else if(document.form.password.value==""){
		alert("비밀번호를 입력하세요.")
		document.form.password.focus();
	}else{
		document.form.submit();
	}		
}
</script>
</html>