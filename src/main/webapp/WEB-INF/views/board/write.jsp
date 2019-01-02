<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		var pwd = $("#pwd").val();
			
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
		if(pwd==""){
			alert("비밀번호를 입력하세요.");
			$("#pwd").focus();
			return false;
		}
	}
</script>
</head>
<body>
	<%@include file="../include/menu.jsp" %>
	<h2>게시글 작성</h2>
	<form name="form1" method="post" action="boardInsert" onsubmit="return confirm()">
		<div>
			제목 <input type="text" name="title" id="title" size="80"
				placeholder="제목을 입력해주세요">
		</div>
		<div>
			내용
			<textarea name="content" id="content" rows="4" cols="80"
				placeholder="내용을 입력해주세요"></textarea>
		</div>
		
		<c:if test="${sessionScope.member.userId==null }">
		<div>
			이름 <input type="text" name="writer" id="writer" placeholder="이름을 입력해주세요"> &nbsp;
			비밀번호 <input type="password" name="pwd" id="pwd" >
		</div>
		</c:if>
		<br>
		<div style="width: 650px; text-align: center">
			<button type="submit">확인</button>
			<button type="button" onclick="history.back()">취소</button>
		</div>
	</form>
</body>
</html>