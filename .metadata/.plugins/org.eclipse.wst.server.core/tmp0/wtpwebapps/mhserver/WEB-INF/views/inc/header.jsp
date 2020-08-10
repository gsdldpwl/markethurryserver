<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/inc/asset.jsp" %>

<!-- hiding menu -->
<div id="menubartp">
	<a href="" class="hyperlink">전체 카테고리</a> <a href="" class="hyperlink">HOT
		상품</a> <a href="" class="hyperlink">알뜰 상품</a> <a href="" class="hyperlink">나만의
		레시피</a> <a href="" class="hyperlink">이달의 이벤트</a> <input type="text"
		id="searchbox" value="검색내용을 입력해주세요."> <span
		class="glyphicon glyphicon-search" id="searchimg"></span> <a href="#"
		id="shoppingbox"></a>
</div>

<!-- user menu (register, login , as) -->
<div id="noticebar">
	<div id="noticeMent">
		<span class="eachNotice">[마켓허리] "허리라이프-어디든 간다! 마켓멀리! 신선하지 않은
			신선MD의 신선한 장미를 찾아서" 댓글이벤트 당첨 결과</span> <span class="eachNotice">[마켓허리]
			유튜브 ‘컬리라이프-일할 때도 쉴 때도 먹어야 한다, 극한직업 컬리 MD편’ 댓글 이벤트 당첨 공지</span> <span
			class="eachNotice">[마켓허리] 코로나19 확진자 관련 현황 및 대응조치 안내</span> <span
			class="eachNotice">[가격인상공지] [모어댄프레쉬] 맥돈 삼겹살 구이용 300g 외 23건
			(2020 5. 20 ~)</span> <span class="eachNotice">[마켓컬리] 개인정보처리방침 개정 내용
			사전안내</span>
	</div>
</div>
<header>
	<div id="usermenu">
		<a href="register.html" class="hyperlink">회원가입</a> <a
			href="login.html" class="hyperlink">로그인</a> <a
			href="../../user/customerCenter.html" class="hyperlink">고객센터</a>
	</div>
	<!-- 마켓허리 로고 -->
	<img src="/mh/images/brandlogo.png" alt="brandlogo" id="brandlogo">
</header>


<!-- menu bar -->
<div id="menubar">
	<a href="" class="hyperlink">전체 카테고리</a> <a href="" class="hyperlink">HOT
		상품</a> <a href="" class="hyperlink">알뜰 상품</a> <a href="" class="hyperlink">나만의
		레시피</a> <a href="" class="hyperlink">이달의 이벤트</a> <input type="search"
		id="searchbox" value="검색내용을 입력해주세요." autocomplete="off"> <span
		class="glyphicon glyphicon-search" id="searchimg"></span> <a href="#"
		id="shoppingbox"></a>
</div>

<!-- detail menu -->
<!-- todo -->
<div id="detailmenu">
	<ul style="list-style: none;">
		<a href=""><li>채소</li></a>
		<a href=""><li>과일</li></a>
		<a href=""><li>육류</li></a>
		<a href=""><li>수산</li></a>
		<a href=""><li>가공식품</li></a>
		<a href=""><li>양념, 소스</li></a>
		<a href=""><li>유제품</li></a>
		<a href=""><li>건강 식품</li></a>
		<a href=""><li>음료</li></a>
	</ul>
</div>