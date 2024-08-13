<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	#header {
		display: none;
	}
	
	#footer {
		display: none;
	}
</style>
<hr>
<p>${userId }</p>
<p>${commCon}</p>
<p>
	<fmt:formatDate value="${date}" pattern="yyyy/MM/dd HH:mm:ss" />
</p>
