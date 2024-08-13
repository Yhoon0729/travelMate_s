<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<body>

<div class="container">
 
 <h2>축제 리스트</h2>
 
 <table class="table table-striped">
 
 	<thead>
 		<tr>
 			<th>축제 코드</th>
 			<th>국가</th>
 			<th>축제명</th>
 			<th>시작일</th>
 			<th>종료일</th>
 		</tr>
 	</thead>
 
 	<tbody>
 		<c:forEach var="list" items="${festivalList }">
 		
 		<tr>
 			<td>
 				<a href = 
 				"${pageContext.request.contextPath }/tra/festivalUpdate?code=${list.code}">
 					${list.code }
 				</a>
 			</td>
 			<td>${list.country }</td>
 			<td>${list.festivalName }</td>
 			<td>${list.startDay }</td>
 			<td>${list.endDay }</td>
 		</tr>
 		
 		</c:forEach>
 	</tbody>
 
 </table>
 
 <a class="btn btn-outline-primary" 
	href="${pageContext.request.contextPath }/tra/inputFestival">
 	새 축제 상품 입력</a>
 
 </div>
 
</body>
