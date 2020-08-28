<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/inc/header.jsp" %>

<style>
	
	#listOrder {
	    clear: both;
	    display: block;
	}
	
	.no_data {
	    list-style: none;
	    text-align: center;
	    padding: 100px;
	}
	
	.list_data {
	    width: 870px;
	    list-style: none;
	    position: relative;
	    left: -40px;
	    font-size: 1.1em;
	    font-weight: bold;
	    margin-bottom: 10px;
	}
	
	.list_date {
	    margin-top: 20px;
	    font-size: 1.25em;
	    color: #777;
	    padding: 10px 0px;
	}
	
	.list_container {
	    width: 870px;
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
	    border: 0px solid black;
	    margin: 20px 20px;
	}
	
	.infoItem > div:first-child { margin-top: 20px;}
	.infoItem > div {
	    margin: 10px 0px;
	}
	.infoItem > div > span {
	    font-size: 0.8em;
	    margin: 10px;
	}
	
	.q1to1Item {
	    background-color: white;
	    color: #08718E;
	    border: 1px solid #08718E;
	    width: 120px;
	    height: 40px;
	    margin: 40px 20px;
	}

</style>

</head>

<body>
	<%-- <%@include file="/WEB-INF/views/inc/mypage_cinfo.jsp" %> --%>
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
                    <h2 id="title">주문 상세 내역<span id="subtitle"></span></h2>
                </div>
            </div>
            
            <!-- ---------------------------------------------------------------------------- -->

            <!-- 콘텐츠 영역 -->
            
            <!-- 주문 상세 내역 -->
            <style>
            #orderTitle { position: relative; }
            #orderTitle a { color: #08718E; }
            #orderTitle span {
            	position: absolute;
            	right: 0;
            	top: 6px;
            	letter-spacing: -0.5px;
            }
            
            .detailTitle h3 { font-size: 1.7em; margin-bottom: 15px; }
            .detailTitle {
            	font-size: 0.9em;
            	color: #666;
            }
            
            .itemList, .tblList {
            	width: 100%;
            	border-top: 2px solid #08718E;
            	border-bottom: 2px solid #ddd;
            	margin-bottom: 40px;
            }
            .itemList td, .tblList th, .tblList td { padding: 10px; }
            .tblList th { font-weight: 500; width: 200px; }
	        .tblList td { font-size: 0.9em; color: #444; }
            
	        .itemImg {
			    width: 67px;
			    height: 87px;
			    margin: 20px 30px;
	 			background-size: contain;
	 			cursor: pointer;
	        }
	        
	        .itemName { padding: 5px 0px; font-weight: bold; cursor: pointer; }
	        .itemPrice { font-weight: bold; }
	        .itemPrice span { font-weight: normal; font-size: 0.9em; color: #666; }
	        .itemStat { font-weight: bold; color: #08718E; }
	        .itemList tr { border-bottom: 2px solid #ddd; }
	        .itemList td:first-child { width: 130px; }
	        .itemList td:last-child { width: 150px; }
	        
	        
            </style>
            <div id="orderTitle" class="detailTitle"><h3>주문 번호 ${odldto[0].olseq}</h3><span>배송 또는 상품에 문제가 있나요? <a href="/mh/user/customercenter/onebyoneinquiry.do?seq=${odldto[0].olseq}">1:1 문의하기 ></a></span></div>
            
            <table class="itemList">
            <c:forEach items="${odldto}" var="list">
	            <tr>
	                <td><div class="itemImg" style="background-image: url(${list.img});" onclick="location.href='/mh/user/product/productdetail.do?seq=${list.pseq}'"></div></td>
	                <td>
	                    <div class="itemName" onclick="location.href='/mh/user/product/productdetail.do?seq=${list.pseq}'">${list.pname}</div>
	                    <div class="itemPrice">${list.price}원 <span>${list.qty}개 구매</span></div>
	                </td>
	                <td><div class="itemStat">${list.status}</div></td>
	            </tr>
            </c:forEach>
            </table>
            
            <div class="detailTitle"><h3>결제 정보</h3></div>
            
            <table class="tblList">
            	<tr>
            		<th>총주문금액</th>
            		<td>${odldto[0].totalprice}원</td>
            	</tr>
            	<tr>
            		<th>상품할인</th>
            		<td>0원</td>
            	</tr>
            	<tr>
            		<th>적립금 사용</th>
            		<td>0원</td>
            	</tr>
            	<tr>
            		<th>결제금액</th>
            		<td>${odldto[0].totalprice}원</td>
            	</tr>
            	<tr>
            		<th>결제방법</th>
            		<td>신용카드</td>
            	</tr>
            </table>
            
            <div class="detailTitle"><h3>주문 정보</h3></div>
            
            <table class="tblList">
            	<tr>
            		<th>주문번호</th>
            		<td>${odldto[0].olseq}</td>
            	</tr>
            	<tr>
            		<th>주문자명</th>
            		<td>${dto.name}</td>
            	</tr>
            	<tr>
            		<th>보내는분</th>
            		<td>${dto.name}</td>
            	</tr>
            	<tr>
            		<th>결제일시</th>
            		<td>${odldto[0].regdate}</td>
            	</tr>
            	<tr>
            		<th>주문 처리상태</th>
            		<td>배송완료</td>
            	</tr>
            </table>
            
            <div class="detailTitle"><h3>받으실 장소</h3></div>
            
            <table class="tblList">
            	<tr>
            		<th>받으실 장소</th>
            		<td>문 앞</td>
            	</tr>
            	<tr>
            		<th>공동현관 출입 방법</th>
            		<td>자유 출입 가능</td>
            	</tr>
            </table>
            
            <div class="detailTitle"><h3>추가 정보</h3></div>
            
            <table class="tblList">
            	<tr>
            		<th>메세지 전송 시점</th>
            		<td>배송 직후</td>
            	</tr>
            	<tr>
            		<th>미출시 조치방법</th>
            		<td>결제수단으로 환불</td>
            	</tr>
            </table>
            <!-- ※ 오른쪽 영역 끝 ※ -->
            
        </div>
        <div style="clear:both;"></div>
    </div>

<!-- footer -->
<%@include file="/WEB-INF/views/inc/footer.jsp" %>

<script>
	
	$("#MyMenu > div").removeClass("nowPage");
	$("#goMyOrder").addClass("nowPage");

</script>
    <script src="/mh/js/main.js"></script>


</body>
</html>