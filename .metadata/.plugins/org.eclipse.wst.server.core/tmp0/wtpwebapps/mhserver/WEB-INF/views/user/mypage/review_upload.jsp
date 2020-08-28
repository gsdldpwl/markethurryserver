<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/inc/header.jsp" %>
    
    <style>
        .MyRCPpart{
            /* 영역 사이즈 */
            margin: 15px 0px;
            width: 880px;
        }
        
        .rcpTitle {
            /* 분류 제목 */
            float: left;
            font-weight: bold;
            font-size: 16px;
        }
        
        #rcpTypeList {
            /* 요리분류 select box */
            margin-left: 50px;
            width: 130px;
            height: 26px;
        }
        
        #UserInputTitle, #itemTitle {
            /* 제목 입력 상자  */
            margin-left: 80px;
            width: 755px;
            height: 40px;
            resize: none;
            padding: 10px;
        }
        
        #UserInputsubstance {
            /* 내용 입력 상자 */
            margin-left: 80px;
            width:755px;
            height:500px;
            resize: none;
            padding: 10px;
        }

        #MaterialSubtitle {
            /* 재료선택 소제목 */
            font-weight: normal;
            font-size: 12px;
            color: #666666;
            width:110px;
        }
         .upload-file{
            /* 이미지, 재료선택파일 선택 버튼 */
            margin-left: 113px;
            width: 250px;
        }

        #mypagetwobtn {
            /* 버튼을 감싸고 있는 틀 */
            width: 350px;
            height: 50px;
            margin-top: 80px;
            margin-left: 350px;
            
        }
        .btnInputBorad {
            /* 작성취소 작성완료 버튼 */
            width: 100px;
            height: 45px;
            font-weight: bold;
            font-size: 16px;
            outline:none;
        }

        #CancleInput {
            /* 작성취소 버튼 */
            background-color: white;
            color: #08718e;
            border: 1px solid #08718e;
        }

        #SuccessInput {
            /* 작성완료 버튼 */
            margin-left:30px;
            background-color: #08718e;
            color: white;
            border:none;
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
            <!-- 상품 후기 작성 -->
            
            <div style="clear: both; height: 70px; font-size: 0.85em; letter-spacing: -0.5px; border-bottom: 2px solid #08718E; padding-bottom: 10px;">
                <b>후기 작성시 후기당 50 마일리지를 적립해드립니다.</b>
                <br>
                - 주간 베스트 후기로 선정될 시 <b>5,000</b> 마일리지를 추가로 적립해드립니다.
                <br>
                * 후기 작성은 배송 완료일로부터 <b>30</b>일 이내 가능합니다.
            </div>

			<form method="POST" action="/mh/user/mypage/review_uploadok.do">
           
	            <!-- select button -->
	            <div class="MyRCPpart" style="margin-top: 40px;">
	                <div class="rcpTitle">상품</div>
	                <input type="text" id="itemTitle" class="UserInputRCP" value="${productname}" readonly>
	            </div>
	
	            <div class="MyRCPpart">
	                <div class="rcpTitle">제목</div>
	                <input type="text" id="UserInputTitle" name="UserInputTitle" class="UserInputRCP" required>
	            </div>
	
	            
	            <div class="rcpTitle">내용</div>
	            <textarea id="UserInputsubstance" name="UserInputsubstance" class="UserInputRCP" required></textarea>
	            
	            <div class="MyRCPpart">
	                <div class="filebox preview-image"> 
	                    <div class="rcpTitle">이미지 선택</div>
	                    <input type="file" value="이미지추가하기" class="upload-file" name="upload-file">
	                </div>
	            </div>
	
	            <div id="mypagetwobtn">
	                <button type="button" class="btnInputBorad" id="CancleInput" onclick="location.href='/mh/user/mypage/review.do';">작성취소</button>
	                <button type="submit" class="btnInputBorad" id="SuccessInput">작성완료</button>
	            </div>
    		
    			<input type="hidden" name="odseq" value="${orderdetailseq}">
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
	$("#goMyReview").addClass("nowPage");


     //작성취소 버튼 누를 시 초기화
     $("#CancleInput").on("click",function() {
     	$('.UserInputRCP').val('');
     });


    </script>
    <script src="/mh/js/main.js"></script>

</body>
</html>