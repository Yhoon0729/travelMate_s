<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- JSTL tag library declarations -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>

	@font-face {
    	font-family: 'GmarketSansMedium';
    	src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
   		 font-weight: normal;
    	font-style: normal;
	}
	
	
	* {
    	
    	font-family:  'GmarketSansMedium'; /* 기본 폰트 설정 */
	}


    body, html {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
        color: #333;
    }

    .container {
        width: 90%;
        max-width: 1200px;
        margin: 20px auto;
        background: #fff;
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.15);
        border-radius: 8px;
    }

    .card {
        background: #ffffff;
        border: none;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        border-radius: 8px;
        overflow: hidden;
        margin-bottom: 20px;
    }

    .card-img-top {
        width: 100%;
        height: auto;
        object-fit: cover;
    }

    .card-body {
        padding: 15px;
    }

    .card-title {
        color: #000256;
        font-size: 1.6em;
    }

    .card-text {
        color: #666;
        font-size: 1em;
        margin-bottom: 0.5em;
    }

           /* 고정바 스타일 */
        .btn-container {
          position: fixed;
  		  width: 100%;
   		  bottom: 0;
    	  left: 0;
		  background-color: #fff;
		  color: #c6cdff;
		  box-shadow: 15px 10px 10px 6px;
		  padding: 20px;
		  z-index: 1000;
		  display: flex;
	  	  justify-content: flex-end;
}

        /* 버튼 스타일 */
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
}

    .btn:hover, .btn-outline-primary:hover {
        background-color:#001A50;
        color: #ffffff;
    }

    input[type="date"], input[type="number"], input[type="radio"] {
        margin-top: 10px;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
    }

    input[type="radio"] {
        margin-right: 5px;
    }

    label {
        margin-left: 5px;
        font-size: 1em;
    }

    table {
        width: 100%;
        margin-top: 20px;
    }

    @media (max-width: 768px) {
        .container {
            width: 98%;
        }

        .card, .btn {
            width: 100%;
        }
    }
</style>

<body>
    <div class="container">
        <form action="${pageContext.request.contextPath}/air/airFlightSelect/" method="post">
         <div class="btn-container">
            <!-- 이전으로 돌아가기 -->
           <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/tra/traindex/">이전으로 돌아가기</a>
            
            <!--  항공권 구매 안함 -->
            <a class="btn btn-outline-primary" href="${pageContext.request.contextPath }/hotel/hotelList">항공권 구매 안함</a>
            <!-- 선택 완료 -->
            <button type="submit" class="btn btn-outline-primary">다음 여정</button>
        </div>
            <div class="card">
                <img src="https://dynamic-media-cdn.tripadvisor.com/media/photo-o/26/97/39/7f/caption.jpg?w=1200&h=-1&s=1&cx=1920&cy=1080&chk=v1_f31158e4bb953d28a308" class="card-img-top" alt="Festival Image">
                <div class="card-body">
                    <h3 class="card-title">${list.festivalName}</h3>
                    <p class="card-text">${list.country} ${fn:substring(list.startDay, 0, 10)} ~ ${fn:substring(list.endDay, 0, 10)}</p>
                </div>
            </div>

            <!-- 출국 공항 선택 -->
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">출국 공항</h5>
                    <p class="card-text">
                        <c:forEach var="li" items="${airList}">
                            <input type="radio" name="depAirport" class="form-check-input" id="${li}" onChange="selectArrAirport(event)" required="required"/>
                            <label for="${li}" class="form-check-label">${li}</label>
                        </c:forEach>
                    </p>
                </div>
            </div>

            <!-- 입국 공항 선택 -->
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">입국 공항</h5>
                    <p class="card-text" id="arrAirport"></p>
                </div>
            </div>

            <!-- 일정 선택 -->
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">일정 선택</h5>
                    <p class="card-text">
                        <label for="depTime">가는 날짜</label>
                        <input type="date" required="required" id="depTime" onchange="selectDepDate(event)" /><br>
                        <label for="rtnTime">오는 날짜</label>
                        <input type="date" id="rtnTime" onchange="selectRtnDate(event)" required="required"/>
                    </p>
                </div>
            </div>

            <!-- 인원 선택 -->
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">인원 선택</h5>
                    <p class="card-text">
                        <div class="input-group mb-3">
                            <span class="input-group-text">성인</span>
                            <input type="number" class="form-control" placeholder="만 12세 이상" name="adult" id="adult" min="1" step="1" value="1"/>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text">청소년</span>
                            <input type="number" class="form-control" placeholder="만 12세 미만" name="child" id="child" min="0" step="1" value="0"/>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text">유아</span>
                            <input type="number" class="form-control" placeholder="만 2세 미만" name="baby" id="baby" min="0" step="1" value="0"/>
                        </div>
                    </p>
                </div>
            </div>

          
        </form>
    </div>

		



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script type="text/javascript">

const depTime = document.querySelector("#depTime");

let today = new Date();
let dd = today.getDate();
let mm = today.getMonth()+1; 
    
let yyyy = today.getFullYear();
   
if(dd<10){ dd= '0'+ dd + 1 } 

if(mm<10){ mm= '0' + mm }

today = yyyy + '-' + mm + '-' + dd;

document.getElementById("depTime").setAttribute("min", today);


/* 도착 공항 선택 */
function selectArrAirport(e){
	
    let url = "${pageContext.request.contextPath}/air/depAir?depAir=" + e.target.id; 
        
    fetch(url)
    .then( res => res.text() )
    .then( text => {
    	document.querySelector("#arrAirport").innerHTML = text;
    })
    
    url = "${pageContext.request.contextPath}/air/airText?text=" + e.target.id;
    
    fetch(url)
    .then( res => res.text() )
    .then( text => {
    	document.querySelector("#returnArrAirport").innerHTML = text;
    	document.querySelector("#airList").innerHTML = "";
    })
       
}

/* 도착 공항 선택 */
function selectDate(e){

    console.log( e.target.id );
    let url = "${pageContext.request.contextPath}/air/arrAir?arrAir=" + e.target.id; 
        
    fetch(url)

}
    
/* 출국 날짜 선택 */
function selectDepDate(e){

	let date = e.target.value 

    let url = "${pageContext.request.contextPath}/air/airDepDate?date=" + date;
    
    fetch(url)
    
    document.getElementById("rtnTime").setAttribute("min", date);
    
}

/* 출국 날짜 선택 */
function selectRtnDate(e){

	let date = e.target.value 

    let url = "${pageContext.request.contextPath}/air/airRtnDate?date=" + date;
    
    fetch(url)
            
    document.getElementById("rtnTime").setAttribute("min", date);
    
}


</script>
</body>
