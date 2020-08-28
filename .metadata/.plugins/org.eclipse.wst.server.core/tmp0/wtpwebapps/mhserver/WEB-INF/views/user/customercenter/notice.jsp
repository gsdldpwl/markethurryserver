<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        /* 공지사항 테이블 하단 보더 */
        #tblNotice tbody tr:last-child td{
            border-bottom: 1px solid #08718E;
        }

        #tblNotice tbody tr td {
            text-align: left;
        }

        /* 공지사항 내부 테이블 */
        #tblNoticeContent td, #tblNoticeContent th {
            border: 1px solid black !important;
            text-align: center !important;
            width: 150px;
        }

        /* 목록 버튼 */
        #list {
            background-color: #08718E; 
            width:100px; 
            height: 35px; 
            border: none; 
            color:white;
        }

    </style>


</head>

<body>

<!-- 마이페이지 컨텐츠 부분 -->
    <!-- 나중에 높이 바꾸기 -->
    <div style="width: 1100px; min-height: 550px; margin: 60px auto;">
        
        <!-- ---------------------------------------------------------------------------- -->

        <!-- ※ 오른쪽 영역 시작 ※ -->
        <div style="float: right;"><a href="#!">홈</a> > 고객센터 > <b>공지사항</b></div>

        <div style="width: 1100px; height: auto; float: left; vertical-align: middle; border-bottom: 2px solid #08718E;">

            <!-- 마이페이지 메뉴 헤더 들어가는 부분 -->
            <div style="height: 82px; border-bottom: 2px solid #08718E;">
                <div style="float: left;">
                    <h2 id="title">공지사항<span id="subtitle">새로운 소식들과 유용한 정보들을 한 곳에서 확인하세요.</span></h2>
                </div>
                
            </div>
            
            <!-- ---------------------------------------------------------------------------- -->

            <!-- 콘텐츠 영역 -->

            <!-- 공지사항 테이블 -->
            <table id="tblNotice" class="table table-bordered">
                <tr>
                    <th style="width: 20%;">제목</th>
                    <td colspan="3">${dto.title}</td>
                </tr>
                <tr>
                    <th>작성일</th>
                    <td style="width: 20%;">${dto.regdate}</td>
                    <th style="width: 20%;">조회수</th>
                    <td>${dto.readcount}</td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: left;">
                        <div style="min-height: 300px;">
                        ${dto.content}
                        </div>
                    </td>
                </tr>
            </table>
            <div style="float: right; margin: 20px 0px;">
                <input id="list" type="button" value="목록">
            </div>
                
            <!-- </div> -->


            <!-- ※ 오른쪽 영역 끝 ※ -->
           

        </div>
    </div>


<div style="clear: both;"></div>

<!-- footer -->
<%@include file="/WEB-INF/views/inc/footer.jsp" %>



<script>

        // 로고 클릭시 메인화면으로
        $("#brandlogo").click(function() {
            $(location).attr('href', '../../templates/main_template.html');
        });
        
        // 하이퍼링크 마우스 올리면 색 변화 (색은 나중에 변경)
        $(".hyperlink").mouseover(function(){
            // $(this).css("color","red"); // 색 변경 필요
        })

        $(".hyperlink").mouseout(function(){
            $(this).css("color","black"); // 색 변경 필요
        })

        // 세부 카테고리 아래로 내려오게 하는 부분 추가 필요
        $("#menubar > a").first().mouseenter(function(event){

        });

        // 검색창 클릭 시 value 초기화
        $("#searchbox").focus(function(){
            $(this).attr("value","");
        })


        // 신수진

        // ----------------------------------------------------------------------------
        // 좌측

        // $(".menulist").mouseover(function() { $(this).addClass("focusPage"); });
        // $(".menulist").mouseout(function() { $(this).removeClass("focusPage"); });

        // ----------------------------------------------------------------------------

        // 목록버튼 클릭시
        $("#list").click(function () {
            $(location).attr("href", "/mh/user/customercenter/customercenter.do");
        });


    </script>
    <script src="/mh/js/main.js"></script>



</body>
</html>