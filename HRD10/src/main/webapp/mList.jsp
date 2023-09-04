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
.prepareStatement("select m.m_no,p.p_name,p.p_code,decode(m.p_school,'1','고졸','2','학사','3','석사','4','박사'),substr(m.m_jumin,1,6)||'-'||substr(m.m_jumin,7,7),m.m_city,RTRIM(p.p_tel1)||'-'||p.p_tel2||'-'||p.p_tel3 from TBL_member_202005 m join TBL_party_202005 p on m.p_code = p.p_code")
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
<h2>후보조회</h2>
<table border="1">
<tr>
	<th>후보번호</th>
	<th>성명</th>
	<th>소속정당</th>
	<th>학력</th>
	<th>주민번호</th>
	<th>지역구</th>
	<th>대표전화</th>
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