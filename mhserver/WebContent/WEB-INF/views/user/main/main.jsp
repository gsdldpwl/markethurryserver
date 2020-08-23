<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓허리 :: 오늘의 장보기</title>

<style>

/* 메인 배너 */
#mainbanner {
	width: 1920px;
	margin: 0px auto;
	margin-top: 0px;
}

#bannerImg {
	height: 370px;
	display: block;
	background-image: url("/mh/images/bannersample1.png"); 
	background-color:"red";
	background-repeat: no-repeat;
	transition: all 1s;
	position: relative;
	left: 5px;
}

/* list title */
.title {
	width: 1100px;
	height: 50px;
	margin: 0px auto;
	text-align: center;
	margin-top: 80px;
}

.title>h3>span {
	background-image: url("/mh/images/arrow.png");
	background-repeat: no-repeat;
	background-position: right;
	padding: 0px 30px;
}

/* content */
.content {
	width: 1100px;
	height: 400px;
	margin: 0px auto;
	overflow: hidden;
}

.content>ul {
	width: 2320px;
}

.content>ul>li {
	float: left;
	width: 250.3px;
	margin-right: 33px;
	list-style: none;
	transform: translate(-40px, 0px);
	position: relative;
}

.content>ul>li:nth-child(4) {
	margin-right: 0px;
}

.info {
	display: inline-block;
	width: 250px;
	margin: 10px auto;
	height: 100px;
}

.info>span {
	display: block;
	padding: 3px 3px;
}

.productimg {
	width: 250px;
	height: 280px;
}

.btndiv>.prev {
	display: inline-block;
	width: 60px;
	height: 60px;
	background: url("/mh/images/prevbtn.png");
	border: 0px;
	opacity: 0;
	outline: none;
	position: relative;
	left: 365px;
	top: -290px;
}

.btndiv>.next {
	display: inline-block;
	width: 60px;
	height: 60px;
	background: url("/mh/images/nextbtn.png");
	border: 0px;
	outline: none;
	position: relative;
	left: 1410px;
	top: -290px;
}

