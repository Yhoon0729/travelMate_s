<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Page Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   
    <style>
        /* 폰트 설정 */
        @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        /* 모든 요소에 기본 폰트 설정 */
        * {
            font-family: 'GmarketSansMedium';
        }

        /* 페이지 배경색 설정 */
        body {
            background-color: #f8f9fa;
        }

        /* 컨테이너 스타일 설정 */
        .container {
            margin-top: 20px;
            margin-bottom: 100px;
        }

        /* 하단 고정 버튼 바 스타일 설정 */
        .btn-container {
            position: fixed;
            width: 100%;
            bottom: 0;
            left: 0;
            background-color: #fff;
            box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            z-index: 1000;
            display: flex;
            justify-content: flex-end;
        }

        /* 버튼 스타일 설정 */
        .btn-container a, .btn-container button {
          background: #00256C;
   			color: white;
    		margin: auto 30px;
   			width: 250px;
    		height: auto;
    		border-radius: 12px;
    		border:none;
		    text-align: center;
		    padding: 12px;
		    font-weight: 100;
		    font-size: 18px;
            transition: background-color 0.3s ease;
        }

        /* 버튼 호버 효과 */
        .btn-container a:hover, .btn-container button:hover {
            background-color: #001A50;
        }

        /* 카드 스타일 설정 */
        .card {
            margin-bottom: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
        }

        /* 카드 이미지 스타일 설정 */
        .card img {
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }

        /* 카드 제목 스타일 설정 */
        .card-title {
            color: #00256C;
            font-weight: bold;
        }

        /* 제목 스타일 설정 */
        h3 {
            color: #00256C;
            font-weight: bold;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        /* 테이블 스타일 설정 */
        .table {
            margin-top: 20px;
        }

        /* 테이블 줄무늬 스타일 설정 */
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(0, 37, 108, 0.05);
        }

        /* 목록 항목 스타일 설정 */
        .list-group-item {
            display: flex;
            align-items: center;
            background-color: transparent;
            border: none;
            padding: 10px 15px;
        }

        /* 목록 항목 아이콘 스타일 설정 */
        .list-group-item img {
            margin-right: 10px;
            width: 30px; /* 아이콘 크기 설정 */
            height: 30px; /* 아이콘 크기 설정 */
        }

        /* 라디오 버튼 숨김 */
        .list-group-item input[type="radio"] {
            display: none;
        }

        /* 목록 항목 호버 효과 */
        .list-group-item:hover {
            background-color: rgba(0, 37, 108, 0.1);
        }

        /* 포커스된 라벨 스타일 */
        .list-group-item input[type="radio"]:focus + label {
            filter: brightness(1.2);
            border: 2px solid #00256C;
            border-radius: 10px;
        }

        /* 탭 스타일 설정 */
        .flight-tabs {
            margin-top: 20px;
        }

        /* 탭 내용 스타일 설정 */
        .tab-content {
            margin-top: 20px;
        }

        /* 항공편 카드 스타일 설정 */
        .flight-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            margin-bottom: 20px;
            padding: 20px;
            background: white;
        }

        /* 항공편 정보 스타일 설정 */
        .flight-card .flight-info {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        
        /*input icon 스타일 설정 */
        .flight-card input {
        	opaticty: 0;
        }
        

        /* 항공편 정보 아이콘 스타일 설정 */
        .flight-card .flight-info img {
            width: 20px; /* 아이콘 크기 설정 */
            height: 20px; /* 아이콘 크기 설정 */
        }

        /* 항공편 세부 정보 스타일 설정 */
        .flight-card .flight-details {
            margin-top: 15px; /* 텍스트 사이 공간 조정 */
            font-size: 14px;
        }

        /* 가격 스타일 설정 */
        .flight-card .price {
        	margin: auto 20px;
            font-weight: bold;
            color: #00256C;
        }
        
    /* flight-card 기본 스타일 설정 */
.flight-card {
    border: 2px solid transparent; /* 초기에는 투명 테두리 */
    border-radius: 10px; /* 테두리 둥글기 조정 */
    transition: border-color 0.3s ease; /* 테두리 색상 변화를 부드럽게 애니메이션 */
    cursor: pointer; /* 포인터 커서 설정 */
}


/* 포커스 및 호버 시 라벨 내부 아이콘 색상 변경 예시 */
.flight-card label:hover img {
    filter: brightness(1.2); /* 아이콘 밝기 조정 */
}

/* 클릭한 상태를 나타내는 스타일 설정 */
.flight-card.clicked {
    border-color: #00256C; /* 클릭한 상태의 테두리 색상 */
}


input[name="outFlight"]:checked + .flight-card,
input[name="inFlight"]:checked + .flight-card {
    border: 2px solid #00256C;
}


    </style>
</head>
<body>

<div class="container">
    <!-- 항공편 선택 폼 -->
    <form action="${pageContext.request.contextPath}/air/airConfirm/" method="post">
        <!-- 선택한 축제 정보 카드 -->
        <div class="card mb-4" style="width: 100%;">
            <img src="https://dynamic-media-cdn.tripadvisor.com/media/photo-o/26/97/39/7f/caption.jpg?w=1200&h=-1&s=1&cx=1920&cy=1080&chk=v1_f31158e4bb953d28a308" class="card-img-top" alt="Festival Image">
            <div class="card-body">
                <h3 class="card-title">${list.festivalName}</h3>
                <p class="card-text">
                    ${list.country}
                    <c:set var="startDay" value="${list.startDay}"/>
                    <c:set var="endDay" value="${list.endDay}"/>
                    ${fn:substring(startDay, 0, 10)} ~ ${fn:substring(endDay, 0, 10)}
                </p>
            </div>
        </div>

        <!-- 항공편 선택 제목 -->
        <h3>항공편 선택</h3>

        <!-- 항공편 선택 탭 -->
        <ul class="nav nav-tabs flight-tabs" id="flightTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="departure-tab" data-toggle="tab" href="#departure" role="tab" aria-controls="departure" aria-selected="true">출국 항공편</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="return-tab" data-toggle="tab" href="#return" role="tab" aria-controls="return" aria-selected="false">입국 항공편</a>
            </li>
        </ul>
        <div class="tab-content" id="flightTabContent">
            <!-- 출국 항공편 탭 -->
            <div class="tab-pane fade show active" id="departure" role="tabpanel" aria-labelledby="departure-tab">
                <div class="row">
                    <div class="col-md-12">
                        <!-- 출국 항공편 목록 -->
                        <c:forEach var="list" items="${airListDep}">
                            <div class="flight-card">
                                <!-- 라디오 버튼 숨김 -->
                                <input type="radio" style="opacity:0;" name="outFlight" id="dep${list.flightCode}" value="${list.flightCode}" onChange="selectOutFlight(event)" required="required"/>
                                <label for="dep${list.flightCode}">
                                    <div class="flight-info">
                                        <div>
                                            <!-- 항공사 아이콘 및 이름 표시 -->
                                            <img src="<c:url value='/img/${list.companyName}.png' />" alt="${list.companyName}">
                                            ${list.companyName} ${list.flightCode}편
                                        </div>
                                        <div class="price">
                                            <fmt:formatNumber value="${list.price}" pattern="#,##0"/>원
                                        </div>
                                    </div>
                                    <div class="flight-details">
                                        <c:set var="depTime" value="${list.depTime}"/>
                                        ${fn:substring(depTime, 11, 16)} ~
                                        <c:set var="arrTime" value="${list.arrTime}"/>
                                        ${fn:substring(arrTime, 11, 16)}<br>
                                        ${list.seatClass}
                                    </div>
                                </label>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!-- 입국 항공편 탭 -->
            <div class="tab-pane fade" id="return" role="tabpanel" aria-labelledby="return-tab">
                <div class="row">
                    <div class="col-md-12">
                        <!-- 입국 항공편 목록 -->
                        <c:forEach var="list" items="${airListRtn}">
                            <div class="flight-card">
                                <!-- 라디오 버튼 숨김 -->
                                <input type="radio" style="opacity:0;" name="inFlight" id="rtn${list.flightCode}" value="${list.flightCode}" onChange="selectInFlight(event)" required="required"/>
                                <label for="rtn${list.flightCode}">
                                    <div class="flight-info">
                                        <div>
                                            <!-- 항공사 아이콘 및 이름 표시 -->
                                            <img src="<c:url value='/img/${list.companyName}.png' />" alt="${list.companyName}">
                                            ${list.companyName} ${list.flightCode}편
                                        </div>
                                        <div class="price">
                                            <fmt:formatNumber value="${list.price}" pattern="#,##0"/>원
                                        </div>
                                    </div>
                                    <div class="flight-details">
                                        <c:set var="depTime" value="${list.depTime}"/>
                                        ${fn:substring(depTime, 11, 16)} ~
                                        <c:set var="arrTime" value="${list.arrTime}"/>
                                        ${fn:substring(arrTime, 11, 16)}<br>
                                        ${list.seatClass}
                                    </div>
                                </label>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        

        <!-- 고정 버튼 바 -->
        <div class="btn-container">
        	        <!-- 선택된 출국 항공편 표시 -->
         <div class="selectedFlight" style="display:flex; flex-direction:column; align-item:cetner; width:auto; height:auto; margin-top:10px;">  
		<!-- <div id="selectedOutFlight" style="margin:auto 30px;"></div>
		<div id="selectedInFlight"  style="margin:auto 30px;"></div> -->
		</div>	     

        	<!-- 총 가격 표시 -->
   			<!--   <div id="totalPrice" class="btn btn-outline-primary" style="margin-top:5px; width:auto; height:100%;">총 가격: </div>
            <!-- 이전으로 돌아가기 -->
            <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/air/airindex/">이전으로 돌아가기</a>
            <!-- 선택 완료 -->
            <button type="submit" class="btn btn-outline-primary">다음 여정</button>
        </div>

        
    </form>
</div>

<!-- JavaScript -->
<script type="text/javascript">
    /* 도착 공항 선택 */
    function selectDate(e) {
        console.log(e.target.id);
        let url = "${pageContext.request.contextPath}/air/arrAir?arrAir=" + e.target.id;
        fetch(url);
        url = "${pageContext.request.contextPath}/air/airText?text=" + e.target.id;
        fetch(url)
            .then(res => res.text())
            .then(text => {
                document.querySelector("#returnDepAirport").innerHTML = text;
                document.querySelector("#depAirList").innerHTML = "";
            });
    }

    /* 입국 비행기 리스트 */
    function selectRtnDate(e) {
        let date = e.target.value;
        let url = "${pageContext.request.contextPath}/air/airRtnDate?date=" + date;
        fetch(url)
            .then(res => res.text())
            .then(text => {
                const id = document.querySelector("#returnDepAirList");
                id.innerHTML = text;
            });
    }

    /* 출국 항공편 선택 */
    function selectOutFlight(e) {
        let flightCode = e.target.id;
        let url = "${pageContext.request.contextPath}/air/airOutFlight?flightCode=" + flightCode;
        fetch(url);
    }

    /* 입국 항공편 선택 */
    function selectInFlight(e) {
        let flightCode = e.target.id;
        let url = "${pageContext.request.contextPath}/air/airInFlight?flightCode=" + flightCode;
        fetch(url);
    }
    
 // 클릭 시 클래스 추가
    const flightCards = document.querySelectorAll('.flight-card');

    flightCards.forEach(card => {
        card.addEventListener('click', function() {
            // 모든 .flight-card 요소에서 clicked 클래스 제거
            flightCards.forEach(card => {
                card.classList.remove('clicked');
            });
            
            // 클릭한 요소에 clicked 클래스 추가
            this.classList.add('clicked');
        });
    });
    
</script>


<script>
function displaySelectedFlights() {
    console.log("디스플레이 함수 호출됨");

    // 선택된 출국 및 입국 항공편 정보 초기화
    document.getElementById('selectedOutFlight').innerHTML = '';
    document.getElementById('selectedInFlight').innerHTML = '';

    // 선택된 출국 항공편 정보 가져오기
    var selectedOutFlight = document.querySelector('input[name="outFlight"]:checked');
    console.log("선택된 출국 항공편:", selectedOutFlight);

    if (selectedOutFlight) {
        var outFlightInfo = selectedOutFlight.closest('.flight-card').querySelector('.flight-info');
        var outFlightCompanyName = outFlightInfo.querySelector('img').alt;
        var outFlightCode = outFlightInfo.textContent.trim().split(' ')[1];
        console.log("출국 항공편 정보:", outFlightCompanyName, outFlightCode);

        // btn-container에 출국 항공편 정보 표시
        document.getElementById('selectedOutFlight').innerHTML = `<p>출국 항공편: ${outFlightCompanyName} ${outFlightCode}</p>`;
    }

    // 선택된 입국 항공편 정보 가져오기
    var selectedInFlight = document.querySelector('input[name="inFlight"]:checked');
    console.log("선택된 입국 항공편:", selectedInFlight);

    if (selectedInFlight) {
        var inFlightInfo = selectedInFlight.closest('.flight-card').querySelector('.flight-info');
        var inFlightCompanyName = inFlightInfo.querySelector('img').alt;
        var inFlightCode = inFlightInfo.textContent.trim().split(' ')[1];
        console.log("입국 항공편 정보:", inFlightCompanyName, inFlightCode);

        // btn-container에 입국 항공편 정보 표시
        document.getElementById('selectedInFlight').innerHTML = `<p>입국 항공편: ${inFlightCompanyName} ${inFlightCode}</p>`;
    }
}

// 출국 및 입국 항공편 선택 시 선택된 항공편 정보 업데이트
document.querySelectorAll('input[name="outFlight"], input[name="inFlight"]').forEach(input => {
    input.addEventListener('change', displaySelectedFlights);
});
</script>









<!-- Bootstrap JavaScript -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
