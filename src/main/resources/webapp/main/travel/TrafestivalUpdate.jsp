<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<body>

<div class="container">

	<form action="#" method="post" onsubmit="return false;">

		<h1>축제 상세 정보</h1>

		<table class="table table-striped">

			<thead>
				<tr>
					<th>항목</th>
					<th style="width: 250px;">변경전</th>
					<th style="width: 250px;">변경후</th>
				</tr>
			</thead>


			<tbody>
			
				<tr>
					<td>촉제코드</td>
					<td>${list.code }</td>
					<td>
					${list.code }<br>
					변경 불가 신규 입력하세요.
					</td>
				</tr>

				<tr>
					<td>국가명</td>
					<td>${list.country }</td>
					<td>
					${list.country }<br>
					변경 불가 신규 입력하세요.
					</td>
				</tr>

				<tr>
					<td>계절</td>
					<td>${list.season }</td>
					<td>
					${list.season }
					<br>
					변경 불가 신규 입력하세요.
					</td>
				</tr>

				<tr>
					<td>축제명</td>
					<td>${list.festivalName }</td>
					<td>
						<input type="text" id="festival"
						 value="${list.festivalName }"
						onKeyup="inputFestival(event)" />
					</td>
				</tr>

				<tr>
					<td>축제 기간</td>
					<td>
						<c:set var="startDay" value="${list.startDay }" />
						<c:set var="endDay" value="${list.endDay }" />
						${fn:substring(startDay,0,10) } ~ ${fn:substring(endDay,0,10) }
					</td>
					<td>
						<label for="start">축제 시작일</label>
						<input type="date" id="start"
						 value="${fn:substring(startDay,0,10) }"
						 onChange="inputStart(event)" />
						<br>
						<label for="end">축제 종료일</label>
						<input type="date" id="end"
						 value="${fn:substring(endDay,0,10)}"
						 onChange="inputEnd(event)" /> 
					</td>
					
				</tr>

				<tr>
					<td>축제정보1</td>
					<td>${list.info1 }</td>
					<td>
						<textarea rows="10" cols="40" id="detail1"
						 onKeyup="inputDetail1(event)">${list.info1 }</textarea>
					</td>
				</tr>

				<tr>
					<td>축제정보2</td>
					<td>${list.info2 }</td>
					<td>
						<textarea rows="10" cols="40" id="detail2"
						 onKeyup="inputDetail2(event)">${list.info2 }</textarea>
					</td>
				</tr>

				<tr>
					<td>축제정보3</td>
					<td>${list.info3 }</td>
					<td>
						<textarea rows="10" cols="40" id="detail3"
						 onKeyup="inputDetail3(event)">${list.info3 }</textarea>
					</td>
				</tr>

				<tr>
					<td>관련 정보1</td>
					<td>${list.url1 }</td>
					<td>
						<input type="text" id="url1"
						 value="${list.url1 }"
						 onKeyup="inputUrl1(event)"/>
					</td>
					
				</tr>

				<tr>
					<td>관련 정보</td>
					<td>${list.url2 }</td>
					<td>
						<input type="text" id="url2"
						 value="${list.url2 }"
						 onKeyup="inputUrl2(event)"/>
					</td>
				</tr>

				<tr>
					<td>관련 정보</td>
					<td>${list.url3 }</td>
					<td>
						<input type="text" id="url3"
						 value="${list.url3 }"
						 onKeyup="inputUrl3(event)"/>
					</td>
				</tr>

			</tbody>

		</table>

		<!-- 확인 -->

		<a class="btn btn-outline-primary" href="festivalList">이전 페이지</a>

		<button type="button" class="btn btn-outline-primary"
		 onClick = "inputConfirm(event)">변경완료</button>
		
		<button type="button" class="btn btn-outline-primary"
		 onClick = "deleteConfirm(event)">삭제</button>

	</form>

</div>
</body>

<script type="text/javascript">

	/* data 수집 */
	let code ="${list.code}";
	
	let season = "${list.season}";
	let countryCode = "${list.countryCode}";
	let country = "${list.country}";
	
	let festivalName = "${list.festivalName}";
	let startDay = "${list.startDay}";
	let endDay = "${list.endDay}";
	
	let detail1 = "${list.info1}";
	let detail2 = "${list.info2}";
	let detail3 = "${list.info3}";
	
	let url1 = "${list.url1}";
	let url2 = "${list.url2}";
	let url3 = "${list.url3}";
	
	/* 축제명 입력 */	
	function inputFestival(event) {
    	event.preventDefault(); // 기본 동작 취소
        let name = event.target.value.trim();
      	festivalName = name;
    }

	
	/* 축제 시작일 입력 */	
	function inputStart(event) {
         event.preventDefault(); // 기본 동작 취소
            	
         let start = event.target.value.trim();
         startDay = start;
    }

	
	/* 축제 종료일 입력 */	
	function inputEnd(event) {
         event.preventDefault(); // 기본 동작 취소
            	
         let end = event.target.value.trim();
                
         endDay = end;
    }
	
	/* detail1 입력 */	
	function inputDetail1(event) {
         event.preventDefault(); // 기본 동작 취소
            	
         let data = event.target.value.trim();
         detail1 = data;
    }
	
	/* detail2 입력 */	
	function inputDetail2(event) {
         event.preventDefault(); // 기본 동작 취소
            	
         let data = event.target.value.trim();
                
         detail2 = data;
    }

	/* detail3 입력 */	
	function inputDetail3(event) {
         event.preventDefault(); // 기본 동작 취소
            	
         let data = event.target.value.trim();
                
         detail3 = data;
    }

	/* url1 입력 */	
	function inputUrl1(event) {
         event.preventDefault(); // 기본 동작 취소
            	
         let data = event.target.value.trim();
                
         url1 = data;
    }

	
	/* url2 입력 */	
	function inputUrl2(event) {
         event.preventDefault(); // 기본 동작 취소
            	
         let data = event.target.value.trim();
                
         url2 = data;
    }

	
	/* url3 입력 */	
	function inputUrl3(event) {
         event.preventDefault(); // 기본 동작 취소
            	
         let data = event.target.value.trim();
                
         url3 = data;
    }

	
	
	/* 입력 완료 */
	function inputConfirm(event){
				
		if( (season == "") || (country == "") || (countryCode == "") ||
			(festivalName == "") || (startDay == "") || (endDay == "")){
			alert("입력 사항을 확인하세요. 미입력된 부분이 있습니다.");
		}else{

			const url = "${pageContext.request.contextPath}/tra/festivalUpdatePro?code=" + code +
						"&season=" + season + "&country=" + country +
						"&countryCode=" + countryCode +
						"&festivalName=" + festivalName + 
						"&startDay=" + startDay + "&endDay=" + endDay +
						"&info1=" + detail1 + "&info2=" + detail2 +
						"&info3=" + detail3 + "&url1=" + url1 +
						"&url2=" + url2 + "&url3=" + url3;
			
			fetch( url )
			.then( res => res.text() )
			.then( text => {
				location.href = text;
			});	
		}
	}

	/* 삭제 */
	function deleteConfirm(event){
		const url = "${pageContext.request.contextPath}/tra/festivalDeletePro?code=" + code;
			
		location.href = url;		
	}
	

	
	
</script>

