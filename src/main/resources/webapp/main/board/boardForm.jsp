<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <h2>Create New Post</h2>
        <form action="boardPro" method="post" enctype="multipart/form-data">
            <label for="title">Title:</label>
            <input type="text" id="title" name="boardSub" required><br>
            <label for="content">Content:</label>
            <textarea id="content" name="boardCon" required></textarea><br>
            <label for="boardFile">File:</label>
            <input type="file" id="boardFile" name="boardFile2"><br>
            <input type="submit" value="Submit">
        </form>
    </div>
</body>

</html>
