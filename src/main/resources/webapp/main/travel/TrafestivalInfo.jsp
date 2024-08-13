<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<body>

<div class="container">

	<form action=" ${pageContext.request.contextPath}/air/airindex?code=${list.code }" method="post">
	
		<h1>축제 상세 정보</h1>
	
		<table class="table table-striped">
		
			<tbody>
				
				<tr>
					<td>국가명</td>
					<td>${list.country }</td>					
				</tr>
								
				<tr>
				
					<td>축제명</td>
					<td>${list.festivalName }</td>					
				</tr>
				
				<tr>
					<td>축제 기간</td>
					<td style="width:450px;">
						<c:set var="startDay" value="${list.startDay }"/>
						<c:set var="endDay" value="${list.endDay }"/>
						 ${fn:substring(startDay,0,10) }
						 ~ ${fn:substring(endDay,0,10) }</td>					
				</tr>

				<tr>
					<td>축제정보</td>
					<td>${list.info1 }</td>					
				</tr>

				<tr>
					<td>축제정보</td>
					<td>${list.info2 }</td>					
				</tr>

				<tr>
					<td>축제정보</td>
					<td>${list.info3 }</td>					
				</tr>
				
				<tr>
					<td>관련 정보</td>
					<td>${list.url1 }</td>					
				</tr>

				<tr>
					<td>관련 정보</td>
					<td>${list.url2 }</td>					
				</tr>

				<tr>
					<td>관련 정보</td>
					<td>${list.url3 }</td>					
				</tr>
				
			</tbody>
		
		</table>
		
		<!-- 확인 -->

	<a class="btn btn-outline-primary" href="traindex">이전 페이지</a>
	
	<button type="submit" class="btn btn-outline-primary">선택완료</button>
	
	</form>
</div>
</body>
