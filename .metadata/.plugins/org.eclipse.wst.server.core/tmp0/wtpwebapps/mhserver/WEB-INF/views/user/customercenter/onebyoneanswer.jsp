<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/inc/header.jsp"%>
<link rel="stylesheet" href="/mh/css/customerCenter.css">
<style>
/* 신수진 */
#myReview>div, #aswReview>div {
	margin: 10px;
}

#myReview, #aswReview {
	width: 870px;
	height: auto;
	padding: 20px;
	border-top: 2px solid #08718E;
	border-bottom: 2px solid #08718E;
}

#reviewItem span {
	display: inline-block;
}

#reviewItem span:first-child {
	width: auto;
}

#reviewItem {
	font-size: 1.2em;
	font-weight: bold;
	padding-bottom: 10px;
}

#reviewTitle, #aswTitle {
	font-weight: bold;
	padding-bottom: 10px;
}

#aswTitle>div {
	float: right;
}

#reviewImg {
	width: auto;
	height: auto;
}

#reviewContent pre, #aswContent pre {
	border: none;
	width: 870px;
	height: auto;
	background-color: white;
	padding: 10px;
	overflow: auto;
	white-space: pre-wrap;
}

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

#detailinfobox {
	display: inline-block;
	width: auto;
	float: right;
	color: #888888;
}

.detailinfo {
	font-size: 12px;
	color: #888888;
}
</style>
</head>

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
			<!-- select button -->
			<div id="myReview">
				<div id="reviewItem">
					<span>제목 :</span><span id="itemName">${odto.title }</span>
					<div id="detailinfobox">
						<span class="detailinfo" style="color: black;">작성일:</span>&nbsp;<span
							class="detailinfo">${odto.inquirydate }</span> <span
							style="color: #08718E;">|</span>
					</div>
				</div>
				<div id="reviewImg"></div>
				<div id="reviewContent">
					<pre>${odto.content }</pre>


				</div>
			</div>

			<div id="aswReview" style="border-top: 0;">
				<div id="aswTitle">
					Re. Hurry Manager
					<div>
						<span class="detailinfo" style="color: black;">작성일:</span>&nbsp;<span
							class="detailinfo">${odto.answerdate }</span>
					</div>

				</div>
				<div id="aswContent">
					<pre>${odto.answercontent }</pre>
				</div>
			</div>
			<input type="button" id="goBack" value="뒤로가기" onclick="history.back();">

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
		
		$(".inquiryList").click(function(){
			location.href='/mh/user/customercenter/onebyoneanswer.do';
		})
	</script>
	<script src="/mh/js/main.js"></script>
</body>
</html>