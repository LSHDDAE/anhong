<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	function confirm(){
		var title = $("#title").val();
		var content = $("#content").val();
		var writer = $("#writer").val();
			
		if(title==""){
			alert("제목을 입력하세요.");
			$("#title").focus();
			return false;
		}
		if(content==""){
			alert("내용을 입력하세요.");
			$("#content").focus();
			return false;
		}
		if(writer==""){
			alert("이름을 입력하세요.");
			$("#writer").focus();
			return false;
		}
	}
</script>
</head>
<body>
	<h2>게시글 수정</h2>
	<form name="form1" method="post" action="boardUpdate" onsubmit="return confirm()">
		<input type="hidden" name="bno" value="${updateView.bno }">
		<input type="hidden" name="writer" value="${sessionScope.name }">
		<div>
			제목 <input type="text" name="title" id="title" size="80"
				placeholder="제목을 입력해주세요" value="${updateView.title }">
		</div>
		<div>
			내용
			<textarea name="content" id="content" rows="4" cols="80"
				placeholder="내용을 입력해주세요" >${updateView.content}</textarea>
		</div>
		
		<c:if test="${sessionScope.name != updateView.writer }">
		<div>
			이름 <input type="text" name="writer" id="writer"
				placeholder="이름을 입력해주세요" value="${updateView.writer }">
		</div>
			<div>
			비번 <input type="password" name="pwd" id="pwd"
				value="${updateView.pwd }">
		</div>
		</c:if>
		
		<div style="width: 650px; text-align: center">
			<button type="submit">확인</button>
			<button type="button" onclick="history.back()">취소</button>
		</div>
	</form>
</body>
</html>