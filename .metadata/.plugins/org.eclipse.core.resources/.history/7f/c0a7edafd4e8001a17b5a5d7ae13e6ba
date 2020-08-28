<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/mh/css/admin_template.css">
<link rel="stylesheet" href="/mh/css/jquery-ui.css" />
<script src="/mh/js/jquery-1.12.4.js"></script>
<script src="/mh/js/jquery-ui.js"></script>
<script src="/mh/js/highcharts.js"></script>
<style>
	
	 body {
            overflow-y: hidden;
        }
	
	#adminimg{
		width: 1100px;
		margin: 0px auto;
		margin-top: 180px;
		text-align: center;
		/* background-image:url("/mh/images/adminlogo.png"); */
	}
	 #loginheader {
            width: 1100px;
            margin: 0px auto;
            text-align: center;
            font-size: 20px;
            font-weight: 500;
        }

        #logininput {
            width: 1100px;
            height: 140px;
            margin: 0px auto;
            text-align: center;
        }

        .infoinput > input {
            width: 340px;
            height: 60px;
            border: 1px solid #ccc;
            border-radius: 3px;
            margin: 5px;
            padding-left: 10px;
            color: #ccc;
            outline:none;
        }

        #findinfo{
            width: 1100px;
            margin: 5px auto;
            text-align: center;
        }

        #findinfo > .eachinfo {
            width: 340px;
            margin: 0px auto;
            text-align: right;
            font-size: 12px;
            color: #333333;
        }

        .btndiv {
            width: 1100px;
            margin: 0px auto;
            text-align: center;
        }
        
        .activebtn {
            width: 340px;
            height: 60px;
            text-align: center;
            margin: 5px auto;
            border: 1px solid #777;
            background-color: #08718E;
            border-radius: 3px ;
            outline: none;
            color: white;
            font-size: 16px;
        }
        #regitbtn {
            background-color: white;
            border: 1px solid #08718E;
            color: #08718E;
        }
        
        #loginbtn {
        	margin-top: 15px;
        	cursor: pointer;
        }
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
            height: 30px;
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
            margin: 80px auto;
        }
        
        #tab3 li span {
            margin-right: 6px;
        }
        
        #loginheader {
            /* width: 1100px; */
            margin: 0px auto;
            text-align: center;
            font-size: 19px;
            font-weight: 550;
            color:#333333;
            margin-bottom:20px;
        }
        
</style>
<body>
	<div id="header">
    <div class="header">
        <div>
            <img id="logoimg" src="/mh/images/adminlogo.png" alt=""> 
        </div>
        <div id="home"><div id="homeglyphicon" class="glyphicon glyphicon-home"></div>홈페이지 바로가기</div>
    </div>
	</div>
	<div></div>
	<div id="adminimg">
		<img src="/mh/images/brandlogo.png" alt="brandlogo" id="brandlogo" style="cursor:pointer" style="margin-bottom:50px">
	</div>
	<div id="loginheader">관리자 로그인</div>
	<form method="POST" action="/mh/admin/main/adminloginok.do">
    <div id="logininput">
        <div class="infoinput"><input type="text" placeholder="아이디를 입력해주세요." name="userid"></div>
        <div class="infoinput"><input type="password" placeholder="패스워드를 입력해주세요." name="userpw"></div>
    </div>

    
    <div class="btndiv"><input type="submit" id="loginbtn" class="activebtn" value="로그인" name="login"></div>
    </form>
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
	<script src="/mh/js/admin_template.js"></script>
	<script src="/mh/js/admin.js"></script>
</body>
</html>