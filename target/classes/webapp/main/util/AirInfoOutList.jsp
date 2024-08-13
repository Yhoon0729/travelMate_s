<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:forEach var="list" items="${airListDep }">
	<input type="radio" name="outFlight" id="${list.flightCode }"
		 onChange="selectOutFlight(event)" />
	${ list.companyName}
	${ list.flightCode}편
	<c:set var="depTime" value="${list.depTime}" />
	${fn: substring( depTime, 11, 16)} ~
	<c:set var="arrTime" value="${list.arrTime}" />
	${fn: substring( arrTime, 11, 16)}
	${ list.seatClass}
	<fmt:formatNumber var="price" value="${ list.price}" pattern="#,##0" />
	${ price}원<br>
</c:forEach>
