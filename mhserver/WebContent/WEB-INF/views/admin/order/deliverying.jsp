<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마켓허리 관리자 :: 배송중</title>
	<style>
        
        #IngNum,
        #TopIconIng {
            /* 배송중 & 숫자 */
            color: #08718e;
            font-weight: bold;
        }
        
        #IngList {
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
            <div id="topMenu1" class="topMenu" onclick="location.href='/mh/admin/order/preparedelivery.do';" style="cursor: pointer;">
                <div
                    class="glyphicon glyphicon-inbox"
                    id="TopIconReady"
                ></div>

                <div class="MenuTop" id="ReadyList">
                    	배송준비중
                </div>
                <span class="TopNumber" id="ReadyNum"><span>0</span></span>
            </div>

            <!-- <div class="topCenter"></div> -->

            <div id="topMenu2" class="topMenu" onclick="location.href='/mh/admin/order/deliverying.do';" style="cursor: pointer;">
                <div
                    class="glyphicon glyphicon-road"
                    id="TopIconIng"
                    style="color: #08718e;"               
                ></div>
                <div class="MenuTop" id="IngList">
                    	배송중
                </div>
                <span class="TopNumber" id="IngNum"><span>0</span></span>
            </div>

            <!-- <div class="topCenter"></div> -->

            <div id="topMenu3" class="topMenu" onclick="location.href='/mh/admin/order/deliverycomplete.do';" style="cursor: pointer;">
                <div
                    class="glyphicon glyphicon-gift"
                    id="TopIconComplete"
                ></div>
                <div class="MenuTop" id="CompleteList">
                    	배송완료
                </div>
                <span class="TopNumber" id="CompleteNum"><span>0</span></span>
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

