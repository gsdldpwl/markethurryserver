<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MarketHurry :: 내레시피</title>
<%@include file="/WEB-INF/views/inc/header.jsp"%>
<style>
/* '나만의 레시피 올리기' 버튼*/
	#ButtonUplode {
		margin: 30px auto;
		height: 50px;
		width: 1100px;
		/* border: 1px solid black; */
	}
	
	#MyRecipebtn {
		border: 1px solid #08718e;
		background-color: white;
		color: #08718e;
		font-weight: bold;
		width: 148px;
		height: 40px;
		float: right;
		display: block;
		box-shadow: none;
		outline: none;
	}
	
	fieldset {
		/* best상자 */
		display: block;
		margin: 15px auto;
		width: 1100px;
		height: 400px;
		border: 3px solid #ccc;
	}
	
	fieldset legend {
		/* best 글자*/
		font-size: 2em;
		color: #08718E;
		text-align: center;
		font-weight: bold;
		border: none;
		width: 400px;
	}
		
	.bestimg {
		/* 모든 음식 사진 */
		margin-top: 20px;
		width: 260px;
		height: 200px;
	}
	
	#bestimgset1 {
		/*best 상자 그림*/
		float: left;
		margin-left: 80px;
	}

	.foodType {
		/* best 상자 : 음식 타입 (ex) 한식/중식등)*/
		color: #666666;
		margin-top: 5px;
		font-size: 10px;
	}
	
	.bestContents {
		/* best 상자 : 이미지 제목 */
		font-weight: bold;
		font-size: 15px;
	}
	
	.rcpid {
		/* best 상자 : 사용자 id */
		margin-top: 25px;
		font-size: 10px;
		color: #666666;
	}
	
	.viewNum {
		/* best 상자 : 조회수 */
		color: #666666;
		font-size: 10px;
		float: right;
	}
	
	#rcpUserimg {
		display: blcok; 
		border: 0px;
		width: 1100px;
		min-height: 500px;
		margin: 0px auto;
	}
	
	.nomalRcpimg {
		/* 음식 내용 전체  */
		display: block;
		float: left;
		margin-right: 45px;
		margin-left: 50px; 
	}

	#paging {
		/*페이지*/
		margin-top : 100px;
		margin: 0px auto;
		width: 1100px;
		text-align:center;
	}


	
</style>
</head>
<body>

	<!-- 소진영역 -->

	<!-- '나만의 레시피 올리기' 버튼  -->
	<div id="ButtonUplode">

		<button id="MyRecipebtn" name="MyRecipebtn" onclick="location.href='/mh/user/mypage/myrecipe_upload.do';">나만의 레시피 올리기</button>
	</div>
	<!-- best 상자 -->
	<fieldset>
		<legend>Market Hurry Best Recipe</legend>
		<div>
		<c:forEach items="${bestList }" var="dto">
			<div id="bestimgset1">
				<a href="/mh/user/myrecipe/myrecipedetail.do?seq=${dto.seq}">
					<img src="/mh/images/${dto.img}" class="bestimg" id="bestimg1" />
				</a>
				<div class="foodType">${dto.category}</div>
				<a href="/mh/user/myrecipe/myrecipedetail.do?seq=${dto.seq}">
					<div class="bestContents">${dto.title}</div>
				</a>
				<div class="rcpid">${dto.memberID}</div>
				<div class="viewNum">조회수 : ${dto.readCount}</div>
			</div>
			</c:forEach>
		</div>
	</fieldset>

		<div id="rcpUserimg">
	<c:forEach items="${list }" var="dto">
			<div class="nomalRcpimg">
				<a href="/mh/user/myrecipe/myrecipedetail.do?seq=${dto.seq}"> <img src="/mh/images/${dto.img}" class="bestimg" /></a>
				<div class="foodType">${dto.category}</div>
				<a href="/mh/user/myrecipe/myrecipedetail.do?seq=${dto.seq}">
						<div class="bestContents">${dto.title}</div>
				</a>
				<div class="rcpid">${dto.memberID}</div>
				<div class="viewNum">조회수 : ${dto.readCount}</div>
			</div>
		</c:forEach>
		</div>


	<!-- 페이징 -->
	 <div id="paging" style="clear:both;">${pagebar}</div> 

	<!-- footer -->
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>

	<script>
	
		$(".bestimg").on({
		    mouseenter: function () {
		        $(this).css("opacity", ".3");
		    },
		    mouseleave: function () {
		        $(this).css("opacity", "1");
		    },
		});


</script>
</body>
</html>