<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
    
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>관리자 화면</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    

</head>
<body>
	
<div class="container">
	
		<h1>로그 통계</h1>
		
		<table class="table table-striped">
		
			<tr>
				<th colspan="2">축제 관련 접근 통계</th>
			</tr>
			
			<c:forEach var="list" items="${logAnal }">
				<c:if test="${fn:substring(list.act, 0, 3) == 'tra'}">
					<tr>
						<td>${list.act }</td>
						<td>${list.count }</td>
					</tr>
				</c:if>
			</c:forEach>
		
			<tr>
				<th colspan="2">항공권 관련 접근 통계</th>
			</tr>
			
			<c:forEach var="list" items="${logAnal }">
				<c:if test="${fn:substring(list.act, 0, 3) == 'air'}">
					<tr>
						<td>${list.act }</td>
						<td>${list.count }</td>
					</tr>
				</c:if>
			</c:forEach>
		
			<tr>
				<th colspan="2">호텔 관련 접근 통계</th>
			</tr>
			
			<c:forEach var="list" items="${logAnal }">
				<c:if test="${fn:substring(list.act, 0, 3) == 'hot'}">
					<tr>
						<td>${list.act }</td>
						<td>${list.count }</td>
					</tr>
				</c:if>
			</c:forEach>
		
			<tr>
				<th colspan="2">렌터카 관련 접근 통계</th>
			</tr>
			
			<c:forEach var="list" items="${logAnal }">
				<c:if test="${fn:substring(list.act, 0, 3) == 'car'}">
					<tr>
						<td>${list.act }</td>
						<td>${list.count }</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	
	<a class="btn btn-outline-primary" href="logList">
		리스트로 돌아가기
	</a>
	
</div>
	
	
	
</body>
</html>