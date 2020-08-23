<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마켓허리 관리자 :: 배송관리</title>
</head>
<body>

<%@include file="/WEB-INF/views/inc/admin_header.jsp" %>

<div id="main">
    <div id="container">
        <!-- 전체 내용을 묶는 div#container -->
        <!-- main 상단 -->
        <div id="headerTitle">
            <div id="menustep">
                <span>홈 > 주문 관리 > 배송관리</span>
            </div>
            <div id="menuname"><span>배송관리</span></div>
        </div>

        <!-- 상단메뉴  -->
        <div id="Orderstate">
            <div id="topMenu1" class="topMenu" onclick="location.href='/mh/admin/board/delivery/preparedelivery.do';" style="cursor: pointer;">
                <div
                    class="glyphicon glyphicon-inbox"
                    id="TopIconReady"
                ></div>

                <div class="MenuTop" id="ReadyList">
                    	배송준비중
                </div>
                <span class="TopNumber" id="ReadyNum">0</span>
            </div>

            <!-- <div class="topCenter"></div> -->

            <div id="topMenu2" class="topMenu" onclick="location.href='/mh/admin/board/delivery/deliverying.do';" style="cursor: pointer;">
                <div
                    class="glyphicon glyphicon-road"
                    id="TopIconIng"
                    style="cursor: pointer;"
                ></div>
                <div class="MenuTop" id="IngList">
                    	배송중
                </div>
                <span class="TopNumber" id="IngNum">0</span>
            </div>

            <!-- <div class="topCenter"></div> -->

            <div id="topMenu3" class="topMenu" onclick="location.href='/mh/admin/board/delivery/deliverycomplete.do';" style="cursor: pointer;">
                <div
                    class="glyphicon glyphicon-gift"
                    id="TopIconComplete"
                ></div>
                <div class="MenuTop" id="CompleteList">
                    	배송완료
                </div>
                <span class="TopNumber" id="CompleteNum">0</span>
            </div>
        </div>

        <!-- 기능별 검색내용을 입력하는 div를 묶는 div#searchOrder -->
        <table id="tblsearch">
            <tr>
                <th>검색어</th>
                <td>
                    <select id="sel1">
                        <option>주문번호</option>
                    </select>
                    <input type="text" class="txtbox" id="txt1" autocomplete="off" />
                </td>
            </tr>
            <tr>
                <th>기간</th>
                <td>
                    <input
                        type="text"
                        class="datepick"
                        id="date1"
                        disabled
                    />
                    <span id="taste">~</span>
                    <input
                        type="text"
                        class="datepick"
                        id="date2"
                        disabled
                    />
                </td>
            </tr>
            <tr>
                <th>상품</th>
                <td>
                    <select id="sel2">
                        <option>상품명</option>
                        <option>분류별</option>
                    </select>
                    <input type="text" class="txtbox" id="txt2" autocomplete="off" />
                </td>
            </tr>
        </table>

        <!-- 검색 버튼을 묶는 orderBtn-->
        <div id="orderBtn">
            <input
                type="button"
                value="검색"
                id="btn1"
                class="btnSearch"
            />
            <input
                type="button"
                value="초기화"
                id="btn2"
                class="btnSearch"
            />
        </div>

        <!-- 검색결과 -->

        <div id="searchresult">▶ 검색결과</div>

        <div id="result">
            <div id="orderResult">
                	(검색결과
                <span style="color: red;">0</span>건)
            </div>
            <table id="resultTable" class="table table-bordered">
                <tr>
                	<th>분류</th>
                    <th>주문일(결제일)</th>
                    <th>주문번호</th>
                    <th>주문자</th>
                    <th>상품명</th>
                    <th>수량</th>
                    <th>총 결제금액</th>
                    <th>상태</th>
                    <th>배송날짜</th>
                </tr>
                <tr>
                    <td></td>                            
                    <td></td>                            
                    <td></td>                            
                    <td></td>                            
                    <td></td>                            
                    <td></td>                            
                    <td></td>                            
                    <td></td>                            
                    <td></td>                            
                </tr>
            </table>
        </div>
        <!-- 페이징 -->
        <div id="pagingbox">
            <!-- 페이징 링크걸기 -->
            <a href=""> <div class="btnPaging"><<</div></a>
            <a href=""> <div class="btnPaging"><</div></a>
            <a href=""> <div class="btnPaging">1</div></a>
            <a href=""> <div class="btnPaging">></div></a>
            <a href=""> <div class="btnPaging">>></div></a>
        </div>
    </div>
</div>

<script src="/mh/js/delivery.js"></script>
</body>
</html>