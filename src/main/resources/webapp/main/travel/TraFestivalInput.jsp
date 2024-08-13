<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl 사용 설정  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<body>

<div class="container">
	
	<form action="#" method="post" onsubmit="return false;">
	
		<h1>축제 정보 입력</h1>
	
		<table class="table table-striped">
		
			<thead>
				
				<tr>
					<th>입력 항목</th>
					<th style="width:300px;">입력 사항</th>
					<th style="width:300px;">입력 내용</th>
				</tr>
			
			</thead>
			
			<tbody>
			
				<tr>
					<th>계절</th>
					<td>
						<input type="radio" name="season"
						 id="season" value="spr" onChange="selectSeason(event)"/>
					 	<label for="season">봄</label>
					 	
					 	<input type="radio" name="season"
						 id="season" value="sum" onChange="selectSeason(event)"/>
					 	<label for="season">여름</label>
					 	
					 	<input type="radio" name="season"
						 id="season" value="fal" onChange="selectSeason(event)"/>
					 	<label for="season">가을</label>
					 	
					 	<input type="radio" name="season"
						 id="season" value="win" onChange="selectSeason(event)"/>
					 	<label for="season">겨울</label>
					</td>
					
					<td>
						<div id="seasonConfirm"></div>
					</td>
				</tr>
				
				<tr>
					<th>국가</th>
					<td>
						<label for="countryName">국가명 입력(한글)</label>
						<br>
						<input type="text" id="countryName"
						 onKeyup="selectCountry(event)" />
					 	
					</td>
					<td>
						<div id="country"></div>
					 	<div id="countryCode"></div>
					</td>
				</tr>

				<tr>
					<th>축제명</th>
					<td>
						<label for="festival">축제명 입력</label>
						<br>
						<input type="text" id="festival"
						 onKeyup="inputFestival(event)" />
					 	
					</td>
					<td>
						<div id="festivalName"></div>
					</td>
				</tr>
				
				<tr>
					<th>축제 기간</th>
					<td>
						<label for="start">축제 시작일</label>
						<input type="date" id="start"
						 onChange="inputStart(event)" />
						<br>
						<label for="end">축제 종료일</label>
						<input type="date" id="end"
						 onChange="inputEnd(event)" /> 
						 
						 <br>
					 	
					</td>
					<td>
						<div id="startDay"></div>
					 	<div id="endDay"></div>
					</td>
				</tr>
				
				<tr>
					<th>상세 정보 1</th>
					<td>
						<textarea rows="10" cols="30" id="detail1"
						 onKeyup="inputDetail1(event)"></textarea>
					</td>
					<td>
						<div id="confirmDetail1"></div>
					</td>
				</tr>
				
				<tr>
					<th>상세 정보 2</th>
					<td>
						<textarea rows="10" cols="30" id="detail2"
						 onKeyup="inputDetail2(event)"></textarea>
					</td>
					<td>
						<div id="confirmDetail2"></div>
					</td>
				</tr>
				
				<tr>
					<th>상세 정보 3</th>
					<td>
						<textarea rows="10" cols="30" id="detail3"
						 onKeyup="inputDetail3(event)"></textarea>
					</td>
					<td>
						<div id="confirmDetail3"></div>
					</td>
				</tr>
				
				<tr>
					<th>URL 정보 1</th>
					<td>
						<label for="url1">URL 입력</label>
						<input type="text" id="url1"
						 onKeyup="inputUrl1(event)"/>
					</td>
					<td>
						<div id="confirmUrl1"></div>
					</td>
				</tr>
				
				<tr>
					<th>URL 정보 2</th>
					<td>
						<label for="url2">URL 입력</label>
						<input type="text" id="url2"
						 onKeyup="inputUrl2(event)"/>
					</td>
					<td>
						<div id="confirmUrl2"></div>
					</td>
				</tr>
				
				<tr>
					<th>URL 정보 3</th>
					<td>
						<label for="url3">URL 입력</label>
						<input type="text" id="url3"
						 onKeyup="inputUrl3(event)"/>
					</td>
					<td>
						<div id="confirmUrl3"></div>
					</td>
				</tr>
			
			</tbody>
		
		</table>
		
		<a class="btn btn-outline-primary" href="festivalList">
		리스트 화면으로 돌아가기
		</a>
		
		<input type="button" class="btn btn-outline-primary" onClick="inputConfirm(event)" value="입력완료" />
	</form>
</div>
</body>

