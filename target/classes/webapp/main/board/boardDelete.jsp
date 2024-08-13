<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        body { font-family: Arial, sans-serif; }
        .container { width: 300px; margin: auto; margin-top: 50px; }
        form { display: flex; flex-direction: column; }
        label, input { margin: 10px 0; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Delete Post</h2>
        <form action="boardDeletePro" method="post">
            <input type="hidden" name="boardNum" value="${boardNum}">
            <label for="pass">Password:</label>
            <input type="password" id="pass" name="pass" required><br>
            <input type="hidden" name="boardId" value="${boardId}">
            <input type="submit" value="Delete">
        </form>
    </div>
</body>
</html>