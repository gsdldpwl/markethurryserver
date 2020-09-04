<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓허리 :: 오늘의 장보기</title>
<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<style>
#banner {
            display: block;
            height: 400px;
            background: #fff url(https://res.kurly.com/images/event/introduce/0720/pc/intro_main_v2.jpg) no-repeat 50% -100px;
        }

        .tit_intro {
            text-align: center;
            margin: 40px auto;
            font-size: 34px;
            text-align: center;
        }

        .infobox{
            width: 1100px;
            margin: 0px auto;
            text-align: center;
        }

        .intro_text {
            font-size: 18px;
            margin-top: 60px;
            margin-bottom: 130px;
        }

        #banner2{
            display: block;
            height: 400px;
            background: #fff url(https://res.kurly.com/images/event/introduce/0720/pc/intro_main2_v2.jpg) no-repeat 50% -100px;
            margin-top: 40px;
        }
        #map {
            border: 1px solid #7777;
        }
</style>
<%@include file="/WEB-INF/views/inc/header.jsp" %>
</head>
<body>
	 <div id="banner"></div>
    <div class="infobox">
        <h3 class="tit_intro">마켓허리의 시작</h3>
        <p class="intro_text">
            이 세상에는 참 다양한 푸드마켓이 있습니다.
            하지만 우리와 꼭 맞는 마음을 가진 푸드마켓을 찾기란 쉽지 않았습니다.
            ‘그렇다면 우리가 직접 만들어보면 어떨까?’ 2015년 마켓허리는 그렇게 시작되었습니다.<br><br>
            맛있는 음식이 삶의 가장 큰 즐거움이라 믿는 사람들이 뜻을 합쳤죠. 허리의 팀원들은 이미 팀을 꾸리기 전부터 좋은 재료를 위해서라면
            해외 직구, 백화점, 동네 마트, 재래 시장, 더 나아가 전국 방방곡곡의 산지를 찾아 다니며 품질과 가격을 비교하던 깐깐한 소비자였습니다.
            이렇게 찾아낸 훌륭한 생산자와 최상의 먹거리들을 나와 내 가족만 알고 있기에는 너무 아쉬웠습니다. <br><br>
            비싼 식자재만이 좋은 음식일 것이라고 막연하게 생각하고 있는 소비자에게는 진짜 맛을 소개해드리고 싶었고,
            뚝심 하나로 산골 오지에서 수십 년간 묵묵히 장을 담그는 명인, 시들어서 버릴지언정 무농약을 고집하는 농부에게는 안정적인 판매 활로를 찾아드리고 싶었습니다.
            생산자와 소비자, 판매자까지 모두 행복하고 맛있는 삶을 살 수 있도록 허리는 오늘도 열심히 발로 뛰며 고민합니다.
        </p>
    </div>
    <div id="banner2"></div>
    <div class="infobox">
        <h3 class="tit_intro">허리의 믿음, 그리고 지켜야 할 가치</h3>
        <p class="intro_text">
            시작은 단순했지만 고민은 깊었습니다. 직원이 아닌 한 사람의 고객으로서도 오래도록 사랑할 수 있는 서비스를 만들고자 했기에, 상품을 검토할 때 ‘잘 팔릴까’ 보다는 ‘내가 사고 싶은지’를 먼저 물었고, ‘많이 팔릴지’ 보다는 ‘많이 팔려야 마땅한지’를 고민했고, 단기적으로 이익을 추구하기보다는 장기적으로 생산자와 소비자 모두에게 옳은 일을 하기 위해 치열하게 고민하고 노력해왔습니다.<br><br>
그 과정에서 허리가 꼭 지키고자 했던 가치들을 공유합니다. 이 가치들은 지금까지 그래왔듯 앞으로도 허리가 성장하는 과정에서 방향을 잃지 않도록 길을 밝혀주는 등대의 역할을 해줄 것이며, 동시에 허리의 파트너인 생산자, 소비자, 그리고 주주 여러분께 드리는 약속이기도 합니다.
        </p>
    </div>

    <!-- <div class="infobox">
        <h3 class="tit_intro">마켓허리가 뿌리내린 곳</h3>`
         <div id="map" style="width:700px;height:500px; display:inline-block;"></div>
          <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5fc1576f091c3effff15bf7185a48a41"></script> -->
    <!-- <script>

        var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
        var options = { //지도를 생성할 때 필요한 기본 옵션
            center: new kakao.maps.LatLng(37.4992903,126.9981954), //지도의 중심좌표.
            level: 3 //지도의 레벨(확대, 축소 정도)
        };

        var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

    </script> -->
 <a href="#" id="topbtn" style="border: 0px; outline: none;"></a>
<%@include file="/WEB-INF/views/inc/footer.jsp" %>
<script src="/mh/js/main.js"></script>
</body>
</html>