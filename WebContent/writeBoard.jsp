<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.line{
	border-bottom:1px solid lightgray;
}

</style>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<br>
<table id="t5">
<tr height=5 ><td width=5></td></tr>
<tr style="background:url('images/table_mid.gif') repeat-x; text-align:center;">
<td width=5><img src="images/table_left.gif" width=5 height=30></td>
<td width=752>글쓰기</td>
<td width=7><img src="images/table_right.gif" width=7 height=30></td>
</tr>
</table>

<form name="form" method="post" action="writeBoardProcess.jsp.jsp">
<table id="t5">
<tr>
<th class="line">제목</th>
<td class="line"><input id="in2" type="text" name="title"></td>
</tr>

<tr>
<th class="line">이름</th>
<td class="line"><input id="in2" type="text" name="name" value=<%=checkName %>></td>
</tr>

<tr>
<th class="line">비밀번호</th>
<td class="line"><input id="in2" type="password" name="password"></td>
</tr>

<tr>
<th class="line">내용</th>
<td class="line"><textarea name="memo" rows="15" cols="70" placeholder="게시판 글쓰기 연습입니다."></textarea></td>
</tr>
</table>
</form>

<div align=center>
	<input id="b2" type="button" value="등록" onclick="check()">
	<input id="b2" type="button" value="취소">
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
<script>
function check(){
	if(document.form.title.value==""){
		alert("제목을 입력하세요.");
		document.form.title.focus();
	}else if(document.form.name.value==""){
		alert("이름을 입력하세요.");
		document.form.name.focus();
	}else if(document.form.password.value==""){
		alert("비밀번호를 입력하세요.");
		document.form.password.focus();
	}else if(document.form.memo.value==""){
		alert("내용을 입력하세요.");
		document.form.memo.focus();
	}else{
		document.form.submit();
	}
	
}
</script>
</html>