<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="service.*" %>
    <%@page import="member.*" %>
    <%@page import="java.util.*" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<%
	String getName = request.getParameter("name").toString();
	GetMemberListService gmListService = GetMemberListService.getInstance();
	List<Member> memberList = gmListService.findByName(getName);
%>
<%if(memberList.isEmpty()){
%>등록된 회원이 없습니다.<br>	<a href ="index.jsp">메인으로 가기</a><% 
}else{
%>
<meta charset="UTF-8">
<title>검색된 회원</title>
</head>
<body>
<h1>회원 명단</h1>
<table border ="1" width ="100%">
	<tr>
	<td>아이디</td>
	<td>이름</td>
	<td>전화번호</td>
	<td>가입일</td>
	<td>변경여부</td>
	<td>삭제여부</td>
	</tr>
	<c:set var="memberList" value="<%=memberList %>"/>
<c:forEach var="member" items="${memberList }">
	<tr>
	<td>${member.id}</td>
	<td>${member.name}</td>
	<td>${member.tel}</td>
	<td>${member.regdate}</td>
	<td><a href ="edit.jsp?id=${member.id }">수정</a></td>
	<td><a href ="delete.jsp?id=${member.id}">삭제</a></td>
	</tr>
	</c:forEach>
</table>
<a href ="search_result.jsp">[1]<a><a href ="index.jsp">[메인으로 가기]</a>
</body><%} %>
</html>