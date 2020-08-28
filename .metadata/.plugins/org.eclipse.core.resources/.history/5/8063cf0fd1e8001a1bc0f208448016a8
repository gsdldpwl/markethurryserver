<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/inc/header.jsp"%>
<link rel="stylesheet" href="/mh/css/customerCenter.css">
<link rel="stylesheet" href="/mh/css/modal.css">
<style>

/* ---------------------------------------------------------------------------- */

/* 공지사항 */
#tblNotice th, td {
	text-align: left;
}

.noticeTitle {
	text-align: left;
}

#tblNotice tbody tr:last-child td {
	border-bottom: 1px solid #08718E;
}

#btnAddQna {
	border-style: none;
	background-color: #08718E;
	border-radius: 3px;
	color: white;
	font-size: 15px;
	height: 40px;
	width: 100px;
}

#btnCancelQna {
	border-style: none;
	background-color: #eee;
	border-radius: 3px;
	color: #08718E;
	font-size: 15px;
	font-weight: bold;
	height: 40px;
	width: 100px;
}

#category {
	/* background-color: red; */
	width: 100px;
	height: 30px;
	border-radius: 3px;
	border: 1px solid #ccc;
}

#ordernumbox {
	display: inline-block;
	width: 180px;
	height: 30px;
	border-radius: 3px;
	outline: none;
	border: 1px solid #ccc;
}

#titlebox {
	width: 400px;
	height: 30px;
	border-radius: 3px;
	outline: none;
	border: 1px solid #ccc;
}

#inquiryDiv {
	width: 680px;
	height: 500px;
	margin: 10px auto;
}

#tblQna th, #tblQna td {
	font-size: 14px;
	/* text-align: center; */
	height: 30px;
}

#searchordernum {
	display: none;
	width: 558px;
	margin: 0px auto;
	border: 1px solid #08718E;
	border-radius: 3px;
	background-color: white;
	padding: 5px 5px
	position: absolute;
	left: 735px;
	top: 742px;
	z-index: 3;
}
#ordernummodal {
    display: inline-block;
    width: 100px;
    height: 30px;
    border-radius: 3px;
    outline: none;
    border: 1px solid #ccc;
    text-align: center;
    color: white;
    font-weight: bold;
    background-color: #08718E;
    cursor:pointer;
}

#ordernumMent {
	color: gray;
	font-weight: bold;
	margin-top: 5px;
}

#ordernumCol {
	background-color: #ccc;
	color: white;
	font-weight: bold;
	margin: 8px 0px;
}

#ordernumCol>span:nth-child(1) {
	margin-right: 25px;
}

#ordernumCol>span:nth-child(2) {
	margin-right: 113px;
}

#ordernumCol>span:nth-child(3) {
	margin-right: 90px;
}

#ordernumCol>span:nth-child(4) {
	margin-right: 15px;
}

#ordernumCol>span:nth-child(5) {
	margin-right: 24px;
}

.ordernumList>span {
	display: inline-block;
	text-align: center;
}

.oNum {
	width: 50px;
	text-align: center;
}

.oDate {
	width: 80px;
	margin-left: 10px;
	text-align: center;
}

.oName {
	width: 230px;
	text-align: center;
}

.oQty {
	width: 30px;
	text-align: center;
}

.oPrice {
	width: 85px;
	text-align: center;
}

