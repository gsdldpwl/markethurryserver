<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마켓허리 관리자 :: 이벤트 답변 등록</title>

<link rel="stylesheet" href="/mh/css/bootstrap.css">

<script src="/mh/js/jquery-1.12.4.js"></script>
<script src="/mh/js/bootstrap.js"></script>

<style>
#popTitle {
	padding: 5px;
	margin-left: 30px;
	width: 700px;
	border-bottom: 2px solid teal;
}

.popBody {
	width: 700px;
	padding-top: 20px;
	/* border: 1px solid #999; */
	margin-left: 30px;
}

.popMain {
	font-family: "Noto Sans KR",  sans-serif;
	font-size: 1.5em;
	font-weight: 700;
	color: #444444;
	padding-bottom: 10px;
}

#popupTable th {
	width: 130px;
	text-align: center;
}

#popupTable .popSelect {
	width: 80px;
	text-align-last: center;
	height: 25px;
}

#popupTable .txtpop {
	width: 450px;
	height: 25px;
}

#popupTable .txtcontent {
	width: 450px;
	height: 400px;
	resize: none;
}

.popBtn button {
	width: 80px;
	height: 30px;
	background-color: teal;
	border: none;
	color: white;
	text-align: center;
	border-radius: 3px;
}

.popBtn {
	text-align: center;
}
#searchordernum {
	display: none;
	width: 558px;
	margin: 0px auto;
	border: 1px solid #08718E;
	border-radius: 3px;
	background-color: white;
	padding: 5px 5px
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
	margin-right: 170px;
}

#ordernumCol>span:nth-child(3) {
	margin-right: 130px;
}

#ordernumCol>span:nth-child(4) {
	margin-right: 17px;
}

#ordernumCol>span:nth-child(5) {
	margin-right: 24px;
}

.ordernumList>span {
	display: inline-block;
	text-align: left;
}

.oNum {
	width: 50px;
}

.oDate {
	width: 80px;
	margin-left: 10px;
}

.oName {
	width: 350px;
}

.oQty {
	width: 30px;
}

.oPrice {
	width: 85px;
}

.oCheck {
	width: 20px;
	margin-left: 12px;
}
</style>
</head>
<body>
	<!-- <body> -->
	<div class="popBody">

		<div class="popMain">주문내역 조회</div>
		<div class="popTb">
			<table class="table table-bordered" id="popupTable">
				<tbody>
					<tr>
					<td>
						<div id="ordernumCol">
							<span>상품번호</span> <span>주문일자</span> <span>상품명</span> <span>수량</span>
							<span>주문금액</span> <span>선택</span>
						</div>
					</td>
					</tr>
					<c:forEach items="${list }" var="dto">
					<tr>
						<td>
						<div class="ordernumListbox">
                             <div class="ordernumList">
                                 <span class="oNum" name="orderseq" id="orderseq">${dto.seq }</span>
                                 <span class="oDate">${dto.regdate }</span>
                                 <span class="oName">${dto.pname }</span>
                                 <span class="oQty">${dto.qty }</span>
                                 <span class="oPrice">${dto.price }원</span>
                                 <span class="oCheck"><input type="checkbox"></span>
                             </div>
                        </div>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="popBtn">
				<span class="popInBtn">
					<button id="poprego">등록</button>
				</span> <span>
					<button id="popClos">닫기</button>
				</span>
			</div>
		</div>
	</div>
	<script>
	  var select_obj = '';
	  
	    $('input[type="checkbox"]:checked').each(function (index) {
	        if (index != 0) {
	            select_obj += ', ';
	        }
	        select_obj += $(this).val();
	    });
	    
	$("#poprego").click(function(){
		var seq;
		$('input[type="checkbox"]:checked').each(function (index) {
	        seq = $(this).parent().parent()
	        .find('.oNum').text();
	    });
		
		opener.jusoCallBack(seq);
		window.close();
	});
	
	$("#popClos").click(function(){
		window.close();
	});
	
	$(function() { 
	  	$('input[type="checkbox"]').bind('click',function() {
	    $('input[type="checkbox"]').not(this).prop("checked", false);
  		})
  	});
	
	</script>
</body>

</html>