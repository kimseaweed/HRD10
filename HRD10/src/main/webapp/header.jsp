<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{margin:0;padding:0;}
h1,h2,h3{text-align: center; padding:20px 30px}
section{
 background-color: lightgray;
 min-height:60vh;
 padding-bottom:150px;
}
header{
 background-color: gray
}
nav{
 background-color: darkgray
}
ul{
display: flex;
}
li{
list-style: none;
padding:5px 15px;
}
a{
text-decoration: none;
}
footer{
 background-color: gray;
}
table{
margin:10px auto;
}
th,td{
text-align: center;
padding:5px 10px;
}
td.left{
text-align: left;
padding:5px 10px;
}

</style>
</head>
<body>
<header><h1>(과정평가형 정보처리산업기사) 지역구의원 투표 프로그램 ver 2020-05</h1> </header>
<nav><ul>
<li><a href="mList.jsp">후보조회</a></li>
<li><a href="insert.jsp">투표하기</a></li>
<li><a href="vList.jsp">투표검수조회</a></li>
<li><a href="rList.jsp">후보자등수</a></li>
<li><a href="index.jsp">홈으로</a></li>
</ul> </nav>
</body>
</html>