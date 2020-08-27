<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓허리 관리자 :: 메인</title>
</head>
<%@include file="/WEB-INF/views/inc/admin_header.jsp" %>

<style>

        .mainFst, #mainSec {
              padding: 20px;
              width: 1300px;
         }

         /* 매출 표 css */
        #revenue {
            width: 600px;
            display: inline-block;
        }

        /* 기업 성장표 css */
        #company {
            width: 600px;
            display: inline-block;
            margin-left: 30px;
        }

        /* 회원수 css */
        .memberNum {
            width: 600px;
            float: left;      
            margin-top: 30px;
        }

        .memberNum .mbTxt {
            text-align: center;
            font-size: 1.5em;
            border-bottom: 2px solid #08718E;
            padding-bottom: 10px;
        }

        .memberNum .mbTable {
            /* border:1px solid olive; */
            padding: 20px;
            margin-left: 40px;

        }

        .memberNum .mbTable th {
            width: 200px;
            text-align: center;
            font-size: 17px;
        }

        .memberNum .mbTable td #mTxt  {
            width: 130px;
            text-align: right;
            margin-right: 3px;
            border: none;
        }

        .memberNum .mbTable td {
            text-align: right;
            font-size: 17px;
            width: 200px;
        }


        #memberTb {
            width: 500px;
        }

         #mainSec img {
            width: 600px;
            height: 150px;
        }



       /* 상품별 순위 표 css */
        #ecGoods_container {
            width: 600px;
            float: left;   
            margin-left: 30px;
        }

        /* 상품 시세 css */
        #goodsQu {
            width: 300px;
            /* border:  1px solid #08718E;     */
            position: absolute;
            top: 40px;
            left: 1350px;
            float: right;
            width: 284px;
            height: 0px;

        }
        #goodsQu .quotation {
            font-size: 16px;
            text-align: center;
            margin: 8px ;
            padding-bottom: 8px;
            border-bottom: 2px solid #08718E;
        }

        .quTable {
            padding-top: 5px;
        }
        .quTable th {
            text-align: center;
        }
        
        .quTable td {
            text-align: right;
          

        }

        .quTable .qutxxt {
            text-align: right;
            border: none;
            
        }
   
        /* 오늘의 마켓허리 css */

        .todayIs {
            width: 300px;
            position: absolute;
            top: 550px;
            left: 1350px;
            float: right;
            width: 284px;
            height: 0px;
        }

        .todayIs .tdNews {
            font-size: 16px;
            text-align: center;
            margin: 8px ;
            padding-bottom: 8px;
            border-bottom: 2px solid #08718E;
        }

        .newsTable {
            padding-top: 5px;
            /* border: 1px solid tomato; */
        }

        .newsTable th {
            text-align: left;
            /* border-right:1px solid violet ; */
            width: 170px;
            /* margin-right: 50px; */
            background-color: white;
        }

        .newsTable td {
            text-align: right;
            /* border: 1px solid sienna; */
            width: 100px;
        }

        .newsTable tr span {
            margin-left:9px ;
        }

        .newsTable .nwcls {
            width: 70px;
            height: 30px;
            text-align: right;
            border: none;
            margin-right: 5px;
        }


        /* 이미지 css */

        #onlyImg img {
            width: 300px;
            height: 450px;
            position: absolute;
            top: 830px;
            left: 1350px;
            float: right;

        }


        /* 관리자 소식 css */
        
        ul.tabs {
            float: left;
            list-style: none;
            height: 32px;
            border-left: 1px solid #eee;
            width: 100%;
            font-family:"dotum";
            font-size:12px;
        }

        ul.tabs li {
            float: left;
            font-size: 1em;
            text-align:center;
            cursor: pointer;
            width: 12%;
            height: 40px;
            border: 1px solid gray;
            font-weight: bold;
            background: #fafafa;
            overflow: hidden;
            position: relative;
            padding-top: 10px;
        }

        ul.tabs li.active {
            background: #FFFFFF;
            /* border-bottom: 1px solid black; */
            border-left: 1px solid black;
        }

        .tab_container {
            border: 1px solid black;
            clear: both;
            float: left;
            width: 1200px;
            height: 158px;
            margin-left: 41px;
            margin-top: -2px;
            background: #FFFFFF;
        }

        .tab_content {
            padding: 5px;
            font-size: 12px;
            display: none;
        }

        .tab_container .tab_content ul {
            width: 100%;
            margin: 0px;
            padding: 0px;
        }

        .tab_container .tab_content ul li {
            padding-top: 14px;
            padding-left: 20px;
            padding-bottom: 10px;
            font-size: 1.3em;
            list-style: none;
            text-decoration: none;
        }
        
        .tab_container .tab_content ul li > a {
            text-decoration: none;
            color: black;
            padding-left: 20px;
        }

        #issue {
            width: 1200px;
            margin: 80px 0px;
        }
        
        #tab3 li span {
            margin-right: 6px;
        }
        


    </style>
