<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
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
        }

        .form-container {
        	margin: 30px auto;
            width: 600px;
            padding: 30px 40px;
            background-color: #FFFFFF;
            border-radius: 15px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-top: 20px;
            color: #767676;
        }

        .form-header {
            width: 100%;
            display: flex;
            justify-content: space-between;
            margin-bottom: 25px;
            color: #00256C;
            font-size: 24px;
        }

        .input-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-size: 16px;
            color: #333;
        }

        input[type="text"], input[type="password"], select {
            width: 100%;
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #00256C;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #00396E;
        }
    </style>
</head>
<body>
    <div class="main-container">
        <h2>회원 정보 수정</h2>
        <div class="form-container">
            <form action="userUpdatePro" method="post">
                <div class="form-header">
                    <h3>회원 정보</h3>
                </div>
                <div class="input-group">
                    <label for="userId">아이디:</label>
                    <input type="text" id="userId" name="userId" value="${user.userId}" readonly>
                </div>
                <div class="input-group">
                    <label for="userPass">비빌번호:</label>
                    <input type="password" id="userPass" name="userPass">
                </div>
                <div class="input-group">
                    <label for="userName">이름:</label>
                    <input type="text" id="userName" name="userName" value="${user.userName}">
                </div>
                <input type="submit" value="수정하기">
            </form>
        </div>
    </div>
</body>
</html>
