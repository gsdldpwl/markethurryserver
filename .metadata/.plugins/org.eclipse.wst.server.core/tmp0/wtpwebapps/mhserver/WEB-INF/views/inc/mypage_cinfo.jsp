<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/mh/css/markethurryMyPage.css">

    <!-- 회원 정보 -->
    <div id="memberContain">
        <div style="display: inline-block; width: 760px; height: 170px; margin: 40px;">
            <div id="memberInfo">
                <c:if test="${dto.gradeseq == 1}">
		        <div id="memberGrade" style="color: #aee9ff; border-color: #aee9ff">${gradeinfo.name}</div>
		        </c:if>
		        <c:if test="${dto.gradeseq == 2}">
		        <div id="memberGrade" style="color: #7bd2f1; border-color: #7bd2f1">${gradeinfo.name}</div>
		        </c:if>
		        <c:if test="${dto.gradeseq == 3}">
		        <div id="memberGrade" style="color: #5abadd; border-color: #5abadd">${gradeinfo.name}</div>
		        </c:if>
		        <c:if test="${dto.gradeseq == 4}">
		        <div id="memberGrade" style="color: #3c98b9; border-color: #3c98b9">${gradeinfo.name}</div>
		        </c:if>
		        <c:if test="${dto.gradeseq == 5}">
		        <div id="memberGrade" style="color: #2983a3; border-color: #2983a3">${gradeinfo.name}</div>
		        </c:if>
		        <c:if test="${dto.gradeseq == 6}">
		        <div id="memberGrade" style="color: #08718E; border-color: #08718E">${gradeinfo.name}</div>
		        </c:if>
                <div style="width: 160px; height: 80px; text-align: left; margin: 45px 15px;">
                    <span id="memberName" class="txtInfo" style="margin-top: 10px; font-size: 1.3em; font-weight: bold;">${dto.name}<small>님</small></span>
                    <span id="memberBenefits" class="txtInfo">${gradeinfo.discountper}% 할인 + ${gradeinfo.mileageper}% 적립</span>
                </div>
                <div>
                    <input id="goAllGrade" type="button" value="전체 등급 보기" class="btnGrade" style="margin-bottom: 10px;">
                    <input id="goNextGrade" type="button" value="다음 달 예상 등급 보기" class="btnGrade">
                </div>
            </div>
            <div id="memberPoint">
                <div style="margin-bottom: 0px;">마일리지</div>
                <div id="goMyPoint_info" style="margin-top: 30px; font-size: 1.4em;">
                    <span style=" color: #08718E;">${totalmilaege} P</span>
                    <span style=" color: #aaaaaa;">></span>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        // 전체 등급 보기 클릭시
        $("#goAllGrade").click(function() {
        	location.href='/mh/user/mypage/membership_info.do';
        });

        // 다음 달 예상 등급 보기 클릭시
        $("#goNextGrade").click(function() {
        	location.href='/mh/user/mypage/membership_next.do';
        });
    </script>