<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="service.*" %>
    <%@ page import ="java.text.*" %>
    <%@ page import ="java.util.Date" %>
<%@ page import ="member.*" %>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>

<%request.setCharacterEncoding("utf-8"); %>
<%
	if(request.getMethod().equals("POST")){
		%>
		<jsp:useBean id="member" class ="member.Member">
		<jsp:setProperty  name="member" property="*"/>
		</jsp:useBean>
		<% 		
		Date d = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		member.setRegdate(new Timestamp(System.currentTimeMillis()));
		WriteMemberService wmService = WriteMemberService.getInstance();
		wmService.register(member);
		out.print("회원 등록 되었습니다.");
		%><br><a href="index.jsp">메인으로 가기</a><%
	}else{
%>
<meta charset="UTF-8">
<title>회원 등록 페이지</title>
</head>
<body>
<form method="post">
	<table border="1" >
		<tr>
			<td>아이디</td>
			<td><input type ="text" name ="id"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type ="text" name ="name"></td>
		</tr>	
		<tr>
			<td>전화번호</td>
			<td><input type ="text" name ="tel"></td>
		</tr>
		<tr>
			<td><input type ="submit" value ="등록"></td>
		</tr>
		
	</table>
</form>
</body><%} %>
</html>