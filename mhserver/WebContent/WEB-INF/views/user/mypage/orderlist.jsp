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
            <div style="height: 82px; border-bottom: 2px solid #08718E;">
                <div style="float: left;">
                    <h2 id="title">주문 내역<span id="subtitle">지난 3년간의 주문 내역 조회가 가능합니다.</span></h2>
                </div>
                <div style="float: right; margin-top: 15px;">
                    <select class="form-control" id="selectYear">
                        <option value="all">전체기간</option>
                        <option value="2020">2020년</option>
                        <option value="2019">2019년</option>
                        <option value="2018">2018년</option>
                    </select>
                </div>
            </div>
            
            <!-- ---------------------------------------------------------------------------- -->

            <!-- 콘텐츠 영역 -->
            
            <!-- 주문 내역 -->
            
            <ul id="listOrder">
                <%-- 주문 내역 없는 경우 --%>
                <c:if test="${empty orderlistdto}">
                <li class="no_data">주문 내역이 없습니다.</li>
                </c:if>
                
                <%-- 주문 내역 있는 경우 --%>
                <c:if test="${not empty orderlistdto}">
                <c:set var="datetemp" value="" />
                <c:set var="seqtemp" value="${orderlistdto[0].olseq}" />
                
                <%-- 주문한 상품 여러개인 경우를 생각하기 위해 변수에다가 이전 주문 정보 저장해놓음 --%>
                <c:set var="index" value="1" />
                <c:set var="cnt" value="-1" />
                <c:set var="prevname" value="" />
                <c:set var="previmg" value="" />
                <c:set var="prevolseq" value="" />
                <c:set var="prevtotalprice" value="" />
                <c:set var="prevstatus" value="" />
                <c:set var="prevregdate" value="" />

                <c:set var="listsize" value="${orderlistdto.size()}" />

				<%-- 주문 목록 루프 --%>
                <c:forEach items="${orderlistdto}" var="list">
                	<%-- 첫번째 인덱스 --%>
                	<c:if test="${index == 1}">
		                <c:set var="prevname" value="${list.pname}" />
		                <c:set var="previmg" value="${list.img}" />
		                <c:set var="prevolseq" value="${list.olseq}" />
		                <c:set var="prevtotalprice" value="${list.totalprice}" />
		                <c:set var="prevstatus" value="${list.status}" />
	                    <c:set var="prevregdate" value="${list.regdate}" />
                	</c:if>
                	
                	<%-- 마지막 인덱스 전까지 --%>
                	<c:if test="${index > 1 && index <= listsize}">
	                	<%-- 같은 주문목록이면 변수에 넣어준다. --%>
	                    <c:if test="${seqtemp == list.olseq}">
			                <c:set var="prevname" value="${list.pname}" />
			                <c:set var="previmg" value="${list.img}" />
			                <c:set var="prevolseq" value="${list.olseq}" />
			                <c:set var="prevtotalprice" value="${list.totalprice}" />
			                <c:set var="prevstatus" value="${list.status}" />
		                    <c:set var="prevregdate" value="${list.regdate}" />
						</c:if>
	
						<%-- 같은 주문 목록이 아니면  --%>
	                    <c:if test="${seqtemp != list.olseq}">
		                	<li class="list_data">
		
			                	<c:if test="${datetemp != prevregdate}">
				                    <div class="list_date">
				                        ${prevregdate}
				                    </div>
			                    <c:set var="datetemp" value="${prevregdate}" />
                				<c:set var="prevregdate" value="${list.regdate}" />
			                    </c:if>
			                    
			                    
			                    <div class="list_container">
			                        <div class="list_title"><div>${prevname}<c:if test="${cnt > 0}"> 외 ${cnt}건</c:if></div><div class="goItemInfo">></div></div>
			                        <div>
			                            <div class="imgItem" style="background-image: url(${previmg}); background-size: contain;"></div>
			                            <div class="infoItem">
			                                <div><span>주문번호</span>${prevolseq}</div>
			                                <div><span>결제금액</span>${prevtotalprice}원</div>
			                                <div><span>주문상태</span>${prevstatus}</div>
			                            </div>
			                            <div><input class="q1to1Item" type="button" value="1:1 문의"></div>
			                        </div>
			                    </div>
		                	</li>
		                    <c:set var="seqtemp" value="${list.olseq}" />
			                <c:set var="cnt" value="-1" />
	                    </c:if>
                    </c:if>
                    
                    <%-- 마지막 인덱스 --%>
                    <c:if test="${index == listsize}">
                    	<c:set var="cnt" value="${cnt+1}" />
                    	<%-- 같은 주문목록이면 --%>
	                    <c:if test="${seqtemp == list.olseq}">
		                	<li class="list_data">
			                	<c:if test="${datetemp != prevregdate}">
				                    <div class="list_date">
				                        ${prevregdate}
				                    </div>
			                    </c:if>
			                    
			                    <div class="list_container">
			                        <div class="list_title"><div>${prevname}<c:if test="${cnt > 0}"> 외 ${cnt}건</c:if></div><div class="goItemInfo">></div></div>
			                        <div>
			                            <div class="imgItem" style="background-image: url(${previmg}); background-size: contain;"></div>
			                            <div class="infoItem">
			                                <div><span>주문번호</span>${prevolseq}</div>
			                                <div><span>결제금액</span>${prevtotalprice}원</div>
			                                <div><span>주문상태</span>${prevstatus}</div>
			                            </div>
			                            <div><input class="q1to1Item" type="button" value="1:1 문의"></div>
			                        </div>
			                    </div>
		                	</li>
						</c:if>
	
						<%-- 같은 주문 목록이 아니면  --%>
	                    <c:if test="${seqtemp != list.olseq}">
		                	<li class="list_data">
			                	<c:if test="${datetemp != list.regdate}">
				                    <div class="list_date">
				                        ${list.regdate}
				                    </div>
			                    </c:if>
			                    
			                    <div class="list_container">
			                        <div class="list_title"><div>${list.pname}<c:if test="${cnt > 0}"> 외 ${cnt}건</c:if></div><div class="goItemInfo">></div></div>
			                        <div>
			                            <div class="imgItem" style="background-image: url(${list.img}); background-size: contain;"></div>
			                            <div class="infoItem">
			                                <div><span>주문번호</span>${list.olseq}</div>
			                                <div><span>결제금액</span>${list.totalprice}원</div>
			                                <div><span>주문상태</span>${list.status}</div>
			                            </div>
			                            <div><input class="q1to1Item" type="button" value="1:1 문의"></div>
			                        </div>
			                    </div>
		                	</li>
	                    </c:if>
                    </c:if>
                    
	                <c:set var="index" value="${index+1}" />   
              		<c:set var="cnt" value="${cnt+1}" />                 
                    
                </c:forEach>
                </c:if>
            </ul>

            <!-- ※ 오른쪽 영역 끝 ※ -->
            
        </div>
        <div style="clear:both;"></div>
    </div>

