<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>

	$(function(){
		$("#btnUpdate").click(function(){
			var pwd = $("#updatePwd").val();
			var bno = ${boardView.bno};
			var obj = {pwd: pwd, bno: bno};
			var myJson = JSON.stringify(obj);
			alert(pwd);
			alert(bno); 
			$.ajax({
				async: true,
				type : 'POST',
				data : myJson,
				url : "pwdCheck",
				dataType : "json",
				contentType: "application/json; charset=UTF-8",
				success : function(data){
					if(data.cnt>0){
						alert("성공")
						document.updateForm.action="boardUpdateView"
						document.updateForm.submit();
					} else{
						alert("비밀번호가 일치하지 않습니다.");
						$("#pwd").focus();
					}
				},
				error : function(error){
					alert("error:"+error);
				}
			});
		});
	});
	
	$(function(){
		$("#btnDelete").click(function(){
			var pwd = $("#deletePwd").val();
			var bno = ${boardView.bno};
			var obj = {pwd: pwd, bno: bno};
			var myJson = JSON.stringify(obj);
			alert(pwd);
			alert(bno); 
			$.ajax({
				async: true,
				type : 'POST',
				data : myJson,
				url : "pwdCheck",
				dataType : "json",
				contentType: "application/json; charset=UTF-8",
				success : function(data){
					if(data.cnt>0){
						alert("성공")
						document.deleteForm.action="boardDelete"
						document.deleteForm.submit();
					} else{
						alert("비밀번호가 일치하지 않습니다.");
						$("#pwd").focus();
					}
				},
				error : function(error){
					alert("error:"+error);
				}
			});
		});
	});
	
	
	function boardDelete() {
		if (confirm("삭제하시겠습니까?")) {
			document.board.action = "boardDelete";
			document.board.submit();
		}
	};

	function boardUpdate() {
		document.board.action = "boardUpdateView";
		document.board.submit();
	};
</script>
</head>
<body>
	<div class="container">
		<%@ include file="../include/menu.jsp"%>
		<h2>게시판 상세보기</h2>
		<table border="1" style="width: 40%">
			<tr>
				<td>제목 : ${boardView.title}</td>
			</tr>
			<tr align="right">
				<td>글쓴이 : ${boardView.writer } &nbsp;&nbsp; 날짜 : <fmt:formatDate
						value="${boardView.reg_date }" pattern="yyyy-MM-dd " /></td>
			</tr>
			<tr align="center">
				<td>내용</td>
			</tr>
			<tr style="height: 400px;" align="center">
				<td>${boardView.content }</td>
			</tr>
		</table>
		<form name="board" method="post">
			<table style="width: 40%">
				<tr align="right">
					<td><c:if test="${boardView.member_idx == 0 }">
							<input type="hidden" name="bno" value="${boardView.bno }">
							<button type="button" data-toggle="modal" data-target="#myModal">수정</button>
							<button type="button" data-toggle="modal" data-target="#myModal2">삭제</button>
						</c:if> <c:if test="${sessionScope.member.idx == boardView.member_idx }">
							<input type="hidden" name="bno" value="${boardView.bno }">
							<button type="button" onclick="boardUpdate()">수정</button> &nbsp;&nbsp;
				<button type="button" onclick="boardDelete()">삭제</button>
						</c:if></td>
				</tr>
			</table>
		</form>

		<!-- 게시판 수정 Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">×</button>
						<h4 class="modal-title" align="center">비밀번호 입력</h4>
					</div>
					<div class="modal-body" align="center">
						<input type="password" name="pwd" id="updatePwd">
					</div>
					<div class="modal-footer">
						<form method="post" name="updateForm">
						<input type="hidden" name="bno" value="${boardView.bno}">
						<button type="button" class="btn btn-default" id="btnUpdate">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 게시판 삭제 Modal -->
		<div class="modal fade" id="myModal2" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">×</button>
						<h4 class="modal-title" align="center">비밀번호 입력</h4>
					</div>
					<div class="modal-body" align="center">
						<input type="password" name="pwd" id="deletePwd">
					</div>
					<div class="modal-footer">
						<form method="post" name="deleteForm">
						<input type="hidden" name="bno" value="${boardView.bno}">
						<button type="button" class="btn btn-default" id="btnDelete">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</body>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</html>





