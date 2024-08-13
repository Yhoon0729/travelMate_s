<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        body { font-family: Arial, sans-serif; }
        .container { width: 500px; margin: auto; margin-top: 50px; }
        form { display: flex; flex-direction: column; }
        label, input, textarea { margin: 10px 0; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Post</h2>
        <form action="boardUpdatePro" method="post" enctype="multipart/form-data">
            <input type="hidden" name="boardNum" value="${board.boardNum}">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" value="${board.title}" required><br>
            <label for="content">Content:</label>
            <textarea id="content" name="content" required>${board.content}</textarea><br>
            <label for="boardFile">File:</label>
            <input type="file" id="boardFile" name="boardFile"><br>
            <c:if test="${board.boardFile != null}">
                <p>Current File: ${board.boardFile}</p>
            </c:if>
            <input type="submit" value="Update">
        </form>
    </div>
</body>
</html>