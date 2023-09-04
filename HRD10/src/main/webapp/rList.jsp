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
.prepareStatement("select m.m_no,m.m_name,count(v.m_no) from TBL_member_202005 m left join TBL_vote_202005 v on m.m_no = v.m_no group by m.m_no,m.m_name order by count(v.m_no) DESC")
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
<h2>후보자등수</h2>
<table border="1">
<tr>
	<th>후보번호</th>
	<th>성명</th>
	<th>총투표건수</th>
</tr>
<% if( rs.next() ) { 
do{%>
<tr>
	<td><%= rs.getString(1)%></td>
	<td><%= rs.getString(2)%></td>
	<td><%= rs.getString(3)%></td>
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