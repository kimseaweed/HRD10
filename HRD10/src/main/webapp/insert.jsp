<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<section>
<h2>투표하기</h2>
<form action="action.jsp" name="z">
<table border="1">
<tr>
	<th>주민번호</th>	
	<td class="left"> <input type="text" NAME="a"> 예:8906153154726 </td>
</tr>
<tr>
	<th>성명</th>	
	<td class="left"> <input type="text" NAME="b"> </td>
</tr>
<tr>
	<th>투표번호</th>	
	<td class="left">
		<select name="c">
			<option value="">투표번호 선택</option>
			<option value="1">[1]김후보</option>
			<option value="2">[2]이후보</option>
			<option value="3">[3]박후보</option>
			<option value="4">[4]조후보</option>
			<option value="5">[5]최후보</option>
		</select>
	</td>
</tr>
<tr>
	<th>투표시간</th>	
	<td class="left"> <input type="text" NAME="d"> </td>
</tr>
<tr>
	<th>투표장소</th>	
	<td class="left"> <input type="text" NAME="e"> </td>
</tr>
<tr>
	<th>유권자확인</th>	
	<td class="left">
		<label><input type="radio" value="y" name="f">확인 </label>
		<label><input type="radio" value="n" name="f">미확인 </label>
	</td>
</tr>
<tr>
	<td colspan="2"> <input type="button" value="투표하기" onclick="subm()"> <input type="reset" value="다시하기" onclick="alert('정보를 지우고 처음부터 다시 입력합니다!'); document.z.a.focus()"> </td>
</tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp"/>
<script type="text/javascript">
function subm(){
var z = document.z;
if(z.a.value==""){
	alert('주민번호가 입력되지 않았습니다.');
	z.a.focus();
}else if(z.b.value==""){
	alert('성명이 입력되지 않았습니다.');
	z.b.focus();
}else if(z.c.value==""){
	alert('투표번호가 선택되지 않았습니다.');
	z.c.focus();
}else if(z.d.value==""){
	alert('투표시간이 입력되지 않았습니다.');
	z.d.focus();
}else if(z.e.value==""){
	alert('투표장소가 입력되지 않았습니다.');
	z.e.focus();
}else if(z.f.value==""){
	alert('유권자확인이 선택되지 않았습니다.');
	z.f.focus();
}else {
	z.submit();
}
	
}
</script>
</body>
</html>
