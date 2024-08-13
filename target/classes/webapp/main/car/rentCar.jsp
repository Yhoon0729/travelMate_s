<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <script type="text/javascript">
    function updateAction(carId) {
        var form = document.getElementById('rentCarForm');
        form.action = "/travelMate/car/rentCarTime?carId=" + carId;
        form.submit();
    }
</script>
    <title>렌트카 예약</title>
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
            background-color: #fff;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .container {
            width: 100%;
            max-width: 1440px;
            background: #fff;
            padding: 30px;
            margin: auto;
            overflow: hidden;
        }

        .container h2 {
            text-align: center;
            margin-top: 30px;
            margin-bottom: 20px;
            color: #00256C; /* 메인 컬러 */
        }

        .car-box {
            display: flex;
            align-items: center;
            border: 1px solid #ddd;
            margin-bottom: 20px;
            overflow: hidden;
            transition: box-shadow 0.3s;
            margin: 20px;
            width: calc(50% - 40px); /* 두 개의 박스를 한 줄에 배치 */
        }

        .car-box:hover {
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            border: 1px solid #00256C;
        }

        .car-box img {
            width: 300px;
            height: 200px;
            object-fit: cover;
            cursor: pointer;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .car-box img:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }

        .car-info {
        	font-family:sans-serif;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 20px;
        }

        .car-info p {
            margin: 5px 0;
            font-size: 16px;
        }

        .car-info p strong {
            font-size: 18px;
            color: #000;
        }
        
        .rent-content {
            display: flex;
            flex-wrap: wrap;
            margin: 20px;
            justify-content: space-between; /* 박스들 사이의 공간을 고르게 분배 */
        }

        .form-header {
            display: flex;
            justify-content: center;
            margin: 50px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 style="text-align:left; color:#000; font-size:36px;">트레블메이트(TravelMate) 렌터카 예약</h2>
        
        <div class="form-header">
            <img src="<%=request.getContextPath()%>/img/Register/Bnumber1.svg" style="width:4.5%; position:relative; left: -10px; top: -5px;">
            <div class="user-input-icon" style="color:#00256C;">차량 선택</div>
            <img src="<%=request.getContextPath()%>/img/Register/hNumber2.svg" style="width:3.2%; position:relative; left: -12px; top: -8px; margin-left:50px;">
            <div class="com-input-icon">여정 선택</div>
            <img src="<%=request.getContextPath()%>/img/Register/hNumber3.svg" style="width:3.2%; position:relative; left: -12px; top: -8px; margin-left:50px;">
            <div class="com-input-icon">예약 정보 확인</div>
        </div>
        
        <span style="color:#00256C; font-size:26px;">차량 선택</span>
        <form id="rentCarForm" action="/travelMate/car/rentCarTime" method="post" class="rent-content">
            <c:forEach var="c" items="${li}">
                <div class="car-box">
                    <label>
                        <img src="${pageContext.request.contextPath}${c.carImageUrl}" alt="${c.carName}" onclick="updateAction('${c.carId}')">
                    </label>
                    <div class="car-info">
                        <p><strong>차량 시리얼 번호:</strong> ${c.carId}</p>
                        <p><strong>국가:</strong> ${c.countryCode}</p>
                        <p><strong>차종:</strong> ${c.carType}</p>
                        <p><strong>모델:</strong> ${c.carName}</p>
                        <p><strong>시간당 요금:</strong> ${c.carDailyFee}</p>
                        <p><strong>렌탈 회사:</strong> ${c.carCom}</p>
                    </div>
                </div>
            </c:forEach>
        </form>
    </div>
</body>
</html>
