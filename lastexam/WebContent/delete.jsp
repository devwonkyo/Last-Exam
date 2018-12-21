<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
    <%@page import ="service.*" %>
    <%@page import ="member.*" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>삭제 페이지</title>
</head>
<body>

<%
 String id =request.getParameter("id").toString();
	DeleteMemberService dmService = DeleteMemberService.getInstance();
	dmService.delete(id);
out.print("삭제 하였습니다..");
%>
<br><a href ="index.jsp">[메인으로 가기]</a>

</body>
</html>