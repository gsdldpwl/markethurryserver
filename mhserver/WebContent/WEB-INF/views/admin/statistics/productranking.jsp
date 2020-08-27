<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓허리 관리자 :: 상품별 판매 순위 통계</title>
<script src="/mh/js/highcharts.js"></script>
</head>
<%@include file="/WEB-INF/views/inc/admin_header.jsp" %>
<style>

/* 상단 헤더 */
         #menustep > span {
            font-size: 1.2em;
            color: #999999;
        }

        #menuname > span {
            font-size: 2em;
            font-weight: bold;
            color: #666666;
        }

        #menustep {
            margin-bottom: 15px;
        }

        #a > span {
            font-size: 2em;
            font-weight: bold;
            color: #666666;
        }

        #headerTitle {
            width: 1570px;
            margin: 30px auto;
        }

        /* 테이블 */
        #tblsearch {
            border-collapse: collapse;
            border: 1px solid #ccc;
            margin: 0px 15px;
            padding: 10px;
            width: 1550px;
        }
        
        #tblsearch td, #tblsearch th {
            border: 1px solid #ccc;
            height: 50px;
        }
        
        #tblsearch th {
            text-align: center;
            width: 200px;
            font-size: 1.2em;
            font-weight: bold;
            background-color: #F3F3F3;
        }

        #tblsearch td {
            width: 1350px;
            padding-left: 10px;
        }
        
        #taste { margin-left: 10px; }
        
        .datepick {height: 30px;}
        .ui-datepicker-week-end .ui-state-default {color:RED;}
        .hasDatepicker { 
            width: 120px;
            margin: 0px 10px;
            text-align: center;
        }
        
        #sel1, #sel2 {
            height: 30px;
            border-color: #aaa;
            margin-left: 10px;
        }

        .txtbox {
            height: 30px;
            width: 800px;
            border: 1px solid #aaa;
            margin-left: 5px;
            padding-left: 10px;
        }

        /* 버튼 */
        .btnSearch { 
            outline: none;
            background-color: white;
            border: 1px solid #ccc;
            font-weight: bold;
            width: 100px;
            height: 40px;
            padding-top: 10px;
            padding-bottom: 25px;
        }
        
        #btn1 {
            /* 검색 버튼 */
            background-color: #ccc;
            /* border: none; */
        }

        #orderBtn {
            width: 1570px;
            margin: 0px auto;
            margin-top: 30px;
            text-align: center;
            padding-bottom: 30px;
            border-bottom: 1px solid #aaa;
        }

        #searchresult {
            width: 1570px;
            margin: 0px auto;
            margin-top: 40px;
        }

        .SearchResultBox {
            width: 310px;
            height: 40px;
            text-align: center;
        }

        #result {
            border: none;
            width: 1570px;
            margin: 0px auto;
        }
        
        #orderResult {
            margin: 20px auto;
        }

        #deleteBtn {
            background-color: #ccc;
        }

        #secondBtn {
            width: 1570px;
            margin: 0px auto;
            text-align: right;
        }


        #update {
            font-size: 1.2em;
            font-weight: bold;
            color: #666666;
            margin-top: 15px;
            /* margin: 15px; */
        }

        #graphTitle {
            font-size: 2em;
            font-weight: bold;
            color: #666666;
            margin-left: 15px;
            margin-top: 20px;
        }

         /* 판매상품 순위 테이블 */
        #resultTable {
            width: 1570px;
            margin:15px;
        }

        #resultTable th, #resultTable td{
            text-align: center;
        }

        #resultTable th {
            background-color: #F3F3F3;
        }

        #graphBox {
            width: 1570px;
            text-align: center;
        }

        #chart, #chart2 {
            width:783px;
            height:500px;
        }

        tspan {
            font-size: 1.2em;
        }



</style>





