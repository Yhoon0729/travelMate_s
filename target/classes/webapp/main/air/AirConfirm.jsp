<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 축제코드 </h1>
<ul>
	<li>${festivalCode }</li>
</ul>

<h1>출국</h1>
<ul>
	<li>항공편 : ${outFlightCode }</li>
	<li>요일 : ${depDate }</li>
	<li>날짜 : ${depDay }</li>
</ul>

<h1>입국</h1>
<ul>
	<li>항공편 : ${inFlightCode }</li>
	<li>요일 : ${rtnDate }</li>
	<li>날짜 : ${rtnDay }</li>
</ul>

<h1>인원수</h1>
<ul>
	<li>어른 : ${adult }</li>
	<li>청소년 : ${child }</li>
	<li>유아 : ${baby }</li>
</ul>

</body>
</html>