<body>
	
	<div id="main">
    <div id="container">
        <!-- 구현 시작 파트 -->


        <!-- 메출,성장 그래프 -->
        <div class="adminMainPage">
            <div class="mainFst">
                <div id="revenue">
                    <p style="display: none;">기업 매출 그래프</p>
                </div>
                <div id="company">
                    <p style="display: none;">기업 성장 매출표</p>
                </div>
            </div>

            <!-- 마켓허리 회원수  -->
            <div id="mainSec">
                <div class="memberNum">
                    <div class="mbTxt">
                        <span class="glyphicon glyphicon-user" style=" color: #08718E;"></span> 마켓허리 회원
                    </div>
                    <div class="mbTable">
                        <table class="table table-bordered" id="memberTb">
                            <tbody>
                                <tr class="mbAll">
                                    <th class="memberAll">총
                                        <td class="allNum"><input type="text" value="3,900,000" readonly id="mTxt">명</td>
                                    </th>
                                </tr>
                                <tr class="mbNew">
                                    <th class="memberNew">신규 가입 회원
                                        <td class="newNum"><input type="text" value="2,500" readonly id="mTxt">명</td>
                                    </th>
                                </tr>
                                <tr class="mbOut">
                                    <th class="memberOut">탈퇴한 회원
                                        <td class="outNum"><input type="text" value="112" readonly id="mTxt">명</td>
                                    </th>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                            <div class="mbImg">
                                <img src="/mh/images/adminmem.jpg">
                            </div>
                </div>

                <!-- 상품별 주문순위 그래프 -->
                <div id="ecGoods_container">
                    <div id="ecGoods">
                        <p style="display: none;">상품별 주문 순위</p>
                    </div>
                </div>

                <div style="clear: both;"></div>
            </div>


            <!-- 상품 시세 -->
            <div id="goodsQu">
                <div class="quotation">
                    <span class="glyphicon glyphicon-sort" style="color: tomato;"></span>
                        <span class="sisae">상품별 시세</span>
                </div>
                <div class="quTable">
                    <table class="table table-bordered" id="goodsquTb">
                        <tbody>
                            <tr class="quVeg">
                                <th class="vegTit">채소
                                    <td class="vegNum"><input type="text" value="- 1.03" readonly id="quVtxt" class="qutxxt"></td>
                                </th>
                            </tr>
                            <tr class="quFurt">
                                <th class="furtTit">과일
                                    <td class="furtNum"><input type="text" value="+ 0.03" readonly id="quFtxt" class="qutxxt"></td>
                                </th>
                            </tr>
                            <tr class="quMeat">
                                <th class="meatTit">육류
                                    <td class="meatNum"><input type="text" value="+ 0.86" readonly id="quMtxt" class="qutxxt"></td>
                                </th>
                            </tr>
                            <tr class="quFish">
                                <th class="fishTit">수산
                                    <td class="fishNum"><input type="text" value="+ 1.70" readonly id="quFitxt" class="qutxxt"></td>
                                </th>
                            </tr>
                            <tr class="quProfod">
                                <th class="profodTit">가공식품
                                    <td class="profodNum"><input type="text" value="- 0.53" readonly id="quProtxt" class="qutxxt"></td>
                                </th>
                            </tr>
                            <tr class="quSor">
                                <th class="sorTit">양념,소스
                                    <td class="sorNum"><input type="text" value="- 2.03" readonly id="quSortxt" class="qutxxt"></td>
                                </th>
                            </tr>
                            <tr class="quMilk">
                                <th class="milkTit">유제품
                                    <td class="milkNum"><input type="text" value="+ 0.52" readonly id="quMiltxt" class="qutxxt"></td>
                                </th>
                            </tr>
                            <tr class="quhelt">
                                <th class="heltTit">건강식품
                                    <td class="heltNum"><input type="text" value="+ 2.01" readonly id="quHeltxt" class="qutxxt"></td>
                                </th>
                            </tr>
                            <tr class="quDrink">
                                <th class="drinkTit">음료
                                    <td class="drinkNum">
                                            <input type="text" value="- 0.43" readonly id="qDriFtxt" class="qutxxt">
                                     </td>
                                </th>
                            </tr>
                            
                    </tbody>
                    </table>
                </div>
            </div>

            <!-- 오늘의 소식 -->
            <div class="todayIs">
                <div class="tdNews">
                    <span class="glyphicon glyphicon-leaf" style="color:#08718E ;"></span>
                    <span class="newsTitle">오늘의 마켓허리</span>
                </div>
                <div class="newsTable">
                    <table class="" id="newsTb">
                        <tbody>
                            <tr class="nwTtrr">
                                <th class="newsTthh">신상품 입고<span class="label label-warning">New</span>
                                    <td class="newsTtdd"><input type="text" id="newIn" class="nwcls" readonly value="106">개</td>
                                </th>
                            </tr>
                            <tr class="bckTtrr">
                                <th class="backTthh">반품 입고<span class="label label-warning">New</span>
                                    <td class="backTtdd"><input type="text" id="backIn" class="nwcls" readonly value="612">개</td>
                                </th>
                            </tr>
                            <tr class="chgTtrr">
                                <th class="chgTthh">교환 신청<span class="label label-warning">New</span>
                                    <td class="chgsTtdd"><input type="text" id="chgIn" class="nwcls" readonly value="433">개</td>
                                </th>
                            </tr>
                            <tr class="cnlsTtrr">
                                <th class="cnlsTthh">취소 신청<span class="label label-warning">New</span>
                                    <td class="cnlsTtdd"><input type="text" id="cnlsIn" class="nwcls" readonly value="127">개</td>
                                </th>
                            </tr>
                            <tr class="nrcpTtrr">
                                <th class="nrcpTthh">새로운 레시피<span class="label label-warning">New</span>
                                    <td class="nrcpTtdd"><input type="text" id="nrcpIn" class="nwcls" readonly value="32">개</td>
                                </th>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- <div id="onlyImg">
                <img src="../images/markethurryIs.jpg">
            </div> -->

            
            <!-- 탭 메뉴 -->
        <div id="issue">
            <ul class="tabs">
                <li class="active" rel="tab1">공지사항</li>
                <li rel="tab2">이 달의 이벤트</li>
                <li rel="tab3">나만의 레시피</li>
            </ul>
            <div class="tab_container">
                <div id="tab1" class="tab_content">
                    <ul>
                        <li><a href="#">[마켓허리]"허리라이프-어디든 간다! 허리멀리! 신선하지 않은 신선MD의 신선한 장미를 찾아서"댓글 이벤트 당첨 결과</a></li>
                        <li><a href="#">[가격인상공지][하늘빛]유기 야채 스프 1박스(2020.7.16~)</a></li>
                        <li><a href="#">[가격인상공지][굴다리식품]새우젓 150g외 4종(2020.7.14~)</a></li>
                    </ul>
                </div>
                <div id="tab2" class="tab_content">
                    <ul>
                        <li><a href="#">- 월간 테마관 : 밀가루가 어려운 당신에게 글루텐 프리 제품 30%할인! (~7/31(금) 11시까지)</a></li>
                        <li><a href="#">- 무더운 여름! 시원한 맥주와 환상 궁합 마른 안주모음 할인~ 최대 15%할인!! (~7/21(화) 11시까지)</a></li>
                        <li><a href="#">- 나를 위한 건강한 하루 한끼! 샐러드 식단 꿀 조합 모음! (~7/24(금) 11시까지)</a></li>
                    </ul>
                </div>
                <div id="tab3" class="tab_content">
                    <ul>
                        <li><a href="#"><span class="label label-info">Best</span>마시는 순간 땡땡 얼어버리는! 시원한 땡모반 레시피</a></li>
                        <li><a href="#"><span class="label label-warning">New</span>간편한 치킨 샐러드,여름철 다이어트(닭가슴살 사용)</a></li>
                        <li><a href="#"><span class="label label-info">Best</span>마켓허리의 백쌤!여름에 딱 맞는 삼계탕 레시피 들고왔어요~</a></li>
                    </ul>
                </div>
            </div>
        </div>
            
       

        </div>



    </div>
