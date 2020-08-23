<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/inc/header.jsp" %>
<link rel="stylesheet" href="/mh/css/customerCenter.css">

 <style>
        /* 공지사항 */
        #tblNotice th,td {
            text-align: center;
        }
        .noticeTitle {
            text-align: left;
        }

        #tblNotice tbody tr:last-child td{
            border-bottom: 1px solid #08718E;
        }
    </style>


</head>

<body>

<%@include file="/WEB-INF/views/inc/mypage_cinfo.jsp" %>
	<!-- 마이페이지 컨텐츠 부분 -->
    <div style="width: 1100px; min-height: 550px; margin: 60px auto;">
        
        <!-- ※ 왼쪽 영역 시작 ※ -->
		<%@include file="/WEB-INF/views/inc/cs_menu.jsp" %>
        <!-- ※ 왼쪽 영역 끝 ※ -->

        <!-- ---------------------------------------------------------------------------- -->

        <!-- ※ 오른쪽 영역 시작 ※ -->


        <div style="width: 870px; height: auto; float: left; margin-left: 30px; vertical-align: middle;">

            <!-- 마이페이지 메뉴 헤더 들어가는 부분 -->
            <div style="height: 82px; border-bottom: 2px solid #08718E;">
                <div style="float: left;">
                    <h2 id="title">공지사항<span id="subtitle">새로운 소식들과 유용한 정보들을 한 곳에서 확인하세요.</span></h2>
                </div>
                
            </div>
            
            <!-- ---------------------------------------------------------------------------- -->

            <!-- 콘텐츠 영역 -->
            
            
            <%-- <form method="GET" action="/mh/customercenter.do" id="searchForm">
	                <div class="input-group search">
	                    <input type="text" class="form-control" placeholder="" aria-describedby="basic-addon2" name="search" id="search" required value="${search}">
	                    <span class="input-group-addon" id="basic-addon2" style="cursor:pointer;" onclick="$('#searchForm').submit();"><span class="glyphicon glyphicon-search"></span></span>
	                </div>
            </form> --%>
            

            <!-- 공지사항 테이블 -->
            <table id="tblNotice" class="table table-bordered"">
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성일</th>
                    <th>조회수</th>
                </tr>
                
                <c:if test="${not empty search and list.size() == 0}">
                    	<tr>
                    		<td colspan="5">검색 결과가 없습니다.</td>
                    	</tr>                    	
                    	</c:if>
                    	
                    	<c:if test="${empty search and list.size() == 0}">
                    	<tr>
                    		<td colspan="5">게시물이 없습니다.</td>
                    	</tr>                    	
                 </c:if>
                
                
                
                
                
                
                <c:forEach items="${list}" var="dto">
                
                <tr>
                    <td>${dto.seq}</td>
                    <td class="noticeTitle" id="notice3"><a href="/mh/user/customercenter/notice.do?seq=${dto.seq}">${dto.title}</a></td>
                    <td>${dto.regdate}</td>
                    <td id="count">${dto.readcount}</td>
                </tr>
                
                </c:forEach>
                <!-- <tr>
                    <td>2</td>
                    <td class="noticeTitle" id="notice2"><a href="#">마켓허리 배송 안내</a></td>
                    <td>2018.11.10</td>
                    <td>895</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td class="noticeTitle" id="notice1"><a href="">적립금 사용 관련 변경 공지</a></td>
                    <td>2018.05.19</td>
                    <td>21</td>
                </tr> -->
            
            </table>


			${pagebar}

            <!-- 페이지 바 -->
            <!-- <nav id="pagebar" class="pagebar" style="text-align: center; margin-top: 40px;">
                <ul class="pagination">
                  <li><a href="#">&laquo;</a></li>
                  <li><a href="#">&lsaquo;</a></li>
                  <li class="active"><a href="#" style="z-index: 0;">1</a></li>
                  <li><a href="#">&rsaquo;</a></li>
                  <li><a href="#">&raquo;</a></li>
                </ul>
            </nav> -->
                    

            <!-- 하단 검색 -->
                <div style="float: left; margin-top: 15px;">
                    <span>검색어</span>
                    <select class="form-control" id="selectYear" style="margin-left:10px; margin-right: 10px; display: inline-block;">
                        <option>선택</option>
                        <option>제목</option>
                        <option>내용</option>
                    </select>

                </div>

				<!-- <form method="GET" action="/mh/customercenter.do" id="searchForm"> -->
                <div id="search" style="margin-top: 15px; float:right;">
                    <input type="text" id="searchbox" value="" required value="${search}">
                    <span class="glyphicon glyphicon-search" id="searchimg" onclick="$('#searchForm').submit();"></span>
                </div>
				<!-- </form> -->


            <!-- ※ 오른쪽 영역 끝 ※ -->
            
	


        </div>
    </div>
            
<div style="clear: both;"></div>

<!-- footer -->
<%@include file="/WEB-INF/views/inc/footer.jsp" %>


<script>

function movePage() {
	//alert(event.srcElement.value);
	location.href = "/mh/user/customercenter/customercenter.do?page=" + event.srcElement.value;
}



$("#pagebar").val(${page});

</script>


<script src="/mh/js/main.js"></script>

</body>
</html>

