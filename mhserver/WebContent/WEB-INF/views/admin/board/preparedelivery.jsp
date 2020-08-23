<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마켓허리 관리자 :: 배송준비중</title>
	<style>
        
        #ReadyNum,
        #TopIconReady {
            /* 배송준비 & 숫자 */
            color: #08718e;
            font-weight: bold;
        }
        
        #ReadyList {
            color: #08718e;
            font-weight: bold;
            font-size: 30px;
        }
	
	</style>
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
                    id="TopIconReady" style="color: #08718e;"
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
                    <input type="text" class="txtbox" id="txt1" autocomplete="off">
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
            	<thead>
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
                </thead>
                <tbody>
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
                </tbody>
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
<script>

	//검색 기능
	$("#txt1").keydown(function() {
		if (event.keyCode == 13) {
			$("#btn1").click();
		}
	});
	
	$("#txt2").keydown(function() {
		if (event.keyCode == 13) {
			$("#btn1").click();
		}
	});
	
	$("#btn1").click(function() {
		
		if ($("#txt1").val() == "") {
			alert("주문번호가 입력되지 않았습니다.");
		    $("#date1").focus();			
		} else if (!($("#txt1").val() == "") && ($("#date1").val() == "")) {
		    alert("기간(시작)이 입력되지 않았습니다.");
		    $("#date1").focus();
		} else if ((!($("#txt1").val() == "") && !($("#date1").val() == "")) && ($("#date2").val() == "")) {
		    alert("기간(끝)이 입력되지 않았습니다.");
		    $("#date2").focus();
		} else if ($("#sel2 option:selected").val() == "상품명" &&(!($("#txt1").val() == "") && !($("#date1").val() == "")) && !($("#date2").val() == "") && ($("#txt2").val() == "")) {
		    alert("상품명이 입력되지 않았습니다.");
		    $("#txt2").focus();
		} else if ($("#sel2 option:selected").val() == "분류별" &&(!($("#txt1").val() == "") && !($("#date1").val() == "")) && !($("#date2").val() == "") && ($("#txt2").val() == "")) {
		    alert("분류별이 입력되지 않았습니다.");
		    $("#txt2").focus();
		} 
		
		//ajax
 		$.ajax({
			type: "get",
			url: "/mh/admin/board/delivery/deliveryok.do",
			data: "seq=" + $("#txt1").val() + "&begin=" + $("#date1").val() + "&end=" + $("#date2").val() + "&name=" + $("#txt2").val(),
			dataType: "json",
			success: function(result) {
				//초기화
				$(result).html("");
				
				//추가
				$(result).each(function(index, item) {
					
					if (item.delivery_status == 0) {
						
						//추가 하기 전에 삭제
						$("#resultTable > tbody > tr").remove();
						
						var temp = "";
						temp += "<tr>";
							temp += "<td>" + item.delivery_category + "</td>";
							temp += "<td>" + item.order_regdate + "</td>";
							temp += "<td>" + item.order_seq + "</td>";
							temp += "<td>" + item.order_name + "</td>";
							temp += "<td>" + item.product_name + "</td>";
							temp += "<td>" + item.product_qty + "</td>";
							temp += "<td>" + item.order_price + "원" + "</td>"; 
							temp += "<td>" + item.delivery_status + "</td>";
							temp += "<td>" + item.delivery_regdate + "</td>";
						temp += "</tr>";
						
						//대입
						$("#resultTable > tbody").append(temp);
					
					} else {
						
						$("#resultTable > tbody > tr").remove();
						
						var temp = "";
						temp += "<tr>";
							temp += "<td colspan='9'>" + "검색 결과가 없습니다." + "</td>";
						temp += "</tr>";
						
						$("#resultTable > tbody").append(temp);
						
					}//if
				
				});//each
			},
			error: function(a, b, c) {
				console.log(a, b, c);
			}
		});
		
	});
	
	//초기화 기능
	$("#btn2").click(function() {
	    $("#txt1").val("");
	    $("#date1").val("");
	    $("#date2").val("");
	    $("#txt2").val("");
	});

</script>
</body>
</html>