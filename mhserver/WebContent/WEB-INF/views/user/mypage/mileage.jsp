<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/inc/header.jsp" %>
    <style>

        #pointTab {
            list-style: none;
            margin: 0px;
            padding: 0px;
            color: #777;
        }

        #pointTab li {
            display: inline-block;
            width: 434px;
            height: 100px;
            border: 1px solid #ccc;
            text-align: center;
            font-size: 1.5em;
            font-weight: bold;
            line-height: 100px;
        }

        #pointTab li:first-child { border-right: none; }
        #pointTab li:last-child {
            color: #08718E;
        }


        #tblList {
            width: 870px;
            border-collapse: collapse;
            margin-top: 40px;
        }

        #no_data {
            list-style: none;
            text-align: center;
            padding-top: 85px !important;
            padding-bottom: 85px !important;
        }


        #tblList tr { border-bottom: 1px solid #ccc; }
        #tblList th, #tblList tr:last-child { border-bottom: 1px solid #999; }
        #tblList th, #tblList td { text-align: center; }
        #tblList td {padding: 20px 0px 20px 0px;}

        #tblList td:nth-child(2) { text-align: left; padding-left: 10px;}
        #tblList td:nth-child(3) { text-align: right; padding-right: 50px;}
        #tblList th:nth-child(1) { width: 150px; }
        #tblList th:nth-child(2) { width: 570px; text-align: left; padding-left: 40px; }
        #tblList th:nth-child(3) { width: 150px; }

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
                    <h2 id="title">마일리지<span id="subtitle">보유하고 계신 마일리지의 내역을 한 눈에 확인하실 수 있습니다.</span></h2>
                </div>
            </div>
            
            <!-- ---------------------------------------------------------------------------- -->
            
            <!-- 콘텐츠 영역 -->
            <!-- 주문 내역 -->

            <ul id="pointTab">
                <li>현재 적립금</li><li>${totalmilaege} P</li>
            </ul>

                                
            <table id="tblList">
                <tr style="height: 40px; border-top: 1px solid #08718E; border-bottom: 1px solid ;">
                    <th>날짜</th>
                    <th>내용</th>
                    <th>금액</th>
                </tr>
                <tbody>                
                	<c:if test="${empty mileagedto}">
                		<tr>
                			<td id="no_data" colspan="3">마일리지 내역이 존재하지 않습니다.</td>
                		</tr>
                	</c:if>
                	
                	<c:if test="${not empty mileagedto}">
                	<c:forEach items="${mileagedto}" var="mdto">
                    <tr>
                        <td>${mdto.regdate}</td>
                        <td>${mdto.reason}</td>
                        <td>
	                        <c:if test="${mdto.category == 1}">+</c:if>
	                        <c:if test="${mdto.category == 0}">-</c:if>
	                        ${mdto.price} P
                        </td>
                    </tr>
                	</c:forEach>
                	</c:if>
                </tbody>
            </table>

            <!-- ※ 오른쪽 영역 끝 ※ -->
            
        </div>
        <div style="clear:both;"></div>
    </div>


<!-- footer -->
<%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <!-- script start -->
    <script>

		$("#MyMenu > div").removeClass("nowPage");
		$("#goMyPoint_menu").addClass("nowPage");

    </script>
    <script src="/mh/js/main.js"></script>

</body>
</html>