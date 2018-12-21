<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="service.*" %>
    <%@page import="member.*" %>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 검색 페이지</title>
</head>
<body>
<h1>검색할 회원 이름을 입력하세요</h1>
<form action="search_result.jsp" method ="post">
<table border ="1">
<tr>
	<td>이름</td>
	<td><input type ="text" name ="name"></td>
	<td><input type ="submit" value ="검색"> </td>
</tr>
</table>
<a href ="index.jsp">[메인으로 가기]</a>
</form>
</body>
</html>