<script type="text/javascript">

	/* data 수집 */
	let code ="";
	
	let season = "";
	let countryCode = "";
	let country = "";
	
	let festivalName = "";
	let startDay = "";
	let endDay = "";
	
	let detail1 = "";
	let detail2 = "";
	let detail3 = "";
	
	let url1 = "";
	let url2 = "";
	let url3 = "";
	
	/* 계절 선택 */

	function selectSeason(e){
		season = e.target.value;
		
		document.getElementById("seasonConfirm").innerText =
        	e.target.value;
	}
	
	/* 국가 검색 */	
	function selectCountry(event) {
    	event.preventDefault(); // 기본 동작 취소
            	
        let countryKo = event.target.value.trim();
                
        document.getElementById("country").innerText =
              	"국가명 : " + countryKo;
                
        country = countryKo;
                
        let url =
           	"${pageContext.request.contextPath}/tra/searchCountry?country="
        			+ countryKo;
               	
        fetch(url)
        	.then( res => res.text())
          	.then( text => {
         		let code = text.trim();
               		
         		document.getElementById("countryCode").innerText =
                    	"국가코드 : " + code
                   	
               	countryCode = code;
          	} )

        }

	

	/* 축제명 입력 */	
	function inputFestival(event) {
    	event.preventDefault(); // 기본 동작 취소
        let name = event.target.value.trim();
                
      	document.getElementById("festivalName").innerText =
          	"축제명 : " + name;
                
      	festivalName = name;
    }

	
	/* 축제 시작일 입력 */	
	function inputStart(event) {
         event.preventDefault(); // 기본 동작 취소
            	
         let start = event.target.value.trim();
                
         document.getElementById("startDay").innerText =
               	"시작일 : " + start;
                
         startDay = start;
    }

	
	/* 축제 종료일 입력 */	
	function inputEnd(event) {
         event.preventDefault(); // 기본 동작 취소
            	
         let end = event.target.value.trim();
                
         document.getElementById("endDay").innerText =
               	"종료일 : " + end;
                
         endDay = end;
    }
	
	/* detail1 입력 */	
	function inputDetail1(event) {
         event.preventDefault(); // 기본 동작 취소
            	
         let data = event.target.value.trim();
                
         document.getElementById("confirmDetail1").innerText =
               	data;
                
         detail1 = data;
    }
	
	/* detail2 입력 */	
	function inputDetail2(event) {
         event.preventDefault(); // 기본 동작 취소
            	
         let data = event.target.value.trim();
                
         document.getElementById("confirmDetail2").innerText =
               	data;
                
         detail2 = data;
    }

	/* detail3 입력 */	
	function inputDetail3(event) {
         event.preventDefault(); // 기본 동작 취소
            	
         let data = event.target.value.trim();
                
         document.getElementById("confirmDetail3").innerText =
               	data;
                
         detail3 = data;
    }

	/* url1 입력 */	
	function inputUrl1(event) {
         event.preventDefault(); // 기본 동작 취소
            	
         let data = event.target.value.trim();
                
         document.getElementById("confirmUrl1").innerText =
               	data;
                
         url1 = data;
    }

	
	/* url2 입력 */	
	function inputUrl2(event) {
         event.preventDefault(); // 기본 동작 취소
            	
         let data = event.target.value.trim();
                
         document.getElementById("confirmUrl2").innerText =
               	data;
                
         url2 = data;
    }

	
	/* url3 입력 */	
	function inputUrl3(event) {
         event.preventDefault(); // 기본 동작 취소
            	
         let data = event.target.value.trim();
                
         document.getElementById("confirmUrl3").innerText =
               	data;
                
         url3 = data;
    }

	
	
	/* 입력 완료 */
	function inputConfirm(event){
		
		let start = startDay.split('-').join('');
		
		code = countryCode + season + start;
		
		if( (season == "") || (country == "") || (countryCode == "") ||
			(festivalName == "") || (startDay == "") || (endDay == "")){
			alert("입력 사항을 확인하세요. 미입력된 부분이 있습니다.");
		}else{

			const url = "${pageContext.request.contextPath}/tra/festivalConfirm?code=" + code +
						"&season=" + season + "&country=" + country +
						"&countryCode=" + countryCode +
						"&festivalName=" + festivalName + 
						"&startDay=" + startDay + "&endDay=" + endDay +
						"&info1=" + detail1 + "&info2=" + detail2 +
						"&info3=" + detail3 + "&url1=" + url1 +
						"&url2=" + url2 + "&url3=" + url3
						
						;
			
			fetch( url )
			.then( res=>res.text() )
			.then( text=>{
				
				location.href = text; 
			})
			;
				
			}
		}
		
	

	
</script>














