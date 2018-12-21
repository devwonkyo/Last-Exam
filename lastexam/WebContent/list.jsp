<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%request.setCharacterEncoding("utf-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import ="service.*"%>
    <%@ page import ="java.util.*"%>
    <%@ page import ="member.*"%>
<!DOCTYPE html>
<html>
<head>
<% 
	int pageNumber=1;
	if(request.getParameter("pageNumber")!=null){
	 pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
	}
	List<Member> memberList =new ArrayList<Member>();
	GetMemberListService gmListService =GetMemberListService.getInstance();
	memberList = gmListService.findAll(pageNumber); 
	GetMemberListService service = GetMemberListService.getInstance();
	List<Integer> pagination =service.getPagination();
%>
<meta charset="UTF-8">
<title>회원 정보 리스트</title>
</head>
<body>
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
<c:set var="pagination" value="<%=pagination%>"/>
<c:forEach items="${pagination}" var="page">
	<a href="list.jsp?pageNumber=${page}">${page}</a>
</c:forEach><a href ="index.jsp">[메인으로 가기]</a>
</body>
</html>