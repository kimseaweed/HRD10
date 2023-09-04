<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
int result = -1;

Class.forName("oracle.jdbc.OracleDriver");
pstmt = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234")
.prepareStatement("insert into TBL_vote_202005 values(?,?,?,?,?,?)");
pstmt.setString(1, request.getParameter("a"));
pstmt.setString(2, request.getParameter("b"));
pstmt.setString(3, request.getParameter("c"));
pstmt.setString(4, request.getParameter("d"));
pstmt.setString(5, request.getParameter("e"));
pstmt.setString(6, request.getParameter("f"));
try{
	pstmt.executeUpdate();
	out.println("<script> alert('투표하기 정보가 정상적으로 등록되었습니다!'); location.href='index.jsp'; </script>");
}catch(Exception e){
	out.println("<script> alert('투표에 실패했습니다.'); history.back(); </script>");
}


%>
<% if(conn!=null){conn.close();}
if(pstmt!=null){pstmt.close();}
if(rs!=null){rs.close();}%>