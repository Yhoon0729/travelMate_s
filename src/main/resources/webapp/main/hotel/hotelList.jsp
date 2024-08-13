<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>호텔 리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css">
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
            padding-top: 20px;
            background-color: #fff;
            
        }

        .fixed-filter {
            position: fixed;
            top: 50%;
            left: 20px;
            transform: translateY(-50%);
            width: 300px;
            padding: 15px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            z-index: 1000;
        }

        .filter-list {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .filter-row {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .filter-button {
            width: calc(50% - 5px);
            height: 50px;
            text-align: center;
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 5px;
            cursor: pointer;
            line-height: 50px;
            transition: background-color 0.3s, color 0.3s;
        }

        .filter-button:hover,
        .filter-button.active-filter {
            background-color: #007bff;
            color: white;
        }

        .hotel-card {
            position: relative;
            margin-bottom: 20px;
            transition: transform 0.2s;
        }

        .hotel-card:hover {
            transform: translateY(-5px);
        }

        .hotel-card img {
            height: 200px;
            object-fit: cover;
            border-radius: 5px 5px 0 0;
        }

        .hotel-rating {
            position: absolute;
            top: 10px;
            right: 10px;
            background-color: #007bff;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            font-weight: bold;
            font-size: 16px;
        }

        .room-price {
            position: absolute;
            bottom: 10px;
            right: 10px;
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 14px;
        }

        .card-body {
            padding: 20px;
            background-color: #fff;
            border: 1px solid #dee2e6;
            border-radius: 0 0 5px 5px;
        }

        .card-title {
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }

        .modal-body {
            padding: 20px;
            font-size: 16px;
            color: #333;
        }

        .modal-title {
            font-size: 22px;
            font-weight: bold;
        }

        .number-input {
            display: flex;
            align-items: center;
            gap: 5px;
            margin-bottom: 10px;
        }

        .number-input input {
            width: 50px;
            text-align: center;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin: 0 5px;
        }

        .number-input button {
            width: 30px;
            background-color: white;
            color: #007bff;
            border: 1px solid #007bff;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }

        .number-input button:hover {
            background-color: #007bff;
            color: white;
        }

        .modal-footer {
            display: flex;
            justify-content: space-between;
            padding: 15px;
        }

        .btn-secondary,
        .btn-primary {
            border-radius: 5px;
            padding: 10px 20px;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #4e555b;
        }

        #hotelCards {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        @media (max-width: 768px) {
            .fixed-filter {
                width: 100%;
                position: static;
                transform: none;
                margin-bottom: 20px;
            }

            .filter-row {
                flex-direction: row;
                justify-content: space-between;
            }
        }
    </style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2 fixed-filter">
				<div class="filter-list">
					<div class="filter-row">
						<button
							class="filter-button btn ${empty code ? 'active-filter' : ''}"
							onclick="filterCards('')">전체</button>
						<c:forEach var="prefix" items="${locli}">
							<c:choose>
								<c:when test="${prefix eq 'p00'}">
									<button class="filter-button btn"
										onclick="filterCards('${prefix}')">★★★★★</button>
								</c:when>
								<c:when test="${prefix eq 'a00'}">
									<button class="filter-button btn"
										onclick="filterCards('${prefix}')">★★★★</button>
								</c:when>
								<c:when test="${prefix eq 'i00'}">
									<button class="filter-button btn"
										onclick="filterCards('${prefix}')">★★★</button>
								</c:when>
								<c:when test="${prefix eq 'c00'}">
									<button class="filter-button btn"
										onclick="filterCards('${prefix}')">★★</button>
								</c:when>
								<c:when test="${prefix eq 'b00'}">
									<button class="filter-button btn"
										onclick="filterCards('${prefix}')">★</button>
								</c:when>
								<c:when test="${prefix eq 't00'}">
									<button class="filter-button btn"
										onclick="filterCards('${prefix}')">조식 포함</button>
								</c:when>
								<c:when test="${prefix eq 'e00'}">
									<button class="filter-button btn"
										onclick="filterCards('${prefix}')">무료 취소</button>
								</c:when>
								<c:when test="${prefix eq 'u00'}">
									<button class="filter-button btn"
										onclick="filterCards('${prefix}')">욕조</button>
								</c:when>
								<c:when test="${prefix eq 'j00'}">
									<button class="filter-button btn"
										onclick="filterCards('${prefix}')">주차</button>
								</c:when>
								<c:when test="${prefix eq 'g00'}">
									<button class="filter-button btn"
										onclick="filterCards('${prefix}')">수영장</button>
								</c:when>
								<c:when test="${prefix eq 'n00'}">
									<button class="filter-button btn"
										onclick="filterCards('${prefix}')">예약 취소</button>
								</c:when>
								<c:when test="${prefix eq 't10'}">
									<button class="filter-button btn"
										onclick="filterCards('${prefix}')">인터넷</button>
								</c:when>
								<c:otherwise>
									<button class="filter-button btn"
										onclick="filterCards('${prefix}')">${prefix}</button>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="col-md-10 offset-md-2">
				<div class="container">
					<h1 class="text-center my-4">호텔 리스트</h1>
					<div id="hotelCards" class="row">
						<c:forEach var="h" items="${li}">
							<div class="col-md-4 hotel-card" data-code="${h.code}"
								data-toggle="modal" data-target="#hotelModal"
								onclick="showModal('https://www.lottehotel.com/content/dam/lotte-hotel/lotte/world/accommodation/residential-room/3813-04-roo-2000-LTWO.jpg.thumb.768.768.jpg', '${h.htlName}', '${h.htlGrade}', '${h.htlPrice}', ${h.htlId})">
								<div class="card">
									<img
										src="https://www.lottehotel.com/content/dam/lotte-hotel/lotte/world/accommodation/residential-room/3813-04-roo-2000-LTWO.jpg.thumb.768.768.jpg"
										class="card-img-top" alt="호텔 이미지">
									<div class="hotel-rating">${h.htlGrade}/10.0</div>
									<div class="room-price">
										<span style="font-size: 14px; font-weight: bold;">객실당
											요금</span><br> <span style="font-size: 18px; font-weight: bold;"><fmt:formatNumber
												value="${h.htlPrice}" pattern="#,###" /></span>원
									</div>
									<div class="card-body">
										<h5 class="card-title">${h.htlName}</h5>
										<p class="card-text"></p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="hotelModal" tabindex="-1"
		aria-labelledby="hotelModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="hotelModalLabel">호텔 정보</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="hotel-info">
						<div class="text-center mb-3">
							<img id="modalHotelImage" src="" alt="호텔 이미지" class="img-fluid"
								style="max-height: 300px;">
						</div>
						<p>
							<strong>호텔이름:</strong> <span id="modalHtlName"></span>
						</p>
						<p>
							<strong>호텔평점:</strong> <span id="modalHtlGrade"></span>
						</p>
						<p>
							<strong>객실당 요금:</strong> <span id="modalHtlPrice"></span>원
						</p>
						<p>
							<strong>총 가격:</strong> <span id="modalHtlTotalPrice"></span>원
						</p>
						<!-- 총 가격 표시 -->
					</div>
					<div class="booking-info">
						<form id="bookingForm" method="post"
							action="${pageContext.request.contextPath}/hotel/hotelbooking">
							<div class="form-group">
								<label for="daterange">체크인 / 체크아웃 날짜</label> <input type="text"
									class="form-control" id="daterange" readonly required> <input
									type="hidden" id="htlCheckin" name="htlCheckin"> <input
									type="hidden" id="htlCheckout" name="htlCheckout">
							</div>
							<div class="form-group">
								<label for="occupancy">객실 인원</label>
								<div class="number-input">
									<button type="button" onclick="changeValue('adult', -1)"
										class="btn btn-light"
										style="background-color: white; color: blue; border: 1px solid black; width: 30px;"
										onmouseover="this.style.backgroundColor='blue'; this.style.color='white';"
										onmouseout="this.style.backgroundColor='white'; this.style.color='blue';">-</button>
									<input type="number" id="adult" name="adult" value="1" min="1"
										readonly
										style="width: 50px; text-align: center; border: 1px solid black; margin: 0 5px;">
									<button type="button" onclick="changeValue('adult', 1)"
										class="btn btn-light"
										style="background-color: white; color: blue; border: 1px solid black; width: 30px;"
										onmouseover="this.style.backgroundColor='blue'; this.style.color='white';"
										onmouseout="this.style.backgroundColor='white'; this.style.color='blue';">+</button>
									<label for="adult" class="ml-2" style="color: blue;">성인</label>
								</div>
								<div class="number-input">
									<button type="button" onclick="changeValue('child', -1)"
										class="btn btn-light"
										style="background-color: white; color: blue; border: 1px solid black; width: 30px;"
										onmouseover="this.style.backgroundColor='blue'; this.style.color='white';"
										onmouseout="this.style.backgroundColor='white'; this.style.color='blue';">-</button>
									<input type="number" id="child" name="child" value="0" min="0"
										readonly
										style="width: 50px; text-align: center; border: 1px solid black; margin: 0 5px;">
									<button type="button" onclick="changeValue('child', 1)"
										class="btn btn-light"
										style="background-color: white; color: blue; border: 1px solid black; width: 30px;"
										onmouseover="this.style.backgroundColor='blue'; this.style.color='white';"
										onmouseout="this.style.backgroundColor='white'; this.style.color='blue';">+</button>
									<label for="child" class="ml-2" style="color: blue;">어린이</label>
								</div>
								<div class="number-input">
									<button type="button" onclick="changeValue('rooms', -1)"
										class="btn btn-light"
										style="background-color: white; color: blue; border: 1px solid black; width: 30px;"
										onmouseover="this.style.backgroundColor='blue'; this.style.color='white';"
										onmouseout="this.style.backgroundColor='white'; this.style.color='blue';">-</button>
									<input type="number" id="rooms" name="rooms" value="1" min="1"
										readonly
										style="width: 50px; text-align: center; border: 1px solid black; margin: 0 5px;">
									<button type="button" onclick="changeValue('rooms', 1)"
										class="btn btn-light"
										style="background-color: white; color: blue; border: 1px solid black; width: 30px;"
										onmouseover="this.style.backgroundColor='blue'; this.style.color='white';"
										onmouseout="this.style.backgroundColor='white'; this.style.color='blue';">+</button>
									<label for="rooms" class="ml-2" style="color: blue;">객실</label>
								</div>
								<input type="hidden" id="occupancyText" name="occupancyText">
								<input type="hidden" id="htlId" name="htlId">
								<!-- 호텔 ID를 위한 숨겨진 입력란 -->
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary"
						onclick="submitBooking()">예약하기</button>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<script>
        let htlPrice = 0;

        function filterCards(code) {
            const cards = document.querySelectorAll('.hotel-card');
            cards.forEach(card => {
                if (code === '' || card.getAttribute('data-code') === code) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        }

        function showModal(imageUrl, name, grade, price, htlId) {
            document.getElementById('modalHtlName').textContent = name;
            document.getElementById('modalHtlGrade').textContent = grade;
            document.getElementById('modalHtlPrice').textContent = new Intl.NumberFormat('ko-KR').format(price);
            document.getElementById('modalHotelImage').src = imageUrl;
            document.getElementById('htlId').value = htlId; // 호텔 ID 설정

            htlPrice = parseInt(price.replace(/,/g, ''));
            updateTotalPrice();
        }

        function changeValue(id, delta) {
            const element = document.getElementById(id);
            let value = parseInt(element.value) + delta;
            value = Math.max(value, parseInt(element.min));
            if (id === 'rooms') {
                const adultValue = parseInt(document.getElementById('adult').value);
                value = Math.min(value, adultValue);
            }
            element.value = value;
            updateTotalPrice();
        }

        function updateTotalPrice() {
            const rooms = parseInt(document.getElementById('rooms').value);
            const totalPrice = rooms * htlPrice;
            document.getElementById('modalHtlTotalPrice').textContent = new Intl.NumberFormat('ko-KR').format(totalPrice);
        }

        function updateOccupancyText() {
            const adult = document.getElementById('adult').value;
            const child = document.getElementById('child').value;
            const rooms = document.getElementById('rooms').value;
            const occupancyText = `성인: ${adult}, 어린이: ${child}, 객실: ${rooms}`;
            document.getElementById('occupancyText').value = occupancyText;
        }

        function submitBooking() {
            const daterange = document.getElementById('daterange').value;
            
            if (!daterange) {
                alert('날짜를 선택해 주세요.');
                return;
            }
            
            const dates = daterange.split(' - ');
            document.getElementById('htlCheckin').value = dates[0];
            document.getElementById('htlCheckout').value = dates[1];
            
            const form = document.getElementById('bookingForm');
            updateOccupancyText();
            form.submit();
        }

        $(function() {
            $('#daterange').daterangepicker({
                locale: {
                    format: 'YYYY-MM-DD',
                    separator: ' - ',
                    applyLabel: '적용',
                    cancelLabel: '취소',
                    fromLabel: '부터',
                    toLabel: '까지',
                    customRangeLabel: '사용자 정의',
                    weekLabel: 'W',
                    daysOfWeek: ['일', '월', '화', '수', '목', '금', '토'],
                    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                    firstDay: 1
                },
                autoUpdateInput: false,
                startDate: moment().startOf('day'),
                endDate: moment().add(1, 'days').startOf('day'),
                opens: 'left' // 입력란을 클릭하면 달력이 왼쪽에 표시됨
            }, function(start, end, label) {
                $('#daterange').val(start.format('YYYY-MM-DD') + ' - ' + end.format('YYYY-MM-DD'));
            });

            $('#daterange').on('apply.daterangepicker', function(ev, picker) {
                $(this).val(picker.startDate.format('YYYY-MM-DD') + ' - ' + picker.endDate.format('YYYY-MM-DD'));
            });

            $('#daterange').on('cancel.daterangepicker', function(ev, picker) {
                $(this).val('');
            });
        });

        function filterCards(prefix) {
        	
            const cards = document.querySelectorAll('.hotel-card');
            cards.forEach(card => {
                if (prefix === '' || card.getAttribute('data-code').startsWith(prefix)) {
                    card.style.display = 'block'; // 선택한 prefix가 호텔 코드의 시작 부분과 일치하면 보여줍니다.
                } else {
                    card.style.display = 'none'; // 일치하지 않으면 숨깁니다.
                }
            });
        }
        
    </script>
</body>
</html>
