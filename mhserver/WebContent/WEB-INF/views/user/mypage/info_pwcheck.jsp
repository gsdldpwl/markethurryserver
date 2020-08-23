<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/inc/header.jsp" %>
    <style>

        #subInfo h3 {
            font-size: 1.4em;
            margin: 0px;
            font-weight: bold;
            color: #555;
        }

        #subInfo p {
            font-size: 0.9em;
            margin: 5px 0px;
            color: #666;
        }

        #boxInfo {
            border-top: 1px solid #444;
            border-bottom: 1px solid #aaa;
            height: 150px;
        }

        #boxId *, #boxPw * {
            display: block;
            float: left;
        }
        #boxPw span, #goModifyMyInfo {clear: both;}

        #boxId { width:370px; height: 40px; margin: 25px auto 20px auto; }
        #boxPw { width:370px; height: 40px; margin: 20px auto 25px auto; }

        #boxId span, #boxPw span {
            width: 120px;
            height: 40px;
            line-height: 40px;
            font-weight: bold;
            font-size: 1.1em;
        }

        #inputId, #inputPw {
            width: 250px;
            height: 40px;
            border: 1px solid #aaa;
            border-radius: 5px;
            padding: 0px 10px;
        }
        
        #inputId:focus, #inputPw:focus { 
            border: 1px solid black;
        }

        #goModifyMyInfo {
            display: block;
            width: 230px;
            height: 55px;
            font-size: 1.3em;
            background-color: #08718E;
            color: white;
            border: none;
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
                    <h2 id="title">개인 정보 수정<span id="subtitle"></span></h2>
                </div>
            </div>
            
            <!-- ---------------------------------------------------------------------------- -->

            <!-- 콘텐츠 영역 -->
                    
            <div id="subInfo">
                <h3>비밀번호 재확인</h3>
                <p>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.</p>
            </div>
            
            <form method="POST" action="/mh/user/mypage/info_pwcheckok.do">            
            <div id="boxInfo">
                <div id="boxId">
                    <span>아이디</span>
                    <input type="text" id="inputId" name="inputId" value="${id}" readonly>
                </div>
                <div id="boxPw">
                    <span>비밀번호 *</span>
                    <input type="password" id="inputPw" name="inputPw">
                </div>
            </div>
            <input type="submit" id="goModifyMyInfo" value="확인">
            </form>

            <!-- ※ 오른쪽 영역 끝 ※ -->
            
        </div>
        <div style="clear:both;"></div>
    </div>


<!-- footer -->
<%@include file="/WEB-INF/views/inc/footer.jsp" %>

    <!-- script start -->
    <script>

	$("#MyMenu > div").removeClass("nowPage");
	$("#goMyInfo").addClass("nowPage");
	
    // 확인 버튼 누를시
    $("#goModifyMyInfo").click(function() {

        // 입력한 비밀번호 넘겨줌
        

    });

    </script>
    <script src="/mh/js/main.js"></script>
    
</body>
</html>