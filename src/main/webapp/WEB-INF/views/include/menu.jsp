<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.member.userId==null}">
			<a href="login">로그인</a>
		</c:when>
		<c:otherwise>
			${sessionScope.member.name}님이 로그인중입니다.
			<a href="logout">로그아웃</a>
		</c:otherwise>
	</c:choose>
	&nbsp;
	<a href="boardList">게시판</a>
	<hr>
</body>
</html>