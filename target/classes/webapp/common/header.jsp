<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header Example</title>
<style>
@font-face {
    font-family: 'TmonMonsori';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/TmonMonsori.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body {
    font-family: 'NanumSquare', sans-serif;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

#header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px 40px;
    background-color: #fff;
    font-family: 'GmarketSansMedium';
}

#header .logo {
    position: relative; /* 부모 요소를 기준으로 자식 요소 절대 위치 */
}

#header .logo img {
    position: absolute; /* 부모 요소를 기준으로 절대 위치 */
    height: 100px; /* 원하는 높이로 설정 */
    width: auto; /* 너비는 자동 조정 */
    bottom: -59px;
}

#header .logo-text {
 margin-left: 300px;
}

nav {
    display: flex;
    width: 100%;
    justify-content: space-between;
    align-items: center;
    margin: 3px 13px;
    margin-top: 6px;
    margin-right: 18px;
}

nav ul {
    list-style: none;
    display: flex;
    gap: 20px;
    padding: 0;
    margin: 0;
    margin-right: 5px;
}

nav .left-menu {
    flex: 1;
}

nav .center-menu {
    flex: 1;
    display: flex;
    justify-content: center;
    font-size: 17px;
    margin-left: 300px;
}

nav .right-menu {
    flex: 1;
    display: flex;
    justify-content: flex-end;
    font-size: 14px;
}

nav .right-menu a {
    color: #A9A9A9;
}

nav ul li {
    display: inline;
}

nav ul li a {
    text-decoration: none;
    color: black;
}

.logo a {
    text-decoration: none;
    color: #000;
}
</style>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous">
<!-- Google Fonts Link -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
	
    <div id="header" style="margin-bottom:15px;">
        <h2 class="logo">
            <a href="${pageContext.request.contextPath}/">
                <img src="<%=request.getContextPath()%>/img/logo/Logo.png" alt="TravelMate Logo">
            </a>
        </h2>
        <h2 style="margin-left: 120px; margin-top: 20px;">TravelMate</h2>
        <nav>
            <ul class="center-menu">
					<c:if test="${sessionScope.userId == 'admin' }">
					<li><a href="${pageContext.request.contextPath}/adm/logList">로그기록</a></li>
					<li><a href="${pageContext.request.contextPath}/tra/festivalList">상품입력</a></li>
					</c:if>
                </ul>
                <ul class="right-menu">
				<li><a href="${pageContext.request.contextPath}/board/boardList?boardId=1">게시판</a></li>

				<c:if test="${sessionScope.userId == null }">
					<li><a href="${pageContext.request.contextPath}/user/login">로그인</a></li>
					<li><a href="${pageContext.request.contextPath}/user/join">회원가입</a></li>
				</c:if>
				
				<c:if test="${sessionScope.userId != null }">
					<li><a href="${pageContext.request.contextPath}/booking/userBooking">예약확인</a></li>
					<li><a href="${pageContext.request.contextPath}/user/joinInfo">${userId }님</a></li>
					<li><a href="${pageContext.request.contextPath}/user/logout">로그아웃</a></li>
				</c:if>
			</ul>
        </nav>
    </div>
   
</body>
</html>
