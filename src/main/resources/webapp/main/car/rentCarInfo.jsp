<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>렌트카 예약 확인</title>
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
            font-family: 'Arial', sans-serif;
            background: url('travel-background.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1450px;
            background: rgba(255, 255, 255, 0.8);
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 15px;
            margin: 50px auto;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            height:75vh;
        }

        .main-container {
            width: 100%;
            background: #fff;
        }

        .form-container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start; /* This ensures both sections are aligned to the top */
            width: 100%;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            box-shadow: 0 0 3px rgba(0, 0, 0, 0.1);
            color: #767676;
            padding: 40px;
            border: 1px solid #d9dbe1;
        }

        .left-section, .right-section {
            width: 50%;
        }

        .left-section .main-title h3 {
            margin: 15px 0; 
            padding: 10px 0;
            color: #000;
            font-size: 18px;
        }

        .right-section p {
            margin: 10px 0; 
            padding: 10px 0;
            font-size: 18px;
            color : #000;
        }

        .right-section label {
            display: block;
            margin: 30px 5px;
            font-size: 13px;
        }

        .form-header {
            display: flex;
            justify-content: center;
            margin: 50px;
        }

        input[type="submit"] {
            background-color: #00396E;
            color: white;
            cursor: pointer;
            border: none;
            padding: 10px;
            width: 100%;
            max-width: 200px;
            margin-top: 20px;
            border-radius: 5px;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #00396E;
        }

        .right-section {
            margin: 0 50px;
        }

        .session-data {
            margin-top: 20px;
            padding: 10px;
            background-color: rgba(255, 255, 255, 0.9);
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }

        .session-data li {
            list-style-type: none;
            padding: 5px 0;
        }
        
        .final-btn {
        	display:flex;
        	justify-content:center;
        	margin:50px auto;
        	color:#fff;
        }
        
        .final-btn input{
        	margin: 0 80px;
        	padding: 15px;
        	background: #00235C;
        
        }
    </style>
</head>
<body>
    <h2 style="font-size:36px; margin:80px 61px;">트레블메이트(TravelMate) 예약 확인</h2>
    <div class="container">
    
        <div class="main-container">
           
            
           <div class="form-header">
                <img src="<%=request.getContextPath()%>/img/Register/cheking.svg" style="width:4.5%; position:relative; left: -10px; top: -8px;">
                <div class="user-input-icon" ">차량 선택</div>
                <img src="<%=request.getContextPath()%>/img/Register/cheking.svg" style="width:4.5%; position:relative; left: -12px; top: -8px; margin-left:50px;">
                <div class="com-input-icon">여정 선택</div>
                <img src="<%=request.getContextPath()%>/img/Register/Bnumber3.svg" style="width:4.5%; position:relative; left: -12px; top: -13px; margin-left:50px;">
                <div class="com-input-icon" style="color:#00256C;">예약 정보 확인</div>
            </div>
            <div class="form-container">
                <div class="left-section">
                    <div class="main-title">
                        <h3>차량 시리얼 번호</h3>
                        <h3>대여 날짜</h3>
                        <h3>대여 시각</h3>
                        <h3>반납 날짜</h3>
                        <h3>반납 시각</h3>
                        <h3>대여 시간</h3>
                        <h3>시간당 가격</h3>
                        <h3>총 가격</h3>
                    </div>
                </div>
                <div class="right-section">
                    <p>차량 시리얼 번호: ${carId}</p>
                    <p>대여 날짜: ${sRentDate}</p>
                    <p>대여 시각: ${sRentTime}</p>
                    <p>반납 날짜: ${eRentDate}</p>
                    <p>반납 시각: ${eRentTime}</p>
                    <p>대여 시간: ${totTime}</p>
                    <p>시간당 가격: ${hourFee}</p>
                    <p>총 가격: ${totFee}</p>
                </div>
            </div>

           <!--  <div class="session-data">
                <li>세션에 저장된 값: ${sessionScope.carHis.totFee}</li>
            </div> -->

            
        </div>
       
    </div>
    
    <div class="final-btn">
     <form action="/travelMate/index.jsp" method="post">
                <input type="submit" value="첫화면 가기">
            </form>
            
            <form action="${pageContext.request.contextPath}/booking/userBooking/" method="post">
                <input type="submit" value="최종 예약정보 확인하기">
            </form>
     </div>
</body>
</html>