<!-- footer -->
<%@include file="/WEB-INF/views/inc/footer.jsp" %>

<script>
	
	$("#MyMenu > div").removeClass("nowPage");
	$("#goMyOrder").addClass("nowPage");

	// 상품의 1:1 문의 버튼을 눌렀을 때
	// 해당 상품의 주문 번호 데이터를 가지고 1:1 작성 페이지로 넘어간다.
	$(".q1to1Item").click(function() {
    	location.href='/mh/user/customercenter/onebyone.do';
	});
	
	// 상품 이름 옆의 화살표를 눌렀을 때 해당 상품의 정보 페이지로 넘어간다.
	$(".goItemInfo").click(function() {
	    console.log("상품 정보 페이지입니다.");
	});
	
	// 주문 목록 기간 선택
	$("#selectYear").change(function() {
	    $("#selectYear option:selected").each(function() {
	        if ($(this).val() == "all") {
	            // 전체기간 선택시
	            location.href="/mh/user/mypage/orderlist.do";
	        } else if ($(this).val() == "2020") {
	            // 2020년 선택시
	            location.href="/mh/user/mypage/orderlist.do?year=2020";
	        } else if ($(this).val() == "2019") {
	            // 2019년 선택시
	            location.href="/mh/user/mypage/orderlist.do?year=2019";
	        } else if ($(this).val() == "2018") {
	            // 2018년 선택시
	            location.href="/mh/user/mypage/orderlist.do?year=2018";
	        }
	    });
	});

	$("#selectYear").val("${year}");
	
</script>
    <script src="/mh/js/main.js"></script>


</body>
</html>