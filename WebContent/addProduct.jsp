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
<section>
<h1 id="h1">상품 등록 화면</h1>
<form name="form" method="post" action="addProduct_process.jsp">
<hr><table border=1 id="t0">
<tr>
<th id="th">상품코드</th>
<td><input id="in" type="text" name="productid"></td>
</tr>

<tr>
<th id="th">상품명</th>
<td><input id="in" type="text" name="name"></td>
</tr>

<tr>
<th id="th">가격</th>
<td><input id="in" type="text" name="unitprice"></td>
</tr>

<tr>
<th id="th">상세정보</th>
<td><input id="in" type="text" name="description"></td>
</tr>

<tr>
<th id="th">제조사</th>
<td><input id="in" type="text" name="manufacturer"></td>
</tr>

<tr>
<th id="th">분류</th>
<td><input id="in" type="text" name="category"></td>
</tr>

<tr>
<th id="th">재고수</th>
<td><input id="in" type="text" name="unitsinstock"></td>
</tr>

<tr>
<th id="th">상태</th>
<td>
	<input type="radio" name="condition" value="신규제품">신규제품
	<input type="radio" name="condition" value="중고제품">중고제품
	<input type="radio" name="condition" value="재생제품">재생제품
</td>
</tr>

<tr>
<td colspan=2 align=center>
	<input id="b" type="button" value="등록" onclick="check()">	
	<input id="b" type="button" value="취소">
</td>
</tr>


</table><hr>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
<script>
function check(){
	if(document.form.name.value == ""){
		alert("상품명을 입력하세요");
		document.form.name.focus();
	}else if(document.form.name.value.length < 4){
		alert("최소 4자리 이상 50자리 미만으로 입력하세요");
		document.form.name.focus();
	}else if(document.form.name.value.length > 50){
		alert("최소 4자리 이상 50자리 미만으로 입력하세요");
		document.form.name.focus();
	}else if(isNaN(document.form.unitprice.value)){
		alert("가격은 숫자만 입력 가능합니다");
		document.form.unitprice.focus();
	}else if(document.form.unitprice.value < 0){
		alert("음수는 입력할수 없습니다");
		document.form.unitprice.focus();
	}else{
		document.form.submit();
	}
	
}
</script>
</html>