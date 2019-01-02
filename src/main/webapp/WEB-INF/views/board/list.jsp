<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btnWrite").click(function(){
			location.href = "boardWrite";
		});
	});
	
	function list(page){
		location.href="boardList?curPage="+page;
	}
</script>
</head>
<body>
	<%@ include file="../include/menu.jsp" %>
	<h2>게시글 목록</h2>
	
	${map.count} 개의 게시물이 있습니다.
	
	<table border="1" style="width: 80%;">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>등록일</th>
		</tr>
			<c:forEach var="list" items="${map.list}">
		<tr align="center">
				<td>${list.bno }</td>
				<td><a href="boardView?bno=${list.bno}" >${list.title }</a> </td>
				<td>${list.writer }</td>
				<td><fmt:formatDate value="${list.reg_date }" pattern="yyyy-MM-dd"/></td>
		</tr>
			</c:forEach>
		<tr align="center">
			<td colspan="5" >
				<a href="javascript:list('1')">[처음]</a>
				<a href="javascript:list('${map.page.prevPage}')">[이전]</a> &nbsp;
				<c:forEach var="num" begin="${map.page.blockBegin }" end="${map.page.blockEnd }" step="1">
					<c:choose>
						<c:when test="${num==map.page.curPage}">
							<span style="color:red">${num}</span> &nbsp;
						</c:when>
						<c:otherwise>
							<a href="javascript:list('${num }')">${num}</a> &nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<a href="javascript:list('${map.page.nextPage}')">[다음]</a>
				
				<c:if test="${map.page.curBlock <= map.page.totPage }">
					<a href="javascript:list('${map.page.totPage}')">[끝]</a>
				</c:if>
			</td>
		</tr>			
	</table>
	<br>
	<table  style="width: 80%;">
		<tr align="right">
			<td>
				<button type="button" id="btnWrite">글쓰기</button>
			</td>
		</tr>
	</table>
</body>
</html>