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

	<h2>로그 기록</h2>
	
	<table class="table table-striped">
	
		<thead>
			<tr>
				<th>로그 번호</th>	
				<th>UserId</th>
				<th>활동 내역</th>
				<th>활동 시간</th>
			</tr>
		</thead>
	
		<tbody>
		
			<c:forEach	var="list" items="${logList}">
			
				<tr>
					<td>${list.no }</td>
					<td>${list.userId }</td>
					<td>${list.act }</td>
					<td>${list.logDate }</td>
				</tr>
			
			
			</c:forEach>
		
		</tbody>
	
	</table>

	<!-- pagenation 구현 -->
	<nav aria-label="Page navigation example" >
  		<ul class="pagination">
    		<li class="page-item" ><a class="page-link" href="#" onClick="prevPage()">Previous</a></li>
    			
    		<c:forEach var="count" begin="${pageStart }" end="${pageEnd }" step="1">
    			<li class="page-item">
				<a class="page-link" href="${pageContext.request.contextPath }/adm/logListPage?page=${count }">${count }</a>
				</li>
			</c:forEach>
				
			<li class="page-item"><a class="page-link" href="#" onClick="nextPage()">Next</a></li>
  		</ul>
	</nav>
	
	<a class="btn btn-outline-primary" href="logListAnal">
		통계 화면
	</a>
		
</div>


</body>

<script type="text/javascript">

	function prevPage(){

		let page = "${pageStart}" * 1 - 10;
		
		if( page < 1 ){
			page = 1;
		}
		
		location.href="${pageContext.request.contextPath}/adm/logListPagePro?page=" + page;
		
	}
	
	function nextPage(){

		let page = "${pageEnd}" * 1 + 1;
			
		if( page < 1 ){
			page = 1;
		}
				
		location.href="${pageContext.request.contextPath}/adm/logListPagePro?page=" + page;
		
				
	}

</script>


</html>