.oCheck {
	width: 20px;
	text-align: center;
	margin-left: 12px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/inc/mypage_cinfo.jsp"%>
	<!-- 마이페이지 컨텐츠 부분 -->
	<div style="width: 1100px; min-height: 550px; margin: 60px auto;">

		<!-- ※ 왼쪽 영역 시작 ※ -->
		<div id="MyMenu" style="width: 200px; height: auto; float: left;">
			<div>고객 센터</div>
			<div id="goNotice" class="menulist ">
				<div>공지사항</div>
				<div class="arrow">></div>
			</div>
			<div id="goQnA" class="menulist nowPage">
				<div>1:1 문의</div>
				<div class="arrow">></div>
			</div>
			<div id="go1to1Q" class="qlist">
				<div>
					<div
						style="height: 0px; font-size: 0.95em; position: relative; top: -7px; font-weight: bold;">도움이
						필요하신가요?</div>
					<div
						style="height: 0px; font-size: 0.7em; position: relative; top: 8px;">1:1
						문의하기</div>
				</div>
				<div style="color: #08718E;">></div>
			</div>
		</div>
		<!-- ※ 왼쪽 영역 끝 ※ -->

		<!-- ---------------------------------------------------------------------------- -->

		<!-- ※ 오른쪽 영역 시작 ※ -->


		<!-- 마이페이지 메뉴 헤더 들어가는 부분 -->

		<div id="inquiryheader" style="width: 800px; height: 60px;">
			<span
				style="display: inline-block; font-size: 22px; font-weight: bold; color: #444444; margin-top: 30px; margin-left: 10px;">1:1
				문의 작성</span>
		</div>
		<form id="inquiryForm" method="POST" action="/mh/user/customercenter/onebyoneinquiryok.do">
			<div id="inquiryDiv">
				<table id="tblQna" class="table table-bordered" style="width: 890px; margin-top: 20px;">
					<tr>
					<th style="border-top: 2px solid #08718E">제목</th>
					<td style="border-top: 2px solid #08718E">
						<select id="category" name="category">
								<option value="배송지연">배송지연</option>
								<option value="교환문의">교환문의</option>
								<option value="환불문의">환불문의</option>
								<option value="취소문의">취소문의</option>
								<option value="기타문의">기타문의</option>
						</select> <input type="text" id="titlebox" name="title">
					</td>
					</tr>
					<tr>
						<th>주문번호</th>
						<td>
							<input type="text" class="form-control" id="ordernumbox" value="" name="orderseq" readonly> 
							<input type="text" class="form-control" id="ordernummodal" value="주문조회">
						</td>
					</tr>
					<tr>
						<th style="height: 350px;">내용</th>
						<td>
							<div class="divContent" style="height: 100%;">
								<textarea class="form-control" id="tblContent" name="content"
									style="height: 100%;" placeholder="내용을 입력해주세요."></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<th>첨부 사진</th>
						<td><input type="file" style="display: inline;"
							accept="image/*"> <!-- 오른쪽에 파일명 뜨는거.... --></td>
					</tr>
				</table>
			</div>
		</form>

		<!-- ※ 오른쪽 영역 끝 ※ -->
		<div style="text-align: center;">
			<input type="button" id="btnCancelQna" value="작성 취소"
				style="margin-right: 20px;"> <input type="button"
				id="btnAddQna" value="작성 완료">
		</div>
	</div>
	</div>

	<!-- modal  -->
	<div id="modal"></div>
	<div class="modal_common title">
		<a href="javascript:;" class="close">X</a>
		<p class="title">알림메세지</p>
		<div class="con">제목을 입력해주세요</div>
		<div>
			<input type="button" value="확인" href="javascript:;" class="yes">
		</div>
	</div>

	<div class="modal_common ordernum">
		<a href="javascript:;" class="close">X</a>
		<p class="title">알림메세지</p>
		<div class="con">주문번호를 입력해주세요</div>
		<div>
			<input type="button" value="확인" href="javascript:;" class="yes">
		</div>
	</div>

	<div class="modal_common content">
		<a href="javascript:;" class="close">X</a>
		<p class="title">알림메세지</p>
		<div class="con">내용을 입력해주세요</div>
		<div>
			<input type="button" value="확인" href="javascript:;" class="yes">
		</div>
	</div>

	<div class="modal_common complete">
		<a href="javascript:;" class="close">X</a>
		<p class="title">알림메세지</p>
		<div class="con">문의 작성이 완료되었습니다.</div>
		<div>
			<input type="button" value="확인" href="javascript:;" class="yes">
		</div>
	</div>
	<div style="clear: both;"></div>
	</div>


	<!-- footer -->
	<a href="#" id="topbtn" style="border: 0px; outline: none;"></a>
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
	<script>
		function jusoCallBack(seq){
			$("#ordernumbox").attr("value",seq);
			
		};
        // 신수진

        // ----------------------------------------------------------------------------
        // 마이페이지 기본 템플릿
        

        $(".menulist").mouseover(function() { $(this).addClass("focusPage"); });
        $(".menulist").mouseout(function() { $(this).removeClass("focusPage"); });

        // 작성 취소 - 상품상세 페이지로 이동
        $("#btnCancelQna").click(function() {
            $(location).attr('href', 'productDetail.html');
        });

        //작성 완료
        $("#btnAddQna").click(function() {
            // 위의 항목을 다 채웠는지 검사해야함
            if ($("#titlebox").val() == "") {
                openModal('title');
            } else if ($("#ordernumbox").val() == "") {
                openModal('ordernum');
            } else if($("#tblContent").val() == ""){
                openModal('content');
            }
            
            if($("#titlebox").val() != "" && $("#ordernumbox").val() != "" && $("#tblContent").val() != ""){
	            openModal('complete');
	            $("#inquiryForm").submit();
            }
	
            
            //상품상세의 상품문의에 추가되게끔
        });

        // search ordernum
        $("#ordernummodal").click(function(){
				
        	window.open("/mh/user/customercenter/orderlistpopup.do","pop","width=750,height=550, scrollbars=yes, resizable=yes");
            
        })

        // close btn
        $("#closebtn").click(function(){
            $("#searchordernum").css({
                "display":"none"
            })
        })

        // 주문목록 중 하나를 선택했을 때
        $(".oCheck > input").click(function(){
	            var checkedOrderNum = $(".oCheck > input:checked").parent().parent().children(".oNum").text();
        	
        	if($(this).is(":checked")){
	            // 주문번호란에 주문번호 값 출력
	            $("#ordernumbox").attr("value","");
	            $("#ordernumbox").attr("value",$(this).parent().parent().children(".oNum").text());
        	} else {
        		 $("#ordernumbox").attr("value","");
        	}
            
        })
        
        $(function(){
        	if(${not empty orderseq}){
        		$("#ordernumbox").val(${orderseq});
        		$("#ordernummodal").attr("disabled",true);
        		$("#ordernummodal").css("cursor","not-allowed");
        	} 
        });
        
    </script>
	<script src="/mh/js/main.js"></script>
	<script src="/mh/js/modal.js"></script>
</body>
</html>