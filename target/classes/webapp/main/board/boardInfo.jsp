<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세 정보</title>
<script>
function enterkey(num) {
	if (window.event.keyCode == 13)
		commentPro(num)
}

function commentPro(num) {
	const comment = document.querySelector("#comment").value
	const commentList = document.querySelector("#commentList")
	const url="${pageContext.request.contextPath}/board/boardCommentPro"
	const param = '?commCon=' + comment+'&boardNum=' +num
	fetch(url+param)
	.then(res => res.text())
	.then(txt => {
		commentList.innerHTML=txt + commentList.innerHTML
	})
	document.querySelector("#comment").value=""
	if (comment=='') {
		document.querySelector("#comment").focus()
		return
	}
}
</script>
</head>
<body>
	<h2>${board.boardSub}</h2>
	<p>작성자: ${board.userId}</p>
	<p>
		작성일:
		<fmt:formatDate value="${board.boardDate}" pattern="yyyy-MM-dd" />
	</p>
	<p>조회수: ${board.boardCnt}</p>
	<p>내용: ${board.boardCon}</p>

	<hr>
		<!-- 댓글 작성 폼 -->
	<textarea id="comment" rows="3" cols="50"
		onkeydown="enterkey(${board.boardNum})"></textarea>
	<br>
	<button onclick="commentPro(${board.boardNum})">댓글 등록</button>
	
	<!-- 댓글 목록 -->
	<h3>댓글 목록</h3>

	<c:forEach var="c" items="${li}">
		<div class="row" id="commentList">
		<hr>
			<p>${c.userId}</p>
			<p>${c.commCon}</p>
			<p><fmt:formatDate value="${c.commDate}" pattern="yyyy/MM/dd HH:mm:ss"/></p>
		</div>
	</c:forEach>

	<hr>


</body>
</html>