<body>
	
	<div id="main">
    <div id="container">
        
    <!-- 구현 시작 파트 -->

        <!-- 상단 카테고리를 묶는 div#headerTitle -->
        <div id="headerTitle">
            <div id="menustep"><span>홈 > 통계관리 > 상품분석 > 판매상품 순위</span></div>
            <div id="menuname"><span>판매상품 순위</span></div>
        </div>

        <!-- 기능별 검색내용을 입력하는 div를 묶는 div#searchOrder -->
        <table id="tblsearch">
            <tr>
                <th>검색어</th>
                <td>
                    <select id="sel1">
                        <option>분류 선택</option>
                        <option value="0">채소</option>
                        <option value="1">과일</option>
                        <option value="2">육류</option>
                        <option value="3">수산</option>
                        <option value="4">가공식품</option>
                        <option value="5">소스</option>
                        <option value="6">유제품</option>
                        <option value="7">건강식품</option>
                        <option value="8">음료</option>
                    </select>
                    <input type="text" class="txtbox" id="txt1" required value="${search}"/>
                </td>
            </tr>
           
        </table>



        <!-- 검색 버튼을 묶는 orderBtn-->
        <div id="orderBtn">
            <input type="submit" value="검색" id="btn1" class="btnSearch">
            <input type="button" value="초기화" id="btn2" class="btnSearch">
        </div>

        <!-- 판매상품 통계 그래프 -->
        <div id="graphTitle"><span>판매상품 통계 그래프</span></div>
        <div id="graphBox">
            <div id="chart" style="display: inline-block;"></div>
            <div id="chart2" style="display: inline-block;"></div>
        </div>

        <!-- 업데이트 날짜+시각 -->
        <div id="middleTitle">
            <div id="a"><span>판매상품 순위 내역</span></div>
            <div id="update"><span>업데이트 : </span><span id="updateDate"></span></div>
        </div>

        <!-- 판매 순위 테이블(결과) -->
        <table id="resultTable" class="table table-bordered">
            <tr>
                <th>순위</th>
                <th>상품분류</th>
                <th>상품번호</th>
                <th>상품명</th>
                <th>판매가</th>
                <th>환불수량</th>
                <th>판매수량</th>
                <th>판매합계</th>
            </tr>
            <c:set var="i" value="0" />
            <c:forEach items="${list}" var="dto">
            <c:set var="i" value="${i+1}" />
            
            <tr>
                <td class="rank">${i}</td>
                <td>${dto.category }</td>
                <td>${dto.seq }</td>
                <td>${dto.name }</td>
                <td class="productprice">${dto.price}</td>
                <td>${dto.refund }</td>
                <td>${dto.sales }</td>
                <td class="sumprice">${dto.price * dto.sales }</td>
                <!-- 판매가 * 판매수량 -->
            </tr>
            
            </c:forEach>
            
            <c:if test="${not empty search and list.size() == 0}">
	           	<tr style="text-align:center;">
	           		<td colspan="8">검색 결과가 없습니다.</td>
	           	</tr>                    	
		        </c:if>
            
            
        </table>

    

    </div>
</div>
    
    <script>

        // datepicker 출력
        $(function() {
            $("#date1").datepicker({
                dateFormat: "yy-mm-dd",
                showOn: "both",
                buttonImage: "/mh/images/icons8-calendar-28.png",
                buttonImageOnly: true,
                buttonText: "Select date"
            });

            $("#date2").datepicker({
                dateFormat: "yy-mm-dd",
                showOn: "both",
                buttonImage: "/mh/images/icons8-calendar-28.png",
                buttonImageOnly: true,
                buttonText: "Select date"
            });
        });

        // 업데이트 시각에 우선은 현재시간 출력
        let today = new Date();
        $("#updateDate").text(today.toLocaleString());


        
        
        // 천단위 , 찍기
        function numberWithCommas(x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }

        
        
        //****************
        $(".productprice").each(function(index, item){
        	var productprice = $(item).text();
        	$(item).text(numberWithCommas(productprice));
        })
        
        $(".sumprice").each(function(index, item){
        	var sumprice = $(item).text();
        	$(item).text(numberWithCommas(sumprice));
        })
        
        
        
        
        $("#txt1").focus(function() {
        	$(this).attr("value", "");
        })

        $("#txt1").keyup(function() {

        if(event.keyCode ==  13){
        	var search = $("#txt1").val();
        	location.href="/mh/admin/statistics/productranking.do?search="+search;
        }
        });


        $("#btn1").click(function(){
        	var sel = $("#sel1").val();
        	var search = $("#txt1").val();
        	location.href="/mh/admin/statistics/productranking.do?search=" +search + "&sel=" + sel;        		
        	
        })
        
        
        var arr_data = ${arr};
        

        Highcharts.chart('chart', {
            chart: {
                type: 'pie'
            },
            title: {
                text: '판매상품 순위'
            },
            subtitle: {
                text: '판매수량(개)'
            },

            accessibility: {
                announceNewData: {
                    enabled: true
                },
                point: {
                    valueSuffix: '개'
                }
            },

            plotOptions: {
                series: {
                    dataLabels: {
                        enabled: true,
                        format: '{point.name}'
                    }
                }
            },

            tooltip: {
                headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.0f}개</b><br/>'
            },

            series: [
                {
                    name: "product",
                    colorByPoint: true,
                    data: arr_data
                    
                }
            ]
            
        });

        
        
        var arr2_data = ${arr2};

        Highcharts.chart('chart2', {
            chart: {
                type: 'pie'
            },
            title: {
                text: '판매상품 순위'
            },
            subtitle: {
                text: '판매합계(원)'
            },

            accessibility: {
                announceNewData: {
                    enabled: true
                },
                point: {
                    valueSuffix: '원'
                }
            },

            plotOptions: {
                series: {
                    dataLabels: {
                        enabled: true,
                        format: '{point.name}'
                    }
                }
            },

            tooltip: {
                headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.0f}원</b><br/>'
            },

            series: [
                {
                    name: "product",
                    colorByPoint: true,
                    data: arr2_data
                    
                }
            ]
            
        });
	
	
	
	</script>
	
	
	<script src="/mh/js/admin_template.js"></script>
</body>
</html>