</div>
    
    <script>

        // 매출 그래프
        Highcharts.chart('revenue', {
        	 credits: {
             	enabled: false
             },
             
            chart: {
                type: 'column'
            },
            title: {
                text: '마켓허리 매출 그래프 , 2020'
            },
            subtitle: {
                text: '[업데이트: <%= sf.format(nowTime) %>]'
            },
            xAxis: {
                type: 'category',
                labels: {
                    rotation: -45,
                    style: {
                        fontSize: '13px',
                        fontFamily: 'Verdana, sans-serif'
                    
                    }
                }
            },
            yAxis: {
                min: 0,
                title: {
                    text: '단위(억) '
                }
            },
            legend: {
                enabled: false
            },
            tooltip: {
                pointFormat: '단위(억): <b>{point.y:.1f} millions</b>'
            },
            series: [{
                name: 'Profit',
                data: [
                    ['매출', 300.8],
                    ['비용', 190.2],
                    ['순이익', 140.9],
                
                ],
                dataLabels: {
                    enabled: true,
                    rotation: -90,
                    color: '#FFFFFF',
                    align: 'right',
                    format: '{point.y:.1f}', // one decimal
                    y: 10, // 10 pixels down from the top
                    style: {
                        fontSize: '13px',
                        fontFamily: 'Verdana, sans-serif'
                    }
                }
            }]
        });
        
        //성장 그래프
        Highcharts.chart('company', {
        	
        	 credits: {
             	enabled: false
             },
             
            chart: {
                type: 'line'
            },
            title: {
                text: '마켓허리 성장 그래프'
            },
            subtitle: {
                text: '[업데이트: <%= sf.format(nowTime) %>]'
            },
            xAxis: {
                categories: ['2016년', '2017년', '2018년', '2019년', '2020년']   
                
            },
            yAxis: {
                title: {
                    text: '단위(억)'
                }
            },
            plotOptions: {
                line: {
                    dataLabels: {
                        enabled: true
                    },
                    enableMouseTracking: false
                }
            },
            series: [{
                name: '마켓허리',
                data: [130.8,450.6 , 623.1, 572.2, 300.8]
            }]
        });

        //상품별 순위 차트
        var chart = Highcharts.chart('ecGoods', {
        	
	       credits: {
	        	enabled: false
	        },
	
	        title: {
	            text: '상품별 주문 현황'
	        },
	
	        subtitle: {
	            text: '[업데이트: <%= sf.format(nowTime) %>]'
	        },
	
	        xAxis: {
	            categories: ['채소', '과일', '육류', '수산', '가공식품', '양념,소스', '유제품', '건강식품', '음료']
	        },
	
	        yAxis: {
	             title: {
	                text: '단위(개)'
	         }
	        },
	        tooltip: {
                pointFormat: '판매 수: <b>{point.y:.0f} 개</b>'
            },

	        series: [{
	            type: 'column',
	            colorByPoint: true,
	            data: [3800, 3000, 5470, 2300, 5800, 1235, 1030, 203, 1452],
	            showInLegend: false
	        }]
	
	        });
	
	
	        $('#plain').click(function () {
	        chart.update({
	            chart: {
	                inverted: false,
	                polar: false
	            },
	            subtitle: {
	                text: 'Plain'
	            }
	        });
	        });
	
	        $('#inverted').click(function () {
	        chart.update({
	            chart: {
	                inverted: true,
	                polar: false
	            },
	            subtitle: {
	                text: 'Inverted'
	            }
	        });
	        });
	
	        $('#polar').click(function () {
	        chart.update({
	            chart: {
	                inverted: false,
	                polar: true
	            },
	            subtitle: {
	                text: 'Polar'
	            }
	        });
	        });

        //특정 글자색 바꾸기
        
        $("#goodsquTb").children().children().each(function(index, item){
            var percentage = $(this).find("td").children();
            console.log(percentage.val())
            if(percentage.val().indexOf("-") != -1){
                console.log("minus");
                percentage.css("color","red");
            } else {
                console.log("plus");
                percentage.css("color","blue");
            }

            
        });
        
      //탭메뉴를 클릭했을 때 탭메뉴의 색깔과 출력되는 정보변경
        $(function () {
            $(".tab_content").hide();
            $("ul.tabs li:first").css("background-color", "#08718E");
            $("ul.tabs li:first").css("color", "white");
            $(".tab_content:first").show();

            $("ul.tabs li").click(function () {
                $("ul.tabs li").removeClass("active").css("background-color", "white");
                $("ul.tabs li").removeClass("active").css("color", "black");
                $(this).addClass("active").css("background-color", "#08718E");
                $(this).addClass("active").css("color", "white");
                $(".tab_content").hide()
                var activeTab = $(this).attr("rel");
                $("#" + activeTab).fadeIn()
            });
        });
    </script>
	
	<script src="/mh/js/admin_template.js"></script>
</body>
</html>