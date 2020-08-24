<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마켓허리 :: 오늘의 장보기</title>
	<%@include file="/WEB-INF/views/inc/header.jsp" %>
	<script src="/mh/js/main.js"></script>
	<style>
	
		.eventDiv {
		    width: 1100px;
			margin: 60px auto;
		}
		
		.eventDiv > a > img {
			width: 1100px;
		}
	
	</style>
</head>

<body>

	<c:forEach items="${list}" var="i">
	    <div class="eventDiv">
	        <a onclick="location.href='/mh/user/event/eventlist.do?seq=${i.seq}';" style="cursor: pointer;">
	            <img src="${i.img}">
	        </a>        
	    </div>
    </c:forEach>

<!-- footer -->
<%@include file="/WEB-INF/views/inc/footer.jsp" %>
</body>
</html>