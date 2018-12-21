<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import ="java.sql.*" %>
    <%@page import ="java.text.*" %>
    <%@page import ="java.util.Date" %>
     <%@page import ="member.*" %>
     <%@page import ="service.*" %>
     <%request.setCharacterEncoding("utf-8") ;%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
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
			GetMemberListService gmListService = GetMemberListService.getInstance();
			gmListService.update(member);
			out.print("회원정보가 변경 되었습니다.");
	%><br><a href ="index.jsp">[메인으로 가기]</a><%
	}else{
			String id =request.getParameter("id").toString();
			GetMemberListService gmListService2 = GetMemberListService.getInstance();
			Member findMember = gmListService2.findByid(id);
	%>
<meta charset="UTF-8">
<title>수정페이지</title>
</head>
<c:set var="member" value="<%=findMember %>" />
<body>
<form method="post">
	<table border="1" >
		<tr>
			<td>아이디</td>
			<td><input type ="text" name ="id" value ="${member.id}" readOnly></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type ="text" name ="name" value ="${member.name }"></td>
		</tr>	
		<tr>
			<td>전화번호</td>
			<td><input type ="text" name ="tel" value ="${member.tel}"></td>
		</tr>
		<tr>
			<td><input type ="submit" value ="변경"></td>
		</tr>
		
	</table>
</form>

</body><%} %>
</html>