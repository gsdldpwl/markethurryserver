<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/inc/header.jsp"%>
<style>
#tblList {
	width: 870px;
	border-collapse: collapse;
}

#tblList th, #tblList td {
	border-bottom: 1px solid #999;
	text-align: center;
}

#tblList td {
	padding: 20px 0px 20px 0px;
}

#tblList td:nth-child(1) {
	width: 30px;
}

#tblList td:nth-child(2) {
	width: 130px;
}

#tblList td:nth-child(3) {
	text-align: left;
	padding-left: 30px;
}

#tblList td:nth-child(4) {
	width: 130px;
}

#tblList th:nth-child(1) {
	width: 30px;
}

#tblList th:nth-child(2) {
	width: 710px;
}

#tblList th:nth-child(3) {
	width: 130px;
}

.no_data {
            list-style: none;
            text-align: center;
            padding-top: 85px !important;
            padding-bottom: 85px !important;
}

.label_check {
	margin: 0px;
}

.ckbox {
	width: 15px;
	height: 15px;
	border: 1px solid #bbb;
	background: white;
}

.itemImg {
	width: 100px;
	height: 100px;
}

.goModify, .deleteList {
	display: block;
	width: 120px;
	height: 30px;
	border: 1px solid #08718E;
	background-color: white;
	color: #08718E;
	margin: 5px auto;
}

#goNewRecipe {
	display: block;
	float: right;
	width: 140px;
	height: 40px;
	border: 1px solid #08718E;
	background-color: #08718E;
	color: white;
	margin: 30px 0px;
}

#deleteAllList {
	display: block;
	float: right;
	width: 140px;
	height: 40px;
	border: 1px solid #08718E;
	background-color: white;
	color: #08718E;
	margin: 30px 10px;
}

.recipetitle {
	font-size: 1.1em;
	font-weight: bold;
}

.recipecategory {
	font-size: 0.9em;
}

/* 모달 관련 css */
a.button {
	display: inline-block;
	padding: 10px 20px;
	text-decoration: none;
	color: #fff;
	background: #000;
	margin: 20px;
}

#modal {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.3);
	z-index: 1;
}

.modal_common {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 500px;
	height: 300px;
	background: #fff;
	z-index: 2;
}

.modal_common .title {
	font-size: 14px;
	padding: 20px 0px;
	background: white;
	border-bottom: 2px solid black;
	margin: 10px 40px;
	color: #08718E;
	font-weight: bold;
}

.modal_common .con {
	font-size: 14px;
	height: 130px;
	line-height: 70px;
	padding: 30px 40px;
	text-align: center;
}

.modal_common .close {
	display: block;
	position: absolute;
	width: 30px;
	height: 30px;
	text-align: center;
	line-height: 30px;
	text-decoration: none;
	color: #000;
	font-size: 25px;
	font-weight: bold;
	right: 30px;
	top: 20px;
}

.modal_common>div:last-child {
	background-color: #f5f5f5;
	height: 88px;
}

.yes, .cancel, .yesDelete {
	display: block;
	float: left;
	background-color: #08718E;
	color: white;
	border: none;
	width: 150px;
	height: 40px;
	padding: 0px;
	margin: 24px 10px;
}

.yes {
	margin-left: 175px;
}

.cancel {
	margin-left: 90px;
}