.desc {
	max-height: 58px;
    font-weight: 700;
    font-size: 13px;
    color: #666;
    display: block;
}
.recomCategory {
	display: inline-block;
	height: 40px;
	padding: 9px 20px 0 19px;
	border: 1px solid #f7f7f6;
	border-radius: 20px;
	background-color: #f7f7f7;
	font-size: 14px;
	line-height: 18px;
	font-weight: bold;
	cursor: pointer;
}
</style>
</head>
<%@include file="/WEB-INF/views/inc/header.jsp"%>
<body>
	<!-- content -->
	<div id="mainbanner">
		<a href="/mh/user/event/event.do" id="bannerImg"></a>
	</div>

	<!-- 오늘의 인기상품 -->
	<div class="title">
		<h3>
			<span><a href="#">오늘의 인기 상품</a></span>
		</h3>
	</div>
	
	<div class="content" id="ctn1">
		<ul>
			<c:forEach items="${todayhotlist}" var="dto">
			<li>
			<img src="${dto.img}" alt="${dto.name}" class="productimg" onclick="location.href='/mh/user/product/productdetail.do?seq=${dto.seq}';" >
				<div class="info">
					<span class="name">${dto.name}</span> <span class="price">${dto.price}원</span> <span class="desc">${dto.shortdesc }</span>
				</div></li>
			</c:forEach>
		</ul>
	</div>
	<div class="btndiv" id="btn1">
		<input type="button" class="prev"><input type="button"
			class="next">
	</div>

	<!-- 오늘의 HOT 상품 -->
	<div class="title">
		<h3>
			<span><a href="#">HOT 상품</a></span>
		</h3>
	</div>
	<div class="content" id="ctn2">
		<ul>
			<c:forEach items="${hotlist}" var="dto">
			<li>
			<img src="${dto.img}" alt="${dto.name}" class="productimg" onclick="location.href='/mh/user/product/productdetail.do?seq=${dto.seq}';">
				<div class="info">
					<span class="name">${dto.name}</span> <span class="price">${dto.price}원</span> <span class="desc">${dto.shortdesc }</span>
				</div></li>
			</c:forEach>
		</ul>
	</div>
	<div class="btndiv" id="btn2">
		<input type="button" class="prev"><input type="button"
			class="next">
	</div>


	<!-- 알뜰 상품 -->
	<div class="title">
		<h3>
			<span><a href="#">알뜰 상품</a></span>
		</h3>
	</div>
	<div class="content" id="ctn3">
		<ul>
			<c:forEach items="${saleslist}" var="dto">
			<li>
			<img src="${dto.img}" alt="${dto.name}" class="productimg" onclick="location.href='/mh/user/product/productdetail.do?seq=${dto.seq}';">
				<div class="info">
					<span class="name">${dto.name}</span> <span class="price">${dto.price}원</span> <span class="desc">${dto.shortdesc}</span>
				</div></li>
			</c:forEach>
		</ul>
	</div>
	<div class="btndiv" id="btn3">
		<input type="button" class="prev"><input type="button"
			class="next">
	</div>

	<!-- 이달의 이벤트 -->
	<div class="title">
		<h3>
			<span><a href="#">이벤트 소식</a></span>
		</h3>
	</div>
	<div  style="width:1100px; margin:10px auto" id="ctn4">
		<c:forEach items="${eventlist }" var="dto">
			<div class="eventdto">
				<img src="${dto.img }"  style="width:1100px; margin-bottom: 20px;">
			</div>
		
		</c:forEach>
	</div>
	

	<!-- 마켓허리의 추천 -->
	<div id="recomCategoryDiv" style="width: 1100px; margin: 0px auto;">
		<div class="title">
			<h3>
				<span><a href="#">Markey Hurry의 추천</a></span>
			</h3>
		</div>
		<div id="categoryList"
			style="width: 1100px; margin: 0px auto; margin-bottom: 30px; text-align: center;">
			<a style="color: black" class="recomCategory">채소</a> 
			<a style="color: black" class="recomCategory">과일</a> 
			<a style="color: black" class="recomCategory">육류</a> 
			<a style="color: black" class="recomCategory">수산</a> 
			<a style="color: black" class="recomCategory">가공식품</a>
			<a style="color: black" class="recomCategory">양념,소스</a> 
			<a style="color: black" class="recomCategory">유제품</a> 
			<a style="color: black" class="recomCategory">건강식품</a> 
			<a style="color: black" class="recomCategory">음료</a>
		</div>
		<div class="content" id="ctn3">
		<ul id="recommendlist">
			<c:forEach items="${recommendList}" var="dto">
			<li>
			<img src="${dto.img}" alt="${dto.name}" class="productimg" onclick="location.href='/mh/user/product/productdetail.do?seq=${dto.seq}';">
				<div class="info">
					<span class="name">${dto.name}</span> <span class="price">${dto.price}원</span> <span class="desc">${dto.shortdesc }</span>
				</div>
			</li>
			</c:forEach>
		</ul>
	</div>
		
	</div>


	<div id="deliveryImg"
		style="width: 1100px; margin: 0px auto; margin-top: 200px;">
		<img src="/mh/images/setstar.png"
			style="width: 1100px; transform: scale(1.0);">
	</div>

	<!-- footer -->
	 <a href="#" id="topbtn" style="border: 0px; outline: none;"></a>
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>\
	
	<script>
		
	
		$(".recomCategory").click(function(){
			var category = $(this).text();
			
			if(category == "채소"){ category=0}
			else if(category == "과일"){category=1}
			else if(category == "육류"){category=2}
			else if(category == "수산"){category=3}
			else if(category == "가공식품"){category=4}
			else if(category == "양념,소스"){category=5}
			else if(category == "유제품"){category=6}
			else if(category == "건강식품"){category=7}
			else if(category == "음료"){category=8}
			
			if(category > -1){
				$("#recommendlist").html("");
				$.ajax({
					type:"GET",
					url:"/mh/user/main/recommendlist.do",
					data:"category="+category,
					dataType:"json",
					success: function(result){
						$(result).each(function(index, item){
							
							$("#recommendlist").append(
								"<li>"+
								"<img src=" + item.img +" alt="+ item.name + " class=productimg onclick=\"location.href='/mh/user/product/productdetail.do?seq="+item.seq+"	'\";>"  +
								"<div class='info'>" +
								"<span class='name'>" + item.name + "</span> <span class='price'>" + item.price + "원</span>" + "<span class='desc'>"+ item.shortdesc + "</span>" + 
								"</div>"
							);
						});
					},
					error: function(a,b,c){
						console.log(a,b,c);
					}
				});
			}
			
			
		})
		
		
		function numberWithCommas(x) {
	        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
        // main banner auto change
        var num = 0;
        var timer = setInterval(function () {
            if (num == 4) {
                num = 0;
            }
     
            $("#bannerImg").css("background-image", "url('/mh/images/bannersample"+num+".png')");
            num++;	
        }, 2000);

        //img slider
        $("#btn1 > .next").click(function(){
            $("#ctn1 > ul > li").css({
                transform: "translate(-1140px,0)",
                transition: "all .7s"
            })
            $("#btn1 > .prev").css({ opacity: 1 })
            $("#btn1 > .next").css({  opacity: 0 })
        })
        $("#btn1 > .prev").click(function(){
            $("#ctn1 > ul > li").css({
                transform: "translate(-40px,0px)",
                transition: "all .7s"
            })
            $("#btn1 > .next").css({ opacity: 1 })
            $("#btn1 > .prev").css({ opacity: 0 })
        })
        $("#btn2 > .next").click(function(){
            $("#ctn2 > ul > li").css({
                transform: "translate(-1140px,0)",
                transition: "all .7s"
            })
            $("#btn2 > .prev").css({ opacity: 1 })
            $("#btn2 > .next").css({  opacity: 0 })
        })
        $("#btn2 > .prev").click(function(){
            $("#ctn2 > ul > li").css({
                transform: "translate(-40px,0px)",
                transition: "all .7s"
            })
            $("#btn2 > .next").css({ opacity: 1 })
            $("#btn2 > .prev").css({ opacity: 0 })
        })
        $("#btn3 > .next").click(function(){
            $("#ctn3 > ul > li").css({
                transform: "translate(-1140px,0)",
                transition: "all .7s"
            })
            $("#btn3 > .prev").css({ opacity: 1 })
            $("#btn3 > .next").css({  opacity: 0 })
        })
        $("#btn3 > .prev").click(function(){
            $("#ctn3 > ul > li").css({
                transform: "translate(-40px,0px)",
                transition: "all .7s"
            })
            $("#btn3 > .next").css({ opacity: 1 })
            $("#btn3 > .prev").css({ opacity: 0 })
        })
       
        

        // 카테고리 마우스 올라가면 색깔 변화
        $(".recomCategory").mouseover(function(){
            $(this).css("color","#346C7C");
        })
        $(".recomCategory").mouseout(function(){
            $(this).css("color","black");
        })
        $(".recomCategory").click(function(){
            var category = $(this).text();
            // 여기서 if문 걸어서 각 카테고리에 맞는 사진들을 넣어주면 됩니다.
            $(this).parent().parent().find(".content").find(".hotlistli > a > img").each(function(index, item){
                // 여기서 각각의 이미지를 설정하고 싶은데 어떻게 해야 할까요?
                $(this).attr("src","/mh/images/bannersample"+(index+1)+".png");
            }) 
                
        }) 

        // 이미지 위에 마우스가 올라가면 이미지 커지게
        $("img").mouseover(function(){
            $(this).css({
                "transform": "scale(1.02)",
                "transition": "all .3s ease-in-out"
            })
        })

        $("img").mouseout(function(){
            $(this).css({
                "transform": "scale(1)",
                "transition": "all .3s ease-in-out"
            })
        })
        
    </script>
	<script src="/mh/js/main.js"></script>
</body>
</html>