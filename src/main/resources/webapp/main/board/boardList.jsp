<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 목록</title>
    <!-- 부트스트랩 CSS 링크 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">${boardName} 목록</h2>

        <!-- 글 작성 버튼 -->
        <a href="boardForm" class="btn btn-primary mb-3">글 작성</a>

        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col">작성일</th>
                    <th scope="col">조회수</th>
                </tr>
            </thead>
            <tbody>
                <c:set var="boardNum" value="${boardNum }" />
                <c:forEach var="board" items="${li}" varStatus="status">
                    <tr>
                    	<td>${boardNum}</td>
						<c:set var="boardNum" value="${boardNum-1 }" />
                        <td><a href="boardInfo?boardNum=${board.boardNum}">${board.boardSub}</a></td>
                        <td>${board.userId}</td>
                        <td><fmt:formatDate value="${board.boardDate}" pattern="yyyy-MM-dd"/></td>
                        <td>${board.boardCnt}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- 페이지네이션 -->
        <c:if test="${maxPage > 1}">
            <ul class="pagination justify-content-center">
                <c:choose>
                    <c:when test="${start > 1}">
                        <li class="page-item"><a class="page-link" href="boardList?boardId=${boardId}&pageNum=${start-1}">이전</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item disabled"><span class="page-link">이전</span></li>
                    </c:otherwise>
                </c:choose>
                <c:forEach var="i" begin="${start}" end="${end}">
                    <li class="page-item <c:if test="${i == currentPage}">active</c:if>">
                        <a class="page-link" href="boardList?boardId=${boardId}&pageNum=${i}">${i}</a>
                    </li>
                </c:forEach>
                <c:choose>
                    <c:when test="${end < maxPage}">
                        <li class="page-item"><a class="page-link" href="boardList?boardId=${boardId}&pageNum=${end+1}">다음</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item disabled"><span class="page-link">다음</span></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </c:if>
    </div>

    <!-- 부트스트랩 및 jQuery 스크립트 링크 -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