.yesDelete {
	margin-right: 90px;
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
		<%@include file="/WEB-INF/views/inc/mypage_menu.jsp"%>
		<!-- ※ 왼쪽 영역 끝 ※ -->

		<!-- ---------------------------------------------------------------------------- -->

		<!-- ※ 오른쪽 영역 시작 ※ -->

		<div
			style="width: 870px; height: auto; float: left; margin-left: 30px; vertical-align: middle;">


			<!-- 마이페이지 메뉴 헤더 들어가는 부분 -->
			<div style="height: 82px; border-bottom: 2px solid #08718E;">
				<div style="float: left;">
					<h2 id="title">
						내 레시피<span id="subtitle">내가 등록한 레시피의 목록입니다.</span>
					</h2>
				</div>
			</div>

			<!-- ---------------------------------------------------------------------------- -->

			<!-- 콘텐츠 영역 -->

			<table id="tblList">
				<tr style="height: 40px;">
					<th><label style="margin: 0px;"> <input
							type="checkbox" id="checkAll" class="ckbox">
					</label></th>
					<th colspan="2">목록</th>
					<th>선택</th>
				</tr>
				<tbody>
					<c:if test="${myrecipelist.size() < 1}">
						<tr>
							<td class="no_data" colspan="4">작성한 내 레시피가 없습니다.</td>
						</tr>
					</c:if>

					<c:if test="${myrecipelist.size() >= 1}">
						<c:forEach items="${myrecipelist}" var="rlist">

							<tr>
								<td><label class="label_check"> <input
										type="checkbox" class="ckbox recipelist" name="recipelist">
								</label></td>
								<td><a href="/mh/user/myrecipe/myrecipedetail.do?seq=${rlist.seq}"><img src="/mh/images/${rlist.img}" class="itemImg"></a></td>
								<td>
								<a href="/mh/user/myrecipe/myrecipedetail.do?seq=${rlist.seq}">
									<div class="recipetitle">${rlist.title}</div></a>
									<div class="recipecategory">${rlist.category}</div>
								</td>
								<td>
								<a href="/mh/user/mypage/myrecipe_edit.do?seq=${rlist.seq }">
								<input type="button" class="goModify" value="수정하기"></a>	
									<a href="/mh/user/mypage/myrecipe_deleteok.do?seq=${rlist.seq }">
									<input type="button" class="deleteList" value="삭제하기"></a></td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>

			<div style="height: 100px;">
				<input type="button" id="goNewRecipe" value="새 레시피 작성하기"> 
				<input type="button" id="deleteAllList" value="삭제하기">
			</div>

			<!-- 선택하지 않고 삭제하기를 눌렀을 경우 나오는 팝업창 -->
			<div id="modal"></div>
			<div class="modal_common noSelect">
				<a href="javascript:;" class="close">X</a>
				<p class="title">알림메세지</p>
				<div class="con">선택한 사항이 없습니다.</div>
				<div>
					<input type="button" value="확인" href="javascript:;" class="yes">
				</div>
			</div>

			<!-- 정말 삭제할 것인지 다시 물어보기 -->
			<div id="modal"></div>
			<div class="modal_common reallyDelete">
				<a href="javascript:;" class="close">X</a>
				<p class="title">알림메세지</p>
				<div class="con">내 레시피를 정말로 삭제하시겠습니까?</div>
				<div>
					<input type="button" value="취소" href="javascript:;" class="cancel">
					<input type="button" value="확인" href="javascript:;"
						class="yesDelete" >
				</div>
			</div>


			<!-- ※ 오른쪽 영역 끝 ※ -->

		</div>
		<div style="clear: both;"></div>
	</div>


	<!-- footer -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>


	<!-- script start -->
	<script>

	$("#MyMenu > div").removeClass("nowPage");
	$("#goMyRecipe").addClass("nowPage");
    
        // 전체 선택시 모든 찜 목록 체크됨.
        $("#checkAll").click(function() {
            var chk = $(this).is(":checked");
            if (chk) {
                $(".recipelist").prop('checked', true);
            } else {
                $(".recipelist").prop('checked', false);
            }
        });

        // 수정하기 선택시
        $(".goModify").click(function() {
            
            // 해당 글 수정 페이지로 이동
        	location.href='/mh/user/mypage/myrecipe_edit.do';
        	
        })

        // 새 레시피 작성하기 클릭시
        $("#goNewRecipe").click(function() {

            // 새 레시피 작성 페이지로 넘어가기.
        	location.href='/mh/user/mypage/myrecipe_upload.do';
        });
        
        // 삭제 선택시
        // 처음부터 있는 경우는 되는데 나중에 태그를 추가시에는 이 버튼 작동하지 않음 ㅠㅜ
        $(".deleteList").click(function() {
           // $(this).parent().parent().remove();
            console.log($("#tblList").children().children().length);
            if ($("#tblList").children().children().length == 1) {
                $("#tblList tbody:last-child").append(`<tr><td class="no_data" colspan="4">작성한 내 레시피가 없습니다.</td></tr>`);
            }
        });

        // 내 레시피 삭제하기
        $(".deleteList").click(function() {
            //openModal('reallyDelete');

            // // 하위 태그 전부 삭제
            // $("#tblList tbody:last-child *").remove();
            // // 찜 목록이 없다고 나타내주는 태그 추가
            // $("#tblList tbody:last-child").append(`<tr><td class="no_data" colspan="4">작성한 내 레시피가 없습니다.</td></tr>`);

        });
        
        // 내 레시피 삭제하기
        $("#deleteAllList").click(function() {

            // 체크박스에 체크된 것이 있는지 확인
            var chk = $(".recipelist").is(":checked");

            // 체크박스에 아무것도 없을 시에는 선택사항 없음 팝업창 뜨기
            if (!chk) { openModal('noSelect'); }
            // 체크박스 선택 시에는 삭제확인여부 팝업창이 뜨고,
            else {
                // 취소버튼 누르면 삭제X
                // 확인버튼 누르면 삭제O
                openModal('reallyDelete');
            }
            

            // // 하위 태그 전부 삭제
            // $("#tblList tbody:last-child *").remove();
            // // 찜 목록이 없다고 나타내주는 태그 추가
            // $("#tblList tbody:last-child").append(`<tr><td class="no_data" colspan="4">작성한 내 레시피가 없습니다.</td></tr>`);

        });
        
        $(".yesDelete").click (function() {
            $("input[name='recipelist']:checked").each(function() {
               //$(this).parent().parent().parent().remove();
                if ($("#tblList").children().children().length == 1) {
                    $("#tblList tbody:last-child").append(`<tr><td class="no_data" colspan="4">작성한 내 레시피가 없습니다.</td></tr>`);
                }
            });
        });

        // 모달 열기
        function openModal(modalname){
            document.get
            $("#modal").fadeIn(300);
            $("."+modalname).fadeIn(300);
        }

        $("#modal, .close, .yes, .cancel, .yesDelete").on('click',function(){
            $("#modal").fadeOut(300);
            $(".modal_common").fadeOut(300);
        });


        // 버튼 클릭은 서버 적용 후에 삭제해야하는 데이터임.
        // 내 레시피가 있는 경우
        $("#btnYesData").click(function() {

            // 하위 태그 전부 삭제
            $("#tblList tbody:last-child *").remove();

            // 내 레시피 태그 작성
            var contents = `<tr>
                        <td>
                            <label class="label_check">
                                <input type="checkbox" class="ckbox recipelist" name="recipelist">
                            </label>
                        </td>
                        <td><img src="" class="itemImg"></td>
                        <td>
                            <div>초보자도 쉽게 따라할 수 있어요!! 맛있는 궁중 떡볶이</div>
                            <div>한식</div>
                        </td>
                        <td>
                            <input type="button" class="goModify" value="수정하기">
                            <input type="button" class="deleteList" value="삭제하기">
                        </td>
                    </tr>`;

            // 태그 추가
            $("#tblList tbody:last-child").append(contents);

        });


    </script>
	<script src="/mh/js/main.js"></script>
</body>
</html>