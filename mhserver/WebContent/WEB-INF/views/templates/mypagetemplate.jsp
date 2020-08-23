<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/inc/header.jsp" %>

</head>

<body>

<%@include file="/WEB-INF/views/inc/mypage_cinfo.jsp" %>
	<!-- 마이페이지 컨텐츠 부분 -->
    <div style="width: 1100px; min-height: 550px; margin: 60px auto;">
        
        <!-- ※ 왼쪽 영역 시작 ※ -->
		<%@include file="/WEB-INF/views/inc/mypage_menu.jsp" %>
        <!-- ※ 왼쪽 영역 끝 ※ -->

        <!-- ---------------------------------------------------------------------------- -->

        <!-- ※ 오른쪽 영역 시작 ※ -->

        <div style="width: 870px; height: auto; float: left; margin-left: 30px; vertical-align: middle;">

            <!-- 마이페이지 메뉴 헤더 들어가는 부분 -->
            <div style="height: 82px; border-bottom: 2px solid #08718E;">
                <div style="float: left;">
                    <h2 id="title">주문 내역<span id="subtitle">지난 3년간의 주문 내역 조회가 가능합니다.</span></h2>
                </div>
                <div style="float: right; margin-top: 15px;">
                    <select class="form-control" id="selectYear">
                        <option>전체기간</option>
                        <option>2020년</option>
                        <option>2019년</option>
                        <option>2018년</option>
                    </select>
                </div>
            </div>
            
            <!-- ---------------------------------------------------------------------------- -->

            <!-- 콘텐츠 영역 -->
                    
            <!-- ※ 오른쪽 영역 끝 ※ -->
            
        </div>
        <div style="clear:both;"></div>
    </div>


<!-- footer -->
<%@include file="/WEB-INF/views/inc/footer.jsp" %>
</body>
</html>