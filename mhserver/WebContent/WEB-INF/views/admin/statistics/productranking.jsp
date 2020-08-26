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
                        <option>채소</option>
                        <option>과일</option>
                        <option>육류</option>
                        <option>수산</option>
                        <option>가공식품</option>
                        <option>소스</option>
                        <option>유제품</option>
                        <option>건강식품</option>
                        <option>음료</option>
                    </select>
                    <input type="text" class="txtbox" id="txt1" />
                </td>
            </tr>
            <tr>
                <th>기간</th>
                <td>
                    <input type="text" class="datepick" id="date1" disabled />
                    <span id="taste">~</span>
                    <input type="text" class="datepick" id="date2" disabled />
                </td>
            </tr>
            <tr>
                <th>상품</th>
                <td>
                    <select id="sel2">
                        <option>분류 선택</option>
                        <option>상품명</option>
                        <option>상품번호</option>
                    </select>
                    <input type="text" class="txtbox" id="txt2" />
                </td>
            </tr>
        </table>



        <!-- <div id="searchOrder">
            <div id="period">
                <div>기간</div>
                <input type="text" id="date1" style="margin-left: 10px; margin-top: 11px;" disabled>
                <span style="margin: auto 20px;">~</span>
                <input type="text" id="date2" disabled>
            </div>

            
            <div id="product">
                <div>상품 분류</div>
                <select id="sel2">
                    <option>분류 선택</option>
                    <option>채소</option>
                    <option>과일</option>
                    <option>육류</option>
                    <option>수산</option>
                    <option>가공식품</option>
                    <option>소스</option>
                    <option>유제품</option>
                    <option>건강식품</option>
                    <option>음료</option>
                </select>
                <input type="text" id="txt2">
            </div>
            
            <div id="SearchWord">
                <div>검색 분류</div>
                <select id="sel1">
                    <option>분류 선택</option>
                    <option>상품명</option>
                    <option>상품번호</option>
                </select>
                <input type="text" id="txt1">
            </div>
            
        </div> -->

        <!-- 검색 버튼을 묶는 orderBtn-->
        <div id="orderBtn">
            <input type="button" value="검색" id="btn1" class="btnSearch">
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
                <!-- <th>재고수량</th> -->
                <th>결제횟수</th>
                <th>환불수량</th>
                <th>판매수량</th>
                <th>판매합계</th>
            </tr>
            <tr>
                <td>1</td>
                <td>가공식품</td>
                <td>176</td>
                <td>갈비탕 </td>
                <td>11,000</td>
                <!-- <td>71</td> -->
                <td>615</td>
                <td>31</td>
                <td>721</td>
                <!-- 판매가 * 판매수량 -->
                <td></td>
            </tr>
            <tr>
                <td>2</td>
                <td>채소</td>
                <td>321</td>
                <td>간편 샐러드</td>
                <td>1,800</td>
                <!-- <td>147</td> -->
                <td>411</td>
                <td>43</td>
                <td>498</td>
                <td></td>
            </tr>
            <tr>
                <td>3</td>
                <td>수산</td>
                <td>145</td>
                <td>오로라 생연어</td>
                <td>12,600</td>
                <!-- <td>66</td> -->
                <td>399</td>
                <td>21</td>
                <td>411</td>
                <td></td>
            </tr>
            <tr>
                <td>4</td>
                <td>유제품</td>
                <td>197</td>
                <td>제주 목초 우유 750ml*2개입</td>
                <td>7,500</td>
                <!-- <td>91</td> -->
                <td>315</td>
                <td>12</td>
                <td>346</td>
                <td></td>
            </tr>
            <tr>
                <td>5</td>
                <td>과일</td>
                <td>117</td>
                <td>수박 8kg</td>
                <td>19,800</td>
                <!-- <td>127</td> -->
                <td>241</td>
                <td>7</td>
                <td>287</td>
                <td></td>
            </tr>
            <tr>
                <td>6</td>
                <td>가공식품</td>
                <td>170</td>
                <td>묵은지볶음밥</td>
                <td>7,800</td>
                <!-- <td>35</td> -->
                <td>197</td>
                <td>19</td>
                <td>211</td>
                <td></td>
            </tr>
            <tr>
                <td>7</td>
                <td>수산</td>
                <td>149</td>
                <td>영광굴비 1.2kg</td>
                <td>26,500</td>
                <!-- <td>69</td> -->
                <td>171</td>
                <td>14</td>
                <td>189</td>
                <td></td>
            </tr>
            <tr>
                <td>8</td>
                <td>육류</td>
                <td>471</td>
                <td>한돈 목살 양념 구이</td>
                <td>13,900</td>
                <!-- <td>91</td> -->
                <td>148</td>
                <td>11</td>
                <td>164</td>
                <td></td>
            </tr>
            <tr>
                <td>9</td>
                <td>육류</td>
                <td>321</td>
                <td>닭가슴살 큐브 스테이크 500g</td>
                <td>7,900</td>
                <!-- <td>71</td> -->
                <td>142</td>
                <td>3</td>
                <td>155</td>
                <td></td>
            </tr>
            <tr>
                <td>10</td>
                <td>가공식품</td>
                <td>168</td>
                <td>데니쉬 식빵</td>
                <td>7,200</td>
                <!-- <td>94</td> -->
                <td>81</td>
                <td>3</td>
                <td>92</td>
                <td></td>
            </tr>
            <tr>
                <th colspan="6">합계</th>
                <!-- <td></td> -->
                <td></td>
                <td></td>
                <td></td>
            </tr>
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


        // $("#resultTable > td:nth-child(10)").val();

        // var price = $("#resultTable > td:nth-child(5)").val().replace(",", "");

        // var count = $("#resultTable > td:nth-child(9)").val();

        // // $("#price").text().replace(",", "");

        // // 천단위 , 찍기
        // function numberWithCommas(x) {
        //     return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        // }

        Highcharts.chart('chart', {
            chart: {
                type: 'pie'
            },
            title: {
                text: '판매상품 순위'
            },
            subtitle: {
                text: '판매수량(%)'
            },

            accessibility: {
                announceNewData: {
                    enabled: true
                },
                point: {
                    valueSuffix: '%'
                }
            },

            plotOptions: {
                series: {
                    dataLabels: {
                        enabled: true,
                        format: '{point.name}: {point.y:.1f}%'
                    }
                }
            },

            tooltip: {
                headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
            },

            series: [
                {
                    name: "product",
                    colorByPoint: true,
                    data: [
                        {
                            name: "갈비탕",
                            y: 33,
                            drilldown: "갈비탕"
                        },
                        {
                            name: "간편 샐러드",
                            y: 20.57,
                            drilldown: "간편 샐러드"
                        },
                        {
                            name: "오로라 생연어",
                            y: 15.23,
                            drilldown: "오로라 생연어"
                        },
                        {
                            name: "제주 목초 우유 750ml*2개입",
                            y: 13.58,
                            drilldown: "제주 목초 우유 750ml*2개입"
                        },
                        {
                            name: "수박 8kg",
                            y: 11.02,
                            drilldown: "수박 8kg"
                        },
                        {
                            name: "묵은지볶음밥",
                            y: 9.92,
                            drilldown: "묵은지볶음밥"
                        },
                        {
                            name: "영광굴비 1.2kg",
                            y: 8.62,
                            drilldown: "영광굴비 1.2kg"
                        },
                        {
                            name: "한돈 목살 양념 구이",
                            y: 7.62,
                            drilldown: "한돈 목살 양념 구이"
                        },
                        {
                            name: "닭가슴살 큐브 스테이크 500g",
                            y: 4.62,
                            drilldown: "닭가슴살 큐브 스테이크 500g"
                        },
                        {
                            name: "데니쉬 식빵",
                            y: 3.62,
                            drilldown: "데니쉬 식빵"
                        }
                    ]
                }
            ]
            
        });


        Highcharts.chart('chart2', {
            chart: {
                type: 'pie'
            },
            title: {
                text: '판매상품 순위'
            },
            subtitle: {
                text: '판매합계(%)'
            },

            accessibility: {
                announceNewData: {
                    enabled: true
                },
                point: {
                    valueSuffix: '%'
                }
            },

            plotOptions: {
                series: {
                    dataLabels: {
                        enabled: true,
                        format: '{point.name}: {point.y:.1f}%'
                    }
                }
            },

            tooltip: {
                headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
            },

            series: [
                {
                    name: "product",
                    colorByPoint: true,
                    data: [
                        {
                            name: "간편 샐러드",
                            y: 15.74,
                            drilldown: "간편 샐러드"
                        },
                        {
                            name: "오로라 생연어",
                            y: 20.57,
                            drilldown: "오로라 생연어"
                        },
                        {
                            name: "갈비탕",
                            y: 37.23,
                            drilldown: "갈비탕"
                        },
                        {
                            name: "제주 목초 우유 750ml*2개입",
                            y: 19.58,
                            drilldown: "제주 목초 우유 750ml*2개입"
                        },
                        {
                            name: "한돈 목살 양념 구이",
                            y: 8.02,
                            drilldown: "한돈 목살 양념 구이"
                        },
                        {
                            name: "데니쉬 식빵",
                            y: 5.92,
                            drilldown: "데니쉬 식빵"
                        },
                        {
                            name: "영광굴비 1.2kg",
                            y: 13.62,
                            drilldown: "영광굴비 1.2kg"
                        },
                        {
                            name: "수박 8kg",
                            y: 17.62,
                            drilldown: "수박 8kg"
                        },
                        {
                            name: "묵은지볶음밥",
                            y: 8.62,
                            drilldown: "묵은지볶음밥"
                        },
                        {
                            name: "닭가슴살 큐브 스테이크 500g",
                            y: 10.62,
                            drilldown: "닭가슴살 큐브 스테이크 500g"
                        }
                    ]
                }
            ]
            
        });
	
	
	
	</script>
	
	
	<script src="/mh/js/admin_template.js"></script>
</body>
</html>