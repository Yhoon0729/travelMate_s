<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer Example</title>

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
    #footer {
        background: #f8f8f8;
        padding: 40px 20px;
        text-align: left;
        border-top: 1px solid #e7e7e7;
    }
    .footer-content {
        max-width: 1200px;
        margin: 0 auto;
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
    }
    .footer-section {
        flex: 1;
        min-width: 200px;
        margin: 20px 0;
    }
    .footer-section h3 {
        font-family: 'TmonMonsori';
        margin-bottom: 20px;
    }
    .footer-section p, .footer-section a {
        font-family: 'GmarketSansMedium';
        color: #333;
        text-decoration: none;
        margin: 5px 0;
        display: block;
    }
    .social-icons {
        display: flex;
        align-items: center;
        margin-top: 20px;
    }
    .social-icons a {
        display: flex;
        align-items: center;
        color: #333;
        text-decoration: none;
        margin-right: 20px;
    }
    .social-icons img {
        width: 30px;
        margin-right: 10px;
    }
</style>

</head>
<body>
    <!-- 푸터 시작 -->
<div id="footer" >
    <div class="footer-content" style="margin-bottom:30px; ">
        <div class="footer-section">
            <h3>Address & Contact</h3>
            <p>대표번호: 1588-0000</p>
            <p>서울특별시 강남구 역삼동 819-10 세경빌딩 3층</p>
        </div>
        <div class="footer-section">
            <h3>트레블메이트 Information</h3>
            <p>(주)트레블메이트 대표: 김영훈</p>
            <p>서울특별시 강남구 역삼동 819-10 세경빌딩 3층</p>
            <p>본사 사업자등록번호: 104-81-000000</p>
            <p>관광사업자등록번호: 제1999-000호</p>
            <p>통신판매업신고번호: 제2024-0077</p>
        </div>
        <div class="footer-section">
            <h3>Follow Us</h3>
            <p>여행자 배상책임보험 20억원 가입</p>
            <p>일반여행 보증보험 15억원 가입</p>
            <p>copyrights 2022. all rights reserved by (주)트레블메이트</p>
            <div class="social-icons">
                <a href="#"><img src="<%=request.getContextPath()%>/img/footer/Frame.png" alt="Facebook">Facebook</a>
                <a href="#"><img src="<%=request.getContextPath()%>/img/footer/Frame-1.png" alt="Instagram">Instagram</a>
                <a href="#"><img src="<%=request.getContextPath()%>/img/footer/Frame-2.png" alt="YouTube">YouTube</a>
                <a href="#"><img src="<%=request.getContextPath()%>/img/footer/Frame-3.png" alt="Kakao">Kakao</a>
                <a href="#"><img src="<%=request.getContextPath()%>/img/footer/Frame-4.png" alt="Blog">Blog</a>
            </div>
        </div>
    </div>
</div>
<!-- 푸터 끝 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
