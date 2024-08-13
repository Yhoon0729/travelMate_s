<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원 삭제</title>
    <style>
        @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        * {
            font-family: 'GmarketSansMedium';
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
             background-color: #fff; /* 전체 배경색 */
            margin: 0;
            padding: 0;
            color: #333;
        }

        .main-container {
              display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            margin: 30px auto;
            width:600px;
        }

        h2 {
            color: #00256C;
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            width: 100%;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
            font-size: 16px;
        }

        input[type="password"], input[type="submit"] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            background-color: #00256C;
            color: white;
            border: none;
            margin-top: 20px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #00396E;
        }
    </style>
</head>
<body>
    <div class="main-container">
        <h2>회원 삭제</h2>
        <form action="userDeletePro" method="post">
            <label for="userPass">비밀번호 입력:</label>
            <input type="password" id="userPass" name="userPass">
            <input type="submit" value="삭제하기">
        </form>
    </div>
</body>
</html>