<script>

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
	
	// 버튼을 클릭한 경우
	$("#btn1").click(function() {
				
		//txt1에 주문번호가 있으면 검색
 		if($("#txt1").val()) {
			
			$.ajax({
				type: "get",
				url: "/mh/admin/order/deliveryok.do",
				data: "&seq=" + $("#txt1").val(),
				dataType: "json",
				success: function(result) {
															
					//초기화
					$(result).html("");
					
					var temp1 = "";
					var temp2 = "";
					var temp3 = "";
					
					$(result).each(function(index, item) {
												
						if (item.delivery_status == "배송 중") {						
							
							//추가하기 전에 삭제
							$("#CompleteNum > span").remove();
							
							//대입
							temp1 += "<span>";
								temp1 += result.length;
							temp1 += "</span>";
							
							//추가하기 전에 삭제
							$("#resultTable > tbody > tr").remove();
							
							//대입
							for (index = 0; index < result.length; index++) {
								temp2 += "<tr>";
									temp2 += "<td>" + result[index].delivery_category + "</td>";
									temp2 += "<td>" + result[index].order_regdate + "</td>";
									temp2 += "<td>" + result[index].order_seq + "</td>";
									temp2 += "<td>" + result[index].order_name + "</td>";
									temp2 += "<td>" + result[index].product_name + "</td>";
									temp2 += "<td>" + result[index].product_qty + "</td>";
									temp2 += "<td>" + result[index].order_price + "원" + "</td>"; 
									temp2 += "<td>" + result[index].delivery_status + "</td>";
									temp2 += "<td>" + result[index].delivery_regdate + "</td>";
								temp2 += "</tr>";
							}
							
							//추가하기 전에 삭제
							$("#orderResult > span").remove();
							
							//대입
							temp3 += "<span>";
								temp3 += "(검색결과 "
								temp3 += "<span style='color: red;'>";
									temp3 += result.length;
								temp3 += "</span>";
								temp3 += "건)";
							temp3 += "</span>";
							
							console.log(result.length);
							
							//대입한걸 추가
							$("#CompleteNum").append(temp1);
							$("#resultTable > tbody").append(temp2);
							$("#orderResult").append(temp3);
							
							return false;	//break
						
						} else if (item.delivery_status != "배송 중" || result.length < 1) {
							
							$("#resultTable > tbody > tr").remove();
							
							var temp = "";
							temp += "<tr>";
								temp += "<td colspan='9'>" + "검색 결과가 없습니다." + "</td>";
							temp += "</tr>";
							
							$("#resultTable > tbody").append(temp);
							
							return false;	//break
							
						}//if
					
					});//each
					
				},
				error: function(a, b, c) {
					console.log(a, b, c);
				}
			});
		
		//기간 검색
		} else if ($("#date1").val() && $("#date2").val()) {
			
			$.ajax({
				type: "get",
				url: "/mh/admin/order/deliveryok.do",
				data: "&begin=" + $("#date1").val() + "&end=" + $("#date2").val(),
				dataType: "json",
				success: function(result) {
															
					//초기화
					$(result).html("");
					
					var temp1 = "";
					var temp2 = "";
					var temp3 = "";
					
					$(result).each(function(index, item) {							
						
						if (item.delivery_status == "배송 중") {						
							
							//추가하기 전에 삭제
							$("#CompleteNum > span").remove();
							
							//대입
							temp1 += "<span>";
								temp1 += result.length;
							temp1 += "</span>";
							
							//추가하기 전에 삭제
							$("#resultTable > tbody > tr").remove();
							
							//대입
							for (index = 0; index < result.length; index++) {
								temp2 += "<tr>";
									temp2 += "<td>" + result[index].delivery_category + "</td>";
									temp2 += "<td>" + result[index].order_regdate + "</td>";
									temp2 += "<td>" + result[index].order_seq + "</td>";
									temp2 += "<td>" + result[index].order_name + "</td>";
									temp2 += "<td>" + result[index].product_name + "</td>";
									temp2 += "<td>" + result[index].product_qty + "</td>";
									temp2 += "<td>" + result[index].order_price + "원" + "</td>"; 
									temp2 += "<td>" + result[index].delivery_status + "</td>";
									temp2 += "<td>" + result[index].delivery_regdate + "</td>";
								temp2 += "</tr>";
							}
							
							//추가하기 전에 삭제
							$("#orderResult > span").remove();
							
							//대입
							temp3 += "<span>";
								temp3 += "(검색결과 "
								temp3 += "<span style='color: red;'>";
									temp3 += result.length;
								temp3 += "</span>";
								temp3 += "건)";
							temp3 += "</span>";
							
							//대입한걸 추가
							$("#CompleteNum").append(temp1);
							$("#resultTable > tbody").append(temp2);
							$("#orderResult").append(temp3);
							
							return false;	//break
						
						} else if (item.delivery_status != "배송 중" || result.length < 1) {
							
							$("#resultTable > tbody > tr").remove();
							
							var temp = "";
							temp += "<tr>";
								temp += "<td colspan='9'>" + "검색 결과가 없습니다." + "</td>";
							temp += "</tr>";
							
							$("#resultTable > tbody").append(temp);
							
							return false;	//break
							
						}//if
					
					});//each
					
				},
				error: function(a, b, c) {
					console.log(a, b, c);
				}
			});
		
		//상품명 검색
		} else if ($("#sel2 option:selected").val() == "상품명" && $("#txt2").val()) {
			
			$.ajax({
				type: "get",
				url: "/mh/admin/order/deliveryok.do",
				data: "&product=" + $("#txt2").val(),
				dataType: "json",
				success: function(result) {
															
					//초기화
					$(result).html("");
					
					var temp1 = "";
					var temp2 = "";
					var temp3 = "";
					
					$(result).each(function(index, item) {							
						
						if (item.delivery_status == "배송 중") {						
							
							//추가하기 전에 삭제
							$("#CompleteNum > span").remove();
							
							//대입
							temp1 += "<span>";
								temp1 += result.length;
							temp1 += "</span>";
							
							//추가하기 전에 삭제
							$("#resultTable > tbody > tr").remove();
							
							//대입
							for (index = 0; index < result.length; index++) {
								temp2 += "<tr>";
									temp2 += "<td>" + result[index].delivery_category + "</td>";
									temp2 += "<td>" + result[index].order_regdate + "</td>";
									temp2 += "<td>" + result[index].order_seq + "</td>";
									temp2 += "<td>" + result[index].order_name + "</td>";
									temp2 += "<td>" + result[index].product_name + "</td>";
									temp2 += "<td>" + result[index].product_qty + "</td>";
									temp2 += "<td>" + result[index].order_price + "원" + "</td>"; 
									temp2 += "<td>" + result[index].delivery_status + "</td>";
									temp2 += "<td>" + result[index].delivery_regdate + "</td>";
								temp2 += "</tr>";
							}
							
							//추가하기 전에 삭제
							$("#orderResult > span").remove();
							
							//대입
							temp3 += "<span>";
								temp3 += "(검색결과 "
								temp3 += "<span style='color: red;'>";
									temp3 += result.length;
								temp3 += "</span>";
								temp3 += "건)";
							temp3 += "</span>";
							
							//대입한걸 추가
							$("#CompleteNum").append(temp1);
							$("#resultTable > tbody").append(temp2);
							$("#orderResult").append(temp3);
							
							return false;	//break
						
						} else if (item.delivery_status != "배송 중" || result.length < 1) {
							
							$("#resultTable > tbody > tr").remove();
							
							var temp = "";
							temp += "<tr>";
								temp += "<td colspan='9'>" + "검색 결과가 없습니다." + "</td>";
							temp += "</tr>";
							
							$("#resultTable > tbody").append(temp);
							
							return false;	//break
							
						}//if	
					
					});//each
					
				},
				error: function(a, b, c) {
					console.log(a, b, c);
				}
			});
		
		//분류별 검색
		} else if ($("#sel2 option:selected").val() == "분류별" && $("#txt2").val()) {
			
			$.ajax({
				type: "get",
				url: "/mh/admin/order/deliveryok.do",
				data: "&category=" + $("#txt2").val(),
				dataType: "json",
				success: function(result) {
															
					//초기화
					$(result).html("");
					
					var temp1 = "";
					var temp2 = "";
					var temp3 = "";
					
					$(result).each(function(index, item) {							
						
						if (item.delivery_status == "배송 중") {						
							
							//추가하기 전에 삭제
							$("#CompleteNum > span").remove();
							
							//대입
							temp1 += "<span>";
								temp1 += result.length;
							temp1 += "</span>";
							
							//추가하기 전에 삭제
							$("#resultTable > tbody > tr").remove();
							
							//대입
							for (index = 0; index < result.length; index++) {
								temp2 += "<tr>";
									temp2 += "<td>" + result[index].delivery_category + "</td>";
									temp2 += "<td>" + result[index].order_regdate + "</td>";
									temp2 += "<td>" + result[index].order_seq + "</td>";
									temp2 += "<td>" + result[index].order_name + "</td>";
									temp2 += "<td>" + result[index].product_name + "</td>";
									temp2 += "<td>" + result[index].product_qty + "</td>";
									temp2 += "<td>" + result[index].order_price + "원" + "</td>"; 
									temp2 += "<td>" + result[index].delivery_status + "</td>";
									temp2 += "<td>" + result[index].delivery_regdate + "</td>";
								temp2 += "</tr>";
							}
							
							//추가하기 전에 삭제
							$("#orderResult > span").remove();
							
							//대입
							temp3 += "<span>";
								temp3 += "(검색결과 "
								temp3 += "<span style='color: red;'>";
									temp3 += result.length;
								temp3 += "</span>";
								temp3 += "건)";
							temp3 += "</span>";
							
							//대입한걸 추가
							$("#CompleteNum").append(temp1);
							$("#resultTable > tbody").append(temp2);
							$("#orderResult").append(temp3);
							
							return false;	//break
						
						} else if (item.delivery_status != "배송 중" || result.length < 1) {
							
							$("#resultTable > tbody > tr").remove();
							
							var temp = "";
							temp += "<tr>";
								temp += "<td colspan='9'>" + "검색 결과가 없습니다." + "</td>";
							temp += "</tr>";
							
							$("#resultTable > tbody").append(temp);
							
							return false;	//break
							
						}//if	
					
					});//each
					
				},
				error: function(a, b, c) {
					console.log(a, b, c);
				}
			});
		
		}//if
		
	});//click
	
	//초기화 기능
	$("#btn2").click(function() {
	    $("#txt1").val("");
	    $("#date1").val("");
	    $("#date2").val("");
	    $("#txt2").val("");
	    $(location).attr('href', "/mh/admin/order/deliverying.do");
	});

</script>

<script src="/mh/js/admin_template.js"></script>
<script src="/mh/js/delivery.js"></script>
</body>
</html>