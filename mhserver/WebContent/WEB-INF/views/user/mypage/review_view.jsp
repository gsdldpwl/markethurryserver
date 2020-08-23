<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/inc/header.jsp" %>
    <style>
        
        #myReview > div { margin: 10px; }
        #myReview {
            width: 870px;
            height: auto;
            padding: 20px;
            border-top: 2px solid #ccc;
        }

        #reviewItem span { display: inline-block; }
        #reviewItem span:first-child { width: 60px; }
        #reviewItem {
            font-size: 1.2em;
            font-weight: bold;
            padding-bottom: 20px;
        }
        
        #reviewTitle { 
            font-weight: bold;
            padding-bottom: 10px;
        }

        #reviewImg {
            width: auto;
            height: auto;
        }

        #reviewContent { padding-top: 20px; }
        #reviewContent pre {
            border: none;
            width: 870px;
            height: auto;
            background-color: white;
            padding:10px;
            overflow: auto;
            white-space: pre-wrap;
        }

        #goBack {
            display: block;
            width: 150px;
            height: 45px;
            font-size: 1.2em;
            background-color: white;
            color: #08718E;
            border: 1px solid #08718E;
            border-radius: 3px;
            margin: 30px auto;
        }

    </style>
</head>

<body>
	<%
		out.flush();
	    RequestDispatcher dinfo = request.getRequestDispatcher("/user/mypage/mypage_cinfo.do");
		dinfo.include(request, response);
	%>
	<!-- 마이페이지 컨텐츠 부분 -->
    <div style="width: 1100px; min-height: 550px; margin: 60px auto;">
        
        <!-- ※ 왼쪽 영역 시작 ※ -->
		<%@include file="/WEB-INF/views/inc/mypage_menu.jsp" %>
        <!-- ※ 왼쪽 영역 끝 ※ -->

        <!-- ---------------------------------------------------------------------------- -->

        <!-- ※ 오른쪽 영역 시작 ※ -->

        <div style="width: 870px; height: auto; float: left; margin-left: 30px; vertical-align: middle;">


            <!-- 마이페이지 메뉴 헤더 들어가는 부분 -->
            <div style="height: 82px;">
                <div style="float: left;">
                    <h2 id="title">상품 후기<span id="subtitle"></span></h2>
                </div>
            </div>
            
            <!-- ---------------------------------------------------------------------------- -->
            
            <!-- 콘텐츠 영역 -->
            <!-- 내 후기 확인하기 -->

            <!-- select button -->
            <div id="myReview">
                <div id="reviewItem">
                    <span>상품</span>
                    <span id="itemName">[ 오마하 ] 프라임 등심 스테이크 200g(냉장)</span>
                </div>
                <div id="reviewTitle">고기가 신선하고 맛있어요~~</div>
                <div id="reviewImg"><img src="../../images/hotsample4.png" alt=""></div>
                <div id="reviewContent">
                    <pre>강력추천합니다!강력추천합니다!강력추천합니다!
강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!
                        
강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!
                        
강력추천합니다!강력추천합니다!강력추천합니다!
                        
강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!
                        
강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!강력추천합니다!</pre>
                </div>
            </div>

            <input type="button" id="goBack" value="뒤로가기">
    
            <!-- ※ 오른쪽 영역 끝 ※ -->
            
        </div>
        <div style="clear:both;"></div>
    </div>


<!-- footer -->
<%@include file="/WEB-INF/views/inc/footer.jsp" %>

    <!-- script start -->
    <script>
    
	$("#MyMenu > div").removeClass("nowPage");
	$("#goMyReview").addClass("nowPage");

        // 뒤로가기
        $("#goBack").click(function() {
        	location.href='/mh/user/mypage/review.do';
        });

    </script>
    <script src="/mh/js/main.js"></script>
</body>
</html>