<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

Class.forName("oracle.jdbc.OracleDriver");
rs = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234")
.prepareStatement("select v_name,'19'||substr(v_jumin,1,2)||'년'||substr(v_jumin,3,2)||'월'||substr(v_jumin,5,2)||'일','만 '||(2020-TO_NUMBER('19'||substr(v_jumin,1,2)))||'세',decode(substr(v_jumin,7,1),'1','남','2','여','잘못입력'),m_no,substr(v_time,1,2)||':'||substr(v_time,3,2),decode(v_confirm,'y','확인','n','미확인') from TBL_vote_202005 where v_area = '제1투표장'")
.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<section>
<h2>투표검수조회</h2>
<table border="1">
<tr>
	<th>성명</th>
	<th>생년월일</th>
	<th>나이</th>
	<th>성별</th>
	<th>후보번호</th>
	<th>투표시간</th>
	<th>유권자확인</th>
</tr>
<% if( rs.next() ) { 
do{%>
<tr>
	<td><%= rs.getString(1)%></td>
	<td><%= rs.getString(2)%></td>
	<td><%= rs.getString(3)%></td>
	<td><%= rs.getString(4)%></td>
	<td><%= rs.getString(5)%></td>
	<td><%= rs.getString(6)%></td>
	<td><%= rs.getString(7)%></td>
</tr>
<% }while( rs.next() );
}else{ %>
<tr>
	<td colspan="7"> 검색결과가 없습니다. </td>
</tr>
<%} %>
</table>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>
<% if(conn!=null){conn.close();}
if(pstmt!=null){pstmt.close();}
if(rs!=null){rs.close();}%>