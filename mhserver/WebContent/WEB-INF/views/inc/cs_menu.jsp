<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/mh/css/customerCenter.css">
         
        <!-- 고객센터 메뉴바 -->
        <div id="MyMenu" style=" width: 200px; height: auto; float: left;">
            <div>고객 센터</div>
            <div id="goNotice" class="menulist nowPage" onclick="location.href='/mh/user/customercenter/customercenter.do';"><div>공지사항</div><div class="arrow">></div></div>
            <div id="goQnA" class="menulist" onclick="location.href='/mh/user/customercenter/onebyone.do';"><div>1:1 문의</div><div class="arrow">></div></div>
            <div id="go1to1Q" class="qlist">
                <div>
                    <div style="height: 0px; font-size: 0.95em; position: relative; top: -7px; font-weight: bold;">도움이 필요하신가요?</div>
                    <div style="height: 0px; font-size: 0.7em; position: relative; top: 8px;">1:1 문의하기</div>
                </div>
                <div style=" color: #08718E;">></div>
            </div>
        </div>
 