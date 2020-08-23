<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/inc/header.jsp" %>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <style>

        #tabs-1 , #tabs-2 {
            /* border-top: 2px solid #08718E; */
            clear: both;
            display: block;
        }
        
        .no_data {
            list-style: none;
            text-align: center;
            padding: 100px;
        }

        .list_data {
            width: 840px;
            height: 200px;
            /* border: 1px solid black; */
            margin-top: 20px;
            list-style: none;
            position: relative;
            left: -40px;
            font-size: 1.1em;
            font-weight: bold;
        }

        .list_container {
            width: 840px;
            height: 180px;
            border: 1px solid #ccc;
        }
        .list_container > div:nth-child(2) > div { float: left; letter-spacing: -0.5px; }
        .list_container > div:nth-child(2) > div:last-child { float: right; }

        .list_title { 
            height: 50px;
            border-bottom: 1px solid #ccc;
            line-height: 50px;
            margin: 0px 20px;
        }
        .list_title > div:first-child { float: left; }
        .list_title > div:last-child { /* .goItemInfo */
            width: 20px;
            height: 20px;
            float: right; 
            color: #08718E; 
            cursor: pointer; }

        .imgItem {
            width: 67px;
            height: 87px;
            border: 1px solid black;
            margin: 20px 20px;
        }

        .infoItem {
            height: 85px;
            margin: 20px 0px;
        }
        .infoItem > div {
            margin: 13px 0px;
        }
        .infoItem > div > span {
            font-size: 0.8em;
            margin: 10px;
        }

        .reviewItem {
            border: 1px solid #08718E;
            width: 120px;
            height: 40px;
            margin: 40px 20px;
            font-weight: normal;
        }

        .reviewWrite {
            background-color: white;
            color: #08718E;
        }

        .reviewView {
            background-color: #08718E;
            color: white;
        }

        #reviewTab {
            list-style: none;
            margin: 30px 0px 10px 0px;
            padding: 0px;
            color: #777;
        }

        #reviewTab li {
            display: inline-block;
            width: 420px;
            height: 50px;
            border: 1px solid #ccc;
            text-align: center;
            line-height: 48px;
            cursor: pointer;
        }
        #reviewTab li:first-child {
            border-right: none;
        }
        
        #reviewTab .nowTab {
            font-weight: bold;
            border-bottom: 2px solid #08718E;
            color: #08718E;
        }
        .nowTab a {color: #08718E;}

        #reviewTab a {
            outline: none;
            display: block;
            width: 100%;
            height: 100%;
        }
   
		.review_container {
			width: 840px;
			border-bottom: 1px solid #ccc;
			font-size: 0.9em;
			font-weight: normal;
		}
		  
		.review_item {
			padding: 20px;
			border-bottom: 1px solid #eee;                	
			font-weight: bold;
		}
		  
		.review_title {
			padding: 20px 20px 10px 20px;
			margin: 0px;
		}
		
		.title {
			position: relative;
			display: block;
			font-weight: bold;
		}
		
		.regdate {
			font-weight: normal;
			position: absolute;
			right: 0;
			top: 0;
			color: #444;
			font-size: 0.9em;
		}
		
		.review_content { padding: 10px 20px; }
		  
		.review_modify {
			position: relative;
			padding: 10px 20px 20px 20px;
		}
		  
		.reviewbtn {
			width: 70px;
			height: 35px;
			background-color: white;
			border: none;
			font-size: 0.85em;
		}
		  
		.delete {
			color: #08718E;
			position: absolute;
			right: 100px;
			top: 0;
		}
		  
		.modify {
			color: #08718E;
			position: absolute;
			right: 20px;
			top: 0;
			border: 1px solid #08718E;
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
            <!-- 주문 내역 -->
            
            <div style="clear: both; height: 50px; font-size: 0.85em; letter-spacing: -0.5px;">
                <b>후기 작성시 후기당 50 마일리지를 적립해드립니다.</b>
                <br>
                - 주간 베스트 후기로 선정될 시 <b>5,000</b> 마일리지를 추가로 적립해드립니다.
                <br>
                * 후기 작성은 배송 완료일로부터 <b>30</b>일 이내 가능합니다.
            </div>

            <div id="tabs" style="border: none">
                
                <ul id="reviewTab">
                    <li id="prevTab" class="nowTab"><a href="#tabs-1">작성가능 후기 (<span id="prevNum">${reviewavaillist.size()}</span>)</a></li><li id="compTab" class=""><a href="#tabs-2">작성완료 후기 (<span id="compNum">${reviewlist.size()}</span>)</a></li>
                </ul>
    
                <ul id="tabs-1">
                <c:if test="${reviewavaillist.size() < 1}">
                	<li class="no_data">작성가능 후기 내역이 없습니다.</li>
                </c:if>
                
                <c:if test="${reviewavaillist.size() >= 1}">
                	<c:forEach items="${reviewavaillist}" var="list">
                    <li class="list_data">
                        <div class="list_container">
                            <div class="list_title"><div>${list.pname}</div><div class="goItemInfo">></div></div>
                            <div>
                                <div class="imgItem" style="background-image: url(${list.img});"></div>
                                <div class="infoItem">
                                    <div><span>결제금액</span>${list.totalprice}</div>
                                    <div><span>주문상태</span>${list.status}</div>
                                </div>
                                <div><input class="reviewItem reviewWrite" type="button" value="후기 작성하기"></div>
                            </div>
                        </div>
                    </li>
                    </c:forEach>
                </c:if>
                </ul>

                <ul id="tabs-2">
                <c:if test="${reviewlist.size() < 1}">
                	<li class="no_data">작성한 후기 내역이 없습니다.</li>
                </c:if>

                <c:if test="${reviewlist.size() >= 1}">
                	<c:forEach items="${reviewlist}" var="list">
                    <li class="list_data">
                        <div class="review_container">
                            <div class="review_item"></div>
                            <div>
                                <div class="review_title">
	                                <span class="title">${list.title}<span class="regdate">${list.regdate}</span></span>
                                </div>
                                <div class="review_content">${list.content}</div>
                                <div class="review_modify">
                                	<div>
	                                	조회수 ${list.readcount}
	                                	<input class="reviewbtn delete" type="button" value="삭제하기">
	                                	<input class="reviewbtn modify" type="button" value="수정하기">
                                	</div>
                                </div>
                            </div>
                        </div>
                    </li>
                    </c:forEach>
                </c:if>
                </ul>

            </div>

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
	
	//jquery-ui > tabs
    $(function() {
        $("#tabs").tabs();
    });

    $("#compTab").click(function() {
        $("#reviewTab li").removeClass("nowTab");
        $("#compTab").addClass("nowTab");
    });

    $("#prevTab").click(function() {
        $("#reviewTab li").removeClass("nowTab");
        $("#prevTab").addClass("nowTab");
    });

        // 상품 이름 옆의 화살표를 눌렀을 때 해당 상품의 정보 페이지로 넘어간다.
        $(".goItemInfo").click(function() {
            console.log("상품 정보 페이지입니다.");
        });

        // 상품의 후기 작성하기을 눌렀을 때
        // 해당 상품의 데이터를 가지고 후기 작성 페이지로 넘어간다.
        $(".reviewWrite").click(function() {
            console.log("후기 작성 페이지입니다.");
            location.href='/mh/user/mypage/review_upload.do';
        });

        // 상품의 후기 확인하기을 눌렀을 때
        // 본인이 작성항 후기 확인 페이지로 넘어간다.
        $(".reviewView").click(function() {
            console.log("후기 확인 페이지입니다.");
            location.href='/mh/user/mypage/review_view.do';
        });

        
        // 주문 목록이 없는 경우
        // 버튼 클릭은 서버 적용 후에 삭제해야하는 데이터임.
        $("#btnNoData").click(function() {

            // 하위 li 태그 전부 삭제
            $("#listOrder *").remove();
            // 주문 목록이 없다고 나타내주는 li 태그 추가
            $("#listOrder").append(`<li class="no_data">작성가능 후기 내역이 없습니다.</li>`);

        });


        // 주문 목록이 있는 경우
        $("#btnYesData").click(function() {

            $("#listOrder").css("border-bottom", "0px solid #ccc");
            
            // 하위 li 태그 전부 삭제
            $("#listOrder *").remove();

            // 주문 목록 태그 작성
            var contents = `<li class="list_data">
                <div class="list_container">
                    <div class="list_title"><div>[오하마] 프라임 등심 스테이크 200g(냉장)</div><div>></div></div>
                    <div>
                        <div class="imgItem" style="background-image: url();"></div>
                        <div class="infoItem">
                            <div><span>결제금액</span>39,000원</div>
                            <div><span>주문상태</span>배송완료</div>
                        </div>
                        <div><input class="reviewItem" type="button" value="후기 작성하기"></div>
                    </div>
                </div>
            </li>`;

            // 리스트, li 태그 추가
            $("#listOrder").append(contents);

        });


    </script>
    <script src="/mh/js/main.js"></script>
</body>
</html>