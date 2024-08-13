<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- prefix 사용 설정  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 화면</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous">
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
        background-color: #fff;
        background-repeat: no-repeat;
    background-position: center;
    background-size: cover; /* 배경 이미지를 화면에 맞게 조절 */
    overflow-x: hidden; 
    }
    .category-button {
        background: none;
        border: none;
        padding: 10px 20px;
        font-size: 1.25rem;
        cursor: pointer;
        transition: color 0.3s;
    }
    .category-button.active {
        color: #00235C;
        font-weight: bold;
        border-bottom: 2px solid #00235C;
    }
    .card-custom {
        width: 100%;
        border: none;
        border-radius: 15px;
        overflow: hidden;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        margin: 1rem 0;
        transition: transform 0.3s;
    }
    .card-custom:hover {
        transform: translateY(-10px);
    }
    .card-custom img {
        border-top-left-radius: 15px;
        border-top-right-radius: 15px;
        height: 200px;
        object-fit: cover;
    }
    .card-custom .card-body {
        padding: 1.5rem;
        background-color: #fff;
    }
    .card-custom .card-title {
        margin-bottom: 1rem;
        font-size: 1.5rem;
        font-weight: bold;
        color: #333;
    }
    .list-group-item {
        border: none;
        padding: 0.75rem 1rem;
        background-color: #f8f9fa;
        margin-bottom: 0.5rem;
        border-radius: 5px;
        transition: background-color 0.3s;
    }
    .list-group-item:hover {
        background-color: #e9ecef;
    }
    .dropdown-item {
        color: #00235C;
        text-decoration: none;
    }
    .dropdown-item:hover {
        color: #0056b3;
        text-decoration: underline;
    }
    
    .mt-5{
        margin: 120px auto;
    }
</style>

</head>
<body>
	<!--  <div class="main-banner" id="main-banner" style="background-image: url('<%=request.getContextPath()%>/img/TraMain/pc1.jpg'); 
	background-repeat: no-repeat; background-size: cover; background-position: center;">
	</div> -->

	<img src="<%=request.getContextPath()%>/img/TraMain/pc1.jpg" alt="Facebook" style="width:2200px; background-size:cover; background-position:center;
	 overflow: hidden;">
	<img src="<%=request.getContextPath()%>/img/TraMain/pc2.jpg" alt="Facebook" style="margin-top:30px; margin-bottom:50px;">
	
    <div class="container mt-5">
        <h2>추천! 현지투어플러스</h2>
        <div class="d-flex justify-content-center mb-4">
            <button class="category-button active" onclick="showCategory('spring')">봄</button>
            <button class="category-button" onclick="showCategory('summer')">여름</button>
            <button class="category-button" onclick="showCategory('fall')">가을</button>
            <button class="category-button" onclick="showCategory('winter')">겨울</button>
        </div>

        <div id="spring" class="category-content">
            <div class="row">
                <c:forEach var="li" items="${list }">
                    <c:if test="${li.season == 'spr'}">
                        <div class="col-md-6 col-lg-3">
                            <div class="card card-custom">
                               
                                <div class="card-body">
                                    <h5 class="card-title">${li.festivalName}</h5>
                                    <p>${li.startDay} ~ ${li.endDay}</p>
                                    <p><a class="dropdown-item" href="${pageContext.request.contextPath}/tra/festivalInfo?code=${li.code }">
                                        자세히 보기
                                    </a></p>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>

        <div id="summer" class="category-content" style="display: none;">
            <div class="row">
                <c:forEach var="li" items="${list }">
                    <c:if test="${li.season == 'sum'}">
                        <div class="col-md-6 col-lg-3">
                            <div class="card card-custom">
                               
                                <div class="card-body">
                                    <h5 class="card-title">${li.festivalName}</h5>
                                    <p>${li.startDay} ~ ${li.endDay}</p>
                                    <p><a class="dropdown-item" href="${pageContext.request.contextPath}/tra/festivalInfo?code=${li.code }">
                                        자세히 보기
                                    </a></p>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>

        <div id="fall" class="category-content" style="display: none;">
            <div class="row">
                <c:forEach var="li" items="${list }">
                    <c:if test="${li.season == 'fal'}">
                        <div class="col-md-6 col-lg-3">
                            <div class="card card-custom">
                              
                                <div class="card-body">
                                    <h5 class="card-title">${li.festivalName}</h5>
                                    <p>${li.startDay} ~ ${li.endDay}</p>
                                    <p><a class="dropdown-item" href="${pageContext.request.contextPath}/tra/festivalInfo?code=${li.code }">
                                        자세히 보기
                                    </a></p>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>

        <div id="winter" class="category-content" style="display: none;">
            <div class="row">
                <c:forEach var="li" items="${list }">
                    <c:if test="${li.season == 'win'}">
                        <div class="col-md-6 col-lg-3">
                            <div class="card card-custom">
                               
                                <div class="card-body">
                                    <h5 class="card-title">${li.festivalName}</h5>
                                    <p>${li.startDay} ~ ${li.endDay}</p>
                                    <p><a class="dropdown-item" href="${pageContext.request.contextPath}/tra/festivalInfo?code=${li.code }">
                                        자세히 보기
                                    </a></p>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>

    <script>
        function showCategory(category) {
            var categories = document.getElementsByClassName('category-content');
            for (var i = 0; i < categories.length; i++) {
                categories[i].style.display = 'none';
            }
            document.getElementById(category).style.display = 'block';

            var buttons = document.getElementsByClassName('category-button');
            for (var i = 0; i < buttons.length; i++) {
                buttons[i].classList.remove('active');
            }
            event.target.classList.add('active');
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

</body>
</html>
