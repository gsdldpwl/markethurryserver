<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/inc/asset.jsp" %>   
<link rel="stylesheet" href="/mh/css/admin_template.css">
<link rel="stylesheet" href="/mh/css/jquery-ui.css" />
<script src="/mh/js/jquery-1.12.4.js"></script>
<script src="/mh/js/jquery-ui.js"></script>
<script src="/mh/js/highcharts.js"></script>
  
<!-- 헤더 -->
<div id="header">
    <div class="header">
        <div>
            <img id="logoimg" src="/mh/images/adminlogo.png" alt=""> 
        </div>
        <div id="home"><div id="homeglyphicon" class="glyphicon glyphicon-home"></div>홈페이지 바로가기</div>
    </div>
</div>

<!-- 메뉴 -->
<div id="side">
    <ul id="menu">
        <li>
            <!-- 상품 관리 메뉴(나중에 각 메뉴별로 href옵션에 링크 걸어야함) -->
            <div>
                <div class="glyphicon glyphicon-gift"></div>
                <a id="item">상품관리</a>
                <ul class="sublist" id="itemlist">
                    <li><a href="/mh/admin/product/searchproduct.do">상품 조회</a></li>
                    <li><a href="/mh/admin/product/enrollproduct.do">상품 등록</a></li>
                </ul>
            </div>
            <!-- 주문 관리 메뉴 -->
            <div>
                <div class="glyphicon glyphicon-shopping-cart"></div>
                <a id="order">주문관리</a>
                <ul class="sublist" id="orderlist">
                    <li><a href="/mh/admin/order/totalorder.do">전체 주문 목록</a></li>
                    <li><a href="">배송 관리</a></li>
                    <li><a href="/mh/admin/order/cancelorder.do">취소 / 교환 / 환불</a></li>
                </ul>
            </div>
            <!-- 고객 관리 메뉴 -->
            <div>
                <div class="glyphicon glyphicon-user"></div>
                <a href="/mh/admin/member/member.do" id="customer">고객관리</a>
            </div>
            <!-- 게시판 관리 메뉴 -->
            <div>
                <div class="glyphicon glyphicon-list-alt"></div>
                <a id="border">게시판관리</a>
                <ul class="sublist" id="borderlist">
                    <li><a href="/mh/admin/board/notice.do">공지사항 관리</a></li>
                    <li><a href="/mh/admin/board/event.do">이벤트 관리</a></li>
                    <li><a href="/mh/admin/board/ask.do">상품문의 관리</a></li>
                    <li><a href="/mh/admin/board/review.do">상품후기 관리</a></li>
                    <li><a href="/mh/admin/board/myrecipeboard.do">나만의 레시피 관리</a></li>
                </ul>
            </div>
            <!-- 통계 관리 메뉴 -->
            <div>
                <div class="glyphicon glyphicon-signal"></div>
                <a id="static">통계관리</a>
                <ul class="sublist" id="staticlist">
                    <div>
                        <a href="#" id="sales">매출분석</a>
                        <ul class="subsublist" id="saleslist">
                            <li><a href="/mh/admin/statistics/salesdaily.do">일별 매출</a></li>
                            <li><a href="/mh/admin/statistics/salesweekly.do">주별 매출</a></li>
                            <li><a href="/mh/admin/statistics/salesmonthly.do">월별 매출</a></li>
                        </ul>
                    </div>
                    <div>
                        <a id="items">상품분석</a>
                        <ul class="subsublist" id="itemslist">
                            <li><a href="/mh/admin/statistics/productranking.do">판매상품 순위</a></li>
                            <li><a href="/mh/admin/statistics/categoryranking.do">판매분류 순위</a></li>
                            <li><a href="/mh/admin/statistics/cancel.do">취소/반품 순위</a></li>
                            <li><a href="/mh/admin/statistics/shoopingcartstat.do">장바구니 상품 분석</a></li>
                        </ul>
                    </div>
                </ul>
            </div>
        </li>
    </ul>
</div>
