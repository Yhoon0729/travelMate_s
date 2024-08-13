<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 예약 최종 확인</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background: url('travel-background.jpg') no-repeat center center fixed;
        background-size: cover;
        color: #333;
        margin: 0;
        padding: 0;
    }
    .container {
        background-color: rgba(255, 255, 255, 0.9);
        padding: 20px;
        border-radius: 10px;
        max-width: 800px;
        margin: 50px auto;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h1, h2, h3 {
        text-align: center;
        color: #5a88ca;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
    }
    table, th, td {
        border: 1px solid #ddd;
    }
    th, td {
        padding: 12px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
    p {
        font-size: 16px;
    }
</style>
</head>
<body>
	<div class="container">
		<h1>예약 정보</h1>

		<h2>== 축제 정보 ==</h2>
		<table>
			<tr>
				<th>축제명</th>
				<th>국가</th>
				<th>정보</th>
			</tr>
			<c:forEach var="festival" items="${festival}">
				<tr>
					<td>${festival.festivalName}</td>
					<td>${festival.country}</td>
					<td>${festival.info1}</td>
				</tr>
			</c:forEach>
		</table>

		<h2>== 항공편 정보 ==</h2>
		<h3>출국 정보</h3>
		<table>
			<tr>
				<th>항공사</th>
				<th>항공편</th>
				<th>출발 국가 및 도시</th>
				<th>도착 국가 및 도시</th>
				<th>출발 시간</th>
			</tr>
			<c:forEach var="outflight" items="${outflight}">
				<tr>
					<td>${outflight.companyName}</td>
					<td>${outflight.flightCode}</td>
					<td>${outflight.depCity}, ${outflight.depAirportName}</td>
					<td>${outflight.arrCity}, ${outflight.arrAirportName}</td>
					<td>${outflight.depTime}, ${outflight.day}</td>
				</tr>
			</c:forEach>
		</table>

		<h3>입국 정보</h3>
		<table>
			<tr>
				<th>항공사</th>
				<th>항공편</th>
				<th>출발 국가 및 도시</th>
				<th>도착 국가 및 도시</th>
				<th>출발 시간</th>
			</tr>
			<c:forEach var="inflight" items="${inflight}">
				<tr>
					<td>${inflight.companyName}</td>
					<td>${inflight.flightCode}</td>
					<td>${inflight.depCity}, ${inflight.depAirportName}</td>
					<td>${inflight.arrCity}, ${inflight.arrAirportName}</td>
					<td>${inflight.depTime}, ${inflight.day}</td>
				</tr>
			</c:forEach>
		</table>

		<h2>== 호텔 정보 ==</h2>
		<table>
			<tr>
				<th>호텔 시리얼 번호</th>
				<th>체크인 날짜</th>
				<th>체크아웃 날짜</th>
				<th>인원</th>
				<th>가격</th>
			</tr>
			<c:forEach var="hotelBooking" items="${hotelBooking}">
				<tr>
					<td>${hotelBooking.htlId}</td>
					<td>${hotelBooking.htlCheckin}</td>
					<td>${hotelBooking.htlCheckout}</td>
					<td>${hotelBooking.htlAdult}</td>
					<td>${hotelBooking.htlTotalprice}</td>
				</tr>
			</c:forEach>
		</table>

		<h2>== 렌트카 정보 ==</h2>
		<table>
			<tr>
				<th>렌트카 회사</th>
				<th>렌트카 차량명</th>
				<th>렌트 시작 날짜</th>
				<th>렌트 반납 날짜</th>
				<th>가격</th>
			</tr>
			<c:forEach var="carRent" items="${carRent}">
				<tr>
					<td>${carRent.carCom}</td>
					<td>${carRent.carName}</td>
					<td>${carRent.carStartDate}</td>
					<td>${carRent.carEndDate}</td>
					<td>${carRent.totFee}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
