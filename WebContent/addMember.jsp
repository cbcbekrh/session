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
<%
	int N=0;
	pstmt=conn.prepareStatement("select id from member0117 order by id desc");
	rs=pstmt.executeQuery();
	if(rs.next()){
		N=rs.getInt(1)+1;
	}

%>
<h1 id="h1">회원 가입 등록 화면</h1><hr>
<form name="form" method="post" action="addMember_process.jsp">
<table border=1 id="t1">
<tr>
<th id="th">아이디</th>
<td><input id="in" type="text" name="id" value="<%=N %>">마지막번호+1</td>
</tr>

<tr>
<th id="th">성명</th>
<td><input id="in" type="text" name="name"></td>
</tr>

<tr>
<th id="th">비밀번호</th>
<td><input id="in" type="password" name="password1"></td>
</tr>

<tr>
<th id="th">비밀번호 확인</th>
<td><input id="in" type="password" name="password2"></td>
</tr>

<tr>
<th id="th">성별</th>
<td>
	<input type="radio" name="gender" value="남성">남성
	<input type="radio" name="gender" value="여성">여성
</td>
</tr>

<tr>
<th id="th">생일</th>
<td>
	<input id="in0" type="number" max="2030" min="2000" name="birth1">년
	<select id="sel" name="birth2">
		<option value="01">1</option>
		<option value="02">2</option>
		<option value="03">3</option>
		<option value="04">4</option>
		<option value="05">5</option>
		<option value="06">6</option>
		<option value="07">7</option>
		<option value="08">8</option>
		<option value="09">9</option>
		<option value="10">0</option>
		<option value="11">11</option>
		<option value="12">12</option>
	</select>월
	<select id="sel" name="birth3">
		<option value="01">1</option>
		<option value="02">2</option>
		<option value="03">3</option>
		<option value="04">4</option>
		<option value="05">5</option>
		<option value="06">6</option>
		<option value="07">7</option>
		<option value="08">8</option>
		<option value="09">9</option>
		<option value="10">10</option>
		<option value="11">11</option>
		<option value="12">12</option>
		<option value="13">13</option>
		<option value="14">14</option>
		<option value="15">15</option>
		<option value="16">16</option>
		<option value="17">17</option>
		<option value="18">18</option>
		<option value="19">19</option>
		<option value="20">20</option>
		<option value="21">21</option>
		<option value="22">22</option>
		<option value="23">23</option>
		<option value="24">24</option>
		<option value="25">25</option>
		<option value="26">26</option>
		<option value="27">27</option>
		<option value="28">28</option>
		<option value="29">29</option>
		<option value="30">30</option>
		<option value="31">31</option>
	</select>일
	
</td>
</tr>

<tr>
<th id="th">이메일</th>
<td>
	<input id="in1" type="text" name="mail1" placeholder="이메일">@
	<input id="in1" type="text" name="mail2" value="" disabled>
	<select id="sel" name="mail3" onchange="email_change();">
		<option value="0">선택하세요</option>
		<option value="9">직접입력</option>
		<option value="naver.com">naver.com</option>
		<option value="daum.net">daum.net</option>
	</select>
</td>
</tr>

<tr>
<th id="th">연락처</th>
<td><input id="in" type="text" name="phone"></td>
</tr>

<tr>
<th id="th">주소</th>
<td><input id="in" type="text" name="address"></td>
</tr>

<tr>
<td colspan=2 align=center>
	<input id="b" type="button" value="등록" onclick="check()">
	<input id="b" type="button" value="취소">
</td>
</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
<script>
function check(){
	if(document.form.id.value==""){
		alert("아이디를 입력하세요");	
		document.form.id.focus();
	}else if(document.form.name.value==""){
		alert("이름을 입력하세요");
		document.form.name.focus();
	}else if(document.form.password1.value==""){
		alert("비밀번호를 입력하세요");
		document.form.password1.focus();
	}else if(document.form.password2.value==""){
		alert("비밀번호 확인을 입력하세요");
		document.form.password2.focus();
	}else if(document.form.password1.value != document.form.password2.value){
		alert("비밀번호가 불일치합니다.")
		document.form.password1.focu();
	}else{
		document.form.submit();
	}
}
</script>
<script>
function email_change(){
	if(document.form.mail3.options[document.form.mail3.selectedIndex].value == '0'){
		 document.form.mail2.disabled = true;
		 document.form.mail2.value = "";
	}else if(document.form.mail3.options[document.form.mail3.selectedIndex].value == '9'){
		 document.form.mail2.disabled = false;
		 document.form.mail2.value = "";
		 document.form.mail2.focus();
	}else{
		 document.form.mail2.disabled = true;
		 document.form.mail2.value = document.form.mail3.options[document.form.mail3.selectedIndex].value;
	}
 	
}
</script>
</html>