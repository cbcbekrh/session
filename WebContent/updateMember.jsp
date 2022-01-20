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
	String id=request.getParameter("id");
	pstmt=conn.prepareStatement("select * from member0117 where id=?");
	pstmt.setString(1, id);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String name=rs.getString("name");
		String password=rs.getString("password");
		String gender=rs.getString("gender");
		String birth=rs.getString("birth");
		String mail=rs.getString("mail");
		String phone=rs.getString("phone");
		String address=rs.getString("address");
		
		String birth1=birth.substring(0, 4);
		String birth2=birth.substring(5, 7);
		String birth3=birth.substring(8, 10);
		
		String m[]=mail.split("@");
		
				
		

%>
<h1 id="h1">회원 가입 등록 화면</h1><hr>
<form name="form" method="post" action="updateMember_process.jsp">
<table border=1 id="t1">
<tr>
<th id="th">아이디</th>
<td><input id="in" type="text" name="id" value="<%=id %>"></td>
</tr>

<tr>
<th id="th">성명</th>
<td><input id="in" type="text" name="name" value="<%=name %>"></td>
</tr>

<tr>
<th id="th">비밀번호</th>
<td><input id="in" type="password" name="password1" value="<%=password %>"></td>
</tr>

<tr>
<th id="th">비밀번호 확인</th>
<td><input id="in" type="password" name="password2" value="<%=password %>"></td>
</tr>

<tr>
<th id="th">성별</th>
<td>
	<input type="radio" name="gender" value="남성" <%= gender.equals("남성") ? "checked" : "" %>>남성
	<input type="radio" name="gender" value="여성" <%= gender.equals("여성") ? "checked" : "" %>>여성
</td>
</tr>

<tr>
<th id="th">생일</th>
<td>
	<input id="in0" type="number" max="2030" min="2000" name="birth1" value="<%=birth1 %>">년
	<select id="sel" name="birth2">
		<option value="01" <%= birth2.equals("01") ? "selected" : "" %>>1</option>
		<option value="02" <%= birth2.equals("02") ? "selected" : "" %>>2</option>
		<option value="03" <%= birth2.equals("03") ? "selected" : "" %>>3</option>
		<option value="04" <%= birth2.equals("04") ? "selected" : "" %>>4</option>
		<option value="05" <%= birth2.equals("05") ? "selected" : "" %>>5</option>
		<option value="06" <%= birth2.equals("06") ? "selected" : "" %>>6</option>
		<option value="07" <%= birth2.equals("07") ? "selected" : "" %>>7</option>
		<option value="08" <%= birth2.equals("08") ? "selected" : "" %>>8</option>
		<option value="09" <%= birth2.equals("09") ? "selected" : "" %>>9</option>
		<option value="10" <%= birth2.equals("10") ? "selected" : "" %>>0</option>
		<option value="11" <%= birth2.equals("11") ? "selected" : "" %>>11</option>
		<option value="12" <%= birth2.equals("12") ? "selected" : "" %>>12</option>
	</select>월
	<select id="sel" name="birth3">
		<option value="01" <%= birth3.equals("01") ? "selected" : "" %>>1</option>
		<option value="02" <%= birth3.equals("02") ? "selected" : "" %>>2</option>
		<option value="03" <%= birth3.equals("03") ? "selected" : "" %>>3</option>
		<option value="04" <%= birth3.equals("04") ? "selected" : "" %>>4</option>
		<option value="05" <%= birth3.equals("05") ? "selected" : "" %>>5</option>
		<option value="06" <%= birth3.equals("06") ? "selected" : "" %>>6</option>
		<option value="07" <%= birth3.equals("07") ? "selected" : "" %>>7</option>
		<option value="08" <%= birth3.equals("08") ? "selected" : "" %>>8</option>
		<option value="09" <%= birth3.equals("09") ? "selected" : "" %>>9</option>
		<option value="10" <%= birth3.equals("10") ? "selected" : "" %>>10</option>
		<option value="11" <%= birth3.equals("11") ? "selected" : "" %>>11</option>
		<option value="12" <%= birth3.equals("12") ? "selected" : "" %>>12</option>
		<option value="13" <%= birth3.equals("13") ? "selected" : "" %>>13</option>
		<option value="14" <%= birth3.equals("14") ? "selected" : "" %>>14</option>
		<option value="15" <%= birth3.equals("15") ? "selected" : "" %>>15</option>
		<option value="16" <%= birth3.equals("16") ? "selected" : "" %>>16</option>
		<option value="17" <%= birth3.equals("17") ? "selected" : "" %>>17</option>
		<option value="18" <%= birth3.equals("18") ? "selected" : "" %>>18</option>
		<option value="19" <%= birth3.equals("19") ? "selected" : "" %>>19</option>
		<option value="20" <%= birth3.equals("20") ? "selected" : "" %>>20</option>
		<option value="21" <%= birth3.equals("21") ? "selected" : "" %>>21</option>
		<option value="22" <%= birth3.equals("22") ? "selected" : "" %>>22</option>
		<option value="23" <%= birth3.equals("23") ? "selected" : "" %>>23</option>
		<option value="24" <%= birth3.equals("24") ? "selected" : "" %>>24</option>
		<option value="25" <%= birth3.equals("25") ? "selected" : "" %>>25</option>
		<option value="26" <%= birth3.equals("26") ? "selected" : "" %>>26</option>
		<option value="27" <%= birth3.equals("27") ? "selected" : "" %>>27</option>
		<option value="28" <%= birth3.equals("28") ? "selected" : "" %>>28</option>
		<option value="29" <%= birth3.equals("29") ? "selected" : "" %>>29</option>
		<option value="30" <%= birth3.equals("30") ? "selected" : "" %>>30</option>
		<option value="31" <%= birth3.equals("31") ? "selected" : "" %>>31</option>
	</select>일
	
</td>
</tr>

<tr>
<th id="th">이메일</th>
<td>
	<input id="in1" type="text" name="mail1" placeholder="이메일" value="<%=m[0] %>">@
	<input id="in1" type="text" name="mail2"  value="<%=m[1] %>" disabled >
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
<td><input id="in" type="text" name="phone" value="<%= phone%>"></td>
</tr>

<tr>
<th id="th">주소</th>
<td><input id="in" type="text" name="address" value="<%=address %>"></td>
</tr>

<tr>
<td colspan=2 align=center>
	<input id="b" type="button" value="수정" onclick="check()">
	<input id="b" type="button" value="취소">
</td>
</tr>
<%} %>
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