<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Rent Car Time</title>
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
        
        .container {
            max-width: 1450px;
            background: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 50px;
            border-radius: 15px;
        }

        .main-container {
            width: 100%;
            background: #fff;
        }

        .form-container {
            display: flex;
            justify-content: space-between;
            width: 100%;
            background-color: #FFFFFF;
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
            margin: 70px 0;
            padding: 10px 0;
            color: #000;
            font-size: 18px;
        }

        .right-section label {
            display: block;
            margin: 30px 5px;
            font-size: 13px;
        }
        
        .right-section input {
        	
        }
        
        .form-header {
       		 display: flex;
    		 justify-content: center;
    		 margin: 50px;
        }

        input[type="date"], input[type="time"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            border: none;
            border-bottom: 1px solid #767676; /* Adjusted border style */
        }
        
        input[type="date"]:hover, input[type="time"]:hover {
        	color:#00256C;
        	border: 1px solid #00256C;
        }

        input[type="button"] {
            background-color: #00256C;
            color: white;
            cursor: pointer;
            border: none;
            padding: 10px;
            width: 100%; /* Adjusted width */
            max-width: 200px;
            margin-top: 20px;
        }

        input[type="button"]:hover {
            background-color: #00396E;
        }
        
        .right-section {
   			 margin: 0 50px;
		}
		
		.sub-text {
			color:#00256C;
			font-size:18px;
			margin: 20px 5px;
		
		}
		
    </style>
</head>
<body>
    <div class="container"> 
        <div class="main-container">
            <h2 style="font-size:36px;">트레블메이트(TravelMate) 렌트카 예약</h2>
            <span style="font-size:16px; font-weight:100 color:#5555;">트레블메이트 제휴 렌터카를 이용하고 마일리지도 적립해보세요.</span>
           <div class="form-header">
                <img src="<%=request.getContextPath()%>/img/Register/cheking.svg" style="width:4.5%; position:relative; left: -10px; top: -5px;">
                <div class="user-input-icon">차량 선택</div>
                <img src="<%=request.getContextPath()%>/img/Register/Bnumber2.svg" style="width:4.5%; position:relative; left: -12px; top: -8px; margin-left:50px;">
                <div class="com-input-icon" style="color:#00256C;">여정 선택</div>
                <img src="<%=request.getContextPath()%>/img/Register/hNumber3.svg" style="width:3.2%; position:relative; left: -12px; top: -13px; margin-left:50px;">
                <div class="com-input-icon">예약 정보 확인</div>
            </div>
            <div class="sub-text">여정 선택</div>
            <div class="form-container">
                <div class="left-section">
                    <div class="main-title">
                        <h3>대여 날짜</h3>
                        <h3>대여 시각</h3>
                        <h3>반납 날짜</h3>
                        <h3>반납 시각</h3>
                    </div>
                </div>
                <div class="right-section">           
                    <form id="rentCarTimeForm" action="rentCarInfo" method="post">
                        <input type="hidden" name="carId" value="${carId}" />
                        <p>선택된 차량 ID: ${carId}</p>

                        <label for="sRentDate">대여 날짜:</label>
                        <input type="date" id="sRentDate" name="sRentDate" required>

                        <label for="sRentTime">대여 시각:</label>
                        <input type="time" id="sRentTime" name="sRentTime" required>

                        <label for="eRentDate">반납 날짜:</label>
                        <input type="date" id="eRentDate" name="eRentDate" required>

                        <label for="eRentTime">반납 시각:</label>
                        <input type="time" id="eRentTime" name="eRentTime" required>
                	</form>
                </div>
            </div>
            <input type="button" value="다음 여정" style="margin:30px auto; display: flex; border-radius:10px;" onclick="submitForm()">
        </div>
    </div>
</body>

<script>
	function submitForm() {
	    document.getElementById('rentCarTimeForm').submit();
	}
</script>

</html>
