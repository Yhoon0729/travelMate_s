<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입 정보</title>
<style>
    @font-face {
        font-family: 'GmarketSansMedium';
        src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }
    
    * {
        font-family: 'GmarketSansMedium', sans-serif; /* 폰트 일관성 */
        box-sizing: border-box;
       
    }

    body {

    	margin:30px auto;
        background-color: #fff; /* 배경색 변경 */
        min-height: 100vh;
    }

    main {
        flex: 1;
        display: flex;
        justify-content: center;
        width: 100%;
        padding: 20px;
    }

    .infoBox {
        background-color: #ffffff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 80%; /* 상자 크기 조정 */
        max-width: 800px;
    }

    h2 {
        color: #00256C;
        text-align: center;
        margin: 20px 0;
    }

    .infoBox p {
        margin: 10px 0;
        font-size: 16px;
        color: #333; /* 텍스트 색상 조정 */
    }

    .buttons {
        width: 100%;
        display: flex;
        justify-content: center;
        margin: 20px 0;
    }

    .buttons button {
        background-color: #00256C;
        color: white;
        border: none;
        border-radius: 5px;
        padding: 10px 20px;
        cursor: pointer;
        margin: 0 10px;
    }

    .buttons button:hover {
        background-color: #00396E;
    }
</style>
</head>
<body>
    <h2>회원가입 정보</h2>
    <main>
        <div class="infoBox">
            <p><strong>아이디:</strong> ${user.userId}</p>
            <p><strong>이름:</strong> ${user.userName}</p>
            <p><strong>전화번호:</strong> ${user.userTel}</p>
            <p><strong>나이:</strong> ${user.userAge}</p>
            <p><strong>성별:</strong> ${user.userGen == 1 ? "남" : "여"}</p>
        </div>
    </main>
    <div class="buttons">
        <button onclick="location.href='${pageContext.request.contextPath}/user/userUpdate'">회원정보수정</button>
        <button onclick="location.href='${pageContext.request.contextPath}/user/userPass'">비밀번호 변경</button>
        <button onclick="location.href='${pageContext.request.contextPath}/user/userDelete'">회원탈퇴</button>
    </div>
</body>
</html>
