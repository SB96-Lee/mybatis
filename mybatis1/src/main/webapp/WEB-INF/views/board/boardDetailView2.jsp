<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<title>Insert title here</title>
<style>
	.outer table{
		border: 1px solid;
		border-collapse : collapse;
	}
	.outer tr, .outer td {
		border: 1px solid;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="outer">
		<h2>게시판 상세보기</h2>
			<table align="center">
				<tr>
					<td width="100px">글번호</td>
					<td width="400px">${b.boardNo}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>${b.boardTitle}</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${b.boardWriter}</td>
				</tr>
				<tr>
					<td>조회수</td>
					<td>${b.count}</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td>${b.createDate}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${b.boardContent}</td>
				</tr>
			</table>
			<br>
			<table align="center">
				<c:choose>
					<c:when test="${empty loginUser }">
						<tr>
							<td>댓글 작성</td>
							<td><textarea row="3" cols="50" readonly></textarea></td>
							<td><input type="button" value="댓글작성" disabled></td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td>댓글 작성</td>
							<td><textarea row="3" cols="50" id="content"></textarea></td>
							<td><input type="button" id="btn1" value="댓글작성"></td>
						</tr>
					</c:otherwise>
				</c:choose>
				
				
				<tr>
					<td colspan="3" style="text-align:right">댓글 : ${reply.size()}</td>				
				</tr>
				
				<c:forEach var='r' items="${reply }">
					<tr>
						<td>${r.replyWriter}</td>
						<td>${r.replyContent}</td>
						<td>${r.createDate}</td>
					</tr>
				</c:forEach>
			</table>
	</div>
	
	<script>
		$(() => {
		 $('#btn1').click(function() {
				$.ajax({
					url : "detail.bo",
					data: {
						content : ${'#content'}.val(),
						bno : ${b.boardNo},
						writer : "${loginUser.userName}"
					}
					type : post,
					success : function(result) {
						if(result > 0) {
							console.log(result);
						}
					},
					error: function() {
						console.log("ajax통신 실패");
					}
				})
			 }
		})
	</script>
</body>
</html>