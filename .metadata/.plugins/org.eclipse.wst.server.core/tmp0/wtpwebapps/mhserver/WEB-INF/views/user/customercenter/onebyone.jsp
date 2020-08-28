<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/inc/header.jsp"%>
<link rel="stylesheet" href="/mh/css/customerCenter.css">
</head>
<style>
#goBack {
	display: block;
	width: 150px;
	height: 45px;
	font-size: 1.2em;
	background-color: white;
	color: #08718E;
	border: 1px solid #08718E;
	border-radius: 3px;
	margin: 30px auto;
}
</style>
<body>

	<%
		out.flush();
	    RequestDispatcher dinfo = request.getRequestDispatcher("/user/mypage/mypage_cinfo.do");
		dinfo.include(request, response);
	%>
	<!-- 마이페이지 컨텐츠 부분 -->
	<div style="width: 1100px; min-height: 550px; margin: 60px auto;">

		<!-- ※ 왼쪽 영역 시작 ※ -->
		<div id="MyMenu" style="width: 200px; height: auto; float: left;">
			<div>고객 센터</div>
			<div id="goNotice" class="menulist ">
				<div onclick="location.href='/mh/user/customercenter/customercenter.do';">공지사항</div>
				<div class="arrow">></div>
			</div>
			<div id="goQnA" class="menulist nowPage">
				<div>1:1 문의</div>
				<div class="arrow">></div>
			</div>
			<div id="go1to1Q" class="qlist">
				<div>
					<div
						style="height: 0px; font-size: 0.95em; position: relative; top: -7px; font-weight: bold;">도움이
						필요하신가요?</div>
					<div
						style="height: 0px; font-size: 0.7em; position: relative; top: 8px;">1:1
						문의하기</div>
				</div>
				<div style="color: #08718E;">></div>
			</div>
		</div>
		<!-- ※ 왼쪽 영역 끝 ※ -->

		<!-- ---------------------------------------------------------------------------- -->

		<!-- ※ 오른쪽 영역 시작 ※ -->

		<div
			style="width: 870px; height: auto; float: left; margin-left: 30px; vertical-align: middle;">

			<!-- 마이페이지 메뉴 헤더 들어가는 부분 -->
			<div style="height: 82px; border-bottom: 2px solid #08718E;">
				<div style="float: left;">
					<h2 id="title">
						1:1 문의<span id="subtitle"></span>
					</h2>
				</div>

			</div>

			<!-- ---------------------------------------------------------------------------- -->

			<!-- 콘텐츠 영역 -->
			<!-- 공지사항 테이블 -->
			<table id="tblNotice" class="table table-bordered">
				<tr>
					<th>번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
				<c:forEach items="${list}" var="dto">
					<tr class="inquiryList"
						onclick="location.href='/mh/user/customercenter/onebyoneanswer.do?seq=${dto.seq}'">
						<td>${dto.seq }</td>
						<td>${dto.category }</td>
						<td class="noticeTitle" id="notice3">${dto.content }</td>
						<td>${dto.inquirydate }</td>
					</tr>
				</c:forEach>

			</table>

			<!-- 페이지 바 -->
			<nav id="pagebar" class="pagebar"
				style="text-align: center; margin-top: 40px;">
				<ul class="pagination">
					<li><a href="#">&laquo;</a></li>
					<li><a href="#">&lsaquo;</a></li>
					<li class="active"><a href="#" style="z-index: 0;">1</a></li>
					<li><a href="#">&rsaquo;</a></li>
					<li><a href="#">&raquo;</a></li>
				</ul>
			</nav>

			<!-- ※ 오른쪽 영역 끝 ※ -->
			<input type="button" id="goBack" value="문의 작성"
				onclick="location.href='/mh/user/customercenter/onebyoneinquiry.do?'">
		</div>
		<div style="clear: both;"></div>
	</div>


	<!-- footer -->
	 <a href="#" id="topbtn" style="border: 0px; outline: none;"></a>
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
	<script>
		$(".menulist").mouseover(function() {
			$(this).addClass("focusPage");
		});
		$(".menulist").mouseout(function() {
			$(this).removeClass("focusPage");
		});
	</script>
	<script src="/mh/js/main.js"></script>
</body>
</html>