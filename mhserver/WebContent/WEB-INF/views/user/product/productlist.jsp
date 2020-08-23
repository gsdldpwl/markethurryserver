<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마켓허리 :: 오늘의 장보기</title>

    <!-- main template -->
    <link rel="stylesheet" href="/mh/css/bootstrap.css">
    <link rel="stylesheet" href="/mh/css/markethurry.css">

    <script src="/mh/js/jquery-1.12.4.js"></script>
    <script src="/mh/js/bootstrap.js"></script>
    <script src="/mh/js/Backstretch.js"></script>
 
    
    <style>
        #smalltitle {
            width: 1100px;
            margin: 10px auto;
            font-weight: 600;
        }


        #smalltitle span {
            /* width: 100%; */
            position: relative;
            padding-left: 29px;
            color: teal;
        }


       #goodsList ul{
         list-style:none;
         margin: 0;
         padding: 0;
         }

         #goodsList li {
             margin: 0 0 0 0;
             padding: 30px 55px 0px 11px;
             border: 0;
             float: left;
         }

         #goodsList {
            width: 1100px;
            margin: 0px auto;
         }

        #goodsList .item {
            display: block;
            cursor: pointer;
            width: 300px;
            height: 500px;
            /* border: 1px solid tomato; */
        }

        #goodsList .item img {
            display: block;
            width: 300px;
            height: 400px;
            transition: all .5s ease-in-out;
            /* position: relative; */
        }

        #goodsList .item img:hover {
            transform: scale(1.02);
            transition: all .3s ease-in-out;
            /* 마우스 올리면 이미지 당겨지는 효과 주기 */

        }

        #goodsList button {
           display: block;
           width: 45px;
           height: 45px;
           position: relative;
           left: 250px;
           top: -50px;
           color: teal;
           /* background-color: transparent;  투명하게 만들기*/
           background-color: rgba(255, 255, 255, 0.5);  /* 배경만 살짝 투명하게 만들기*/
           border-radius: 50px;
           border: none;
           font-size: 1.5em;
          
        }

        #goodsList button:focus {outline:none;}


        #goodsList .info{
            /* display: block; */
            padding: 10px;
            /* border: 1px solid teal; */
            width: 300px;
            height: 100px;
            margin-top: 0px;
            position: relative;
            top: -45px;
        }

        #goodsList .name {
            overflow: hidden;
            max-height: 58px;
            font-weight: 700;
            font-size: 19px;
            color: black;
        }

        #goodsList .price {
            overflow: hidden;
            max-height: 58px;
            font-weight: 700;
            font-size: 17px;
            color: teal;
            display: block;
        }

        #goodsList .desc {
            overflow: hidden;
            max-height: 58px;
            font-weight: 700;
            font-size: 13px;
            color: #666;
            display: block;
        }


        /* 소메뉴 css */
        #titleselect > ul {
            list-style: none;
            font-size: 16px;
            margin-left: 0;
            padding: 0;
            /* position: absolute; */
        }


        #titleselect{
           padding-top : 10px;
            width: 100%;
            /* position: relative ; */
            /* left:100px ; */
            /* top: 100px; */
            position: absolute;
            left: 1350px;
            top: 330px;
            border: none;
            background-color: white;
            font-size: 12px;
            /* border: 1px solid teal; */
            cursor: pointer;
            /* float: right; */
            z-index: 8;
           
        }

        #titleselect > .nameselect {
           padding: 10px;
           margin: 20px auto;
           color: black;
         
        }
       

        #titleselect > ul > li > a {
             display: none;
            margin: 15px 0;
            margin-left: 10px;
            font-size: 12px;
            color: black;
        }

        #titleselect > ul > li > a.on, #titleselect > ul > li > a:hover{
           color: teal;
           font-weight: bold;
        }

       

        /* modal css */

        #modal-all {
        
            width: 100%;
        }

        .modal {
            width: 100%;
            margin: 0px auto;
            padding: 100PX;
        }

        .modal-header{
            border-bottom: none;
            /* padding: 25px 0 17px 30px; */
            padding-bottom: 0px;
        }
        

        .modal-dialog {
            width: 440px;
            height: auto;
        }
     

        .modal-title {
            font-size: 1.8em;
            font-weight: 500;
            color: black;
            /* padding: 20px; */
            padding: 20px 20px 0px 20px;
           
        }

       .modal-body .goodsname {
        display: block;
        padding-bottom: 12px;
        padding-left: 20px;
        border-bottom: 2px solid #333 ;
        font-size: 16px;
        }

        .modal-body .list{
            list-style: none;
            overflow: hidden;
            overflow-y: auto;
            width: 400px;
            height: 220px;
            /* padding: 0px; */
            padding: 10px 20px 0px 20px;
            
       }

       /* .modal-body .list .goods1 .adjust .goodsprice {
            margin-right: 200px;
           
       } */

       
       .modal-body .list .goods1 .adjust {
            /* margin-right: 200px; */
           
       }

      .goods1 .adjust {
           font-weight: 600;
           margin-top: 10px;
           }

        .modal-body .list .adjust button {
            overflow: hidden;
            /* position: absolute; */
            /* left: 200px; */
            /* float: left; */
            width: 22px;
            height: 22px;
            border: 0;
            background: #f6f7f7;
            line-height: 0;
           
        }

        .modal-body .list .adjust .geatsu {
            width: 41px;
            height: 24px;
            padding: 0 0 2px;
            border: 0;
            background-color: white;
            font-size: 14px;
            text-align: center;
            color: black;
        }

        .modal-body .list .goodsname2 {
            font-size: 14px;
        }

        .modal-body .pmBtn {
            float: right;
        }

        .sum .sumname {
            font-size: 15px;
            margin-left: 15px;
        }

        .sum .sumnum {
            margin-left: 220px;
            font-size: 27px;
        }

        .sum .won {
            font-size: 17px;
        }

        .save {
            margin-left: 216px;
            margin-top: 7px ;
        }
    
        .save .jukrip {
            width: 38px;
            height: 20px;
            margin-right: 2px;
            border: 1px solid #e8a828;
            border-radius: 10px;
            background-color: #ffbf00;
            font-weight: 700;
            font-size: 12px;
            color: #fff;
            line-height: 18px;
            text-align: center;
            vertical-align: 1px;
            display: inline-block;
          
        }

        .save .getpoint {
            font-size: 14px;
        }

       .modal-footer {
         overflow: hidden;
         padding:21px 0 30px;;
         width: 100%;
         text-align: center;
         border-top: none;
       }

       .modal-footer .cancle {
           width:185px ;
           height: 50px;
           color: teal;
           background-color: white;
           border: 1px solid teal;
           border-radius: 3px;
           
       }

       .modal-footer .basket {
           width:185px ;
           height: 50px;
           background-color: teal;
           border: 1px solid white;
           border-radius: 3px;
       }


       /* page bar */

       .pagebar{
           width: 100%;
           text-align: center;
           color: teal;
       }


       /* 장바구니에 담기 css */
       .inCart {
        display: none;
        /* display: block; */
        position: absolute;
        /* right: 40px; */
        left: 0px;
        top: 45px;
        width: 330px;
        height: 102px;
        border: 1px solid #ddd;
        background-color: #fff;
        /* opacity: 0; */
        z-index: 9999;
       }

       .gsInCart {
           padding: 20px;

       }

       .gsInCart img {
        float: left;
        width: 46px;
        height: 60px;
        margin: 0 auto;
        border: 0;
        max-width: 100%;
       }

       .gsInCart p {
        float: left;
        width: 240px;
        padding: 8px 0 0 20px;
        font-weight: 700;
        font-size: 14px;
        line-height: 21px;
       }

       .gsInCart .inTxt {
        display: block;
        overflow: hidden;
        width: 100%;
        color: #999;
        white-space: nowrap;
        text-overflow: ellipsis;
       }

       .gsInCart .inTxt2 {
        display: block;
        padding-top: 3px;
        color: #333;
       }




    </style>

</head>
<body>
<!-- user menu (register, login , as) -->
<div id="noticebar">
   <div id="noticeMent">
      <span class="eachNotice">[마켓허리] "허리라이프-어디든 간다! 마켓멀리! 신선하지 않은
         신선MD의 신선한 장미를 찾아서" 댓글이벤트 당첨 결과</span> <span class="eachNotice">[마켓허리]
         유튜브 ‘컬리라이프-일할 때도 쉴 때도 먹어야 한다, 극한직업 컬리 MD편’ 댓글 이벤트 당첨 공지</span> <span
         class="eachNotice">[마켓허리] 코로나19 확진자 관련 현황 및 대응조치 안내</span> <span
         class="eachNotice">[가격인상공지] [모어댄프레쉬] 맥돈 삼겹살 구이용 300g 외 23건
         (2020 5. 20 ~)</span> <span class="eachNotice">[마켓컬리] 개인정보처리방침 개정 내용
         사전안내</span>
   </div>
</div>


<header>
   <div id="usermenu">
      <c:if test="${empty dto.id }">
         <a href="/mh/user/main/register.do" class="hyperlink">회원가입</a>
         <a href="/mh/user/main/login.do" class="hyperlink">로그인</a>
         <a href="/mh/user/customercenter/customercenter.do" class="hyperlink">고객센터</a>
      </c:if>

      <c:if test="${not empty dto.id }">
         <a href="/mh/user/main/loginout.do" class="hyperlink">로그아웃</a>
         <a href="/mh/user/mypage/수진씨 여기에 서블릿 이름 넣어주세용.do" class="hyperlink">마이페이지</a>
         <a href="/mh/user/customercenter/customercenter.do" class="hyperlink">고객센터</a>
      </c:if>

   </div>
   <!-- 마켓허리 로고 -->
   <img src="/mh/images/brandlogo.png" alt="brandlogo" id="brandlogo" style="cursor:pointer"
      onclick="location.href='/mh/user/main/main.do';">
      
     
</header>



<!-- menu bar -->
<div id="menubar">
   <a class="hyperlink">전체 카테고리</a> 
   <a href="" class="hyperlink">HOT 상품</a> 
   <a href="" class="hyperlink">알뜰 상품</a> 
   <a href="/mh/user/myreceipe/myreceipi.do" class="hyperlink">나만의 레시피</a> 
   <a href="/mh/user/event/event.do" class="hyperlink">이달의 이벤트</a> 
   <input type="search" id="searchbox" value="검색내용을 입력해주세요." autocomplete="off"> 
   <span class="glyphicon glyphicon-search" id="searchimg"></span> 
   <a href="/mh/user/product/shoppingbasket.do" id="shoppingbox">
   <!-- 장바구니 넣었을때 뜨는 창 -->
   <%-- <c:forEach items="${list}" var="dto"> --%>
	<div class="inCart" id="inCart1">
    <div class="gsInCart">
        <img src="" class="inImg">
        <p class="cTxt">
            <span class="inTxt" ></span>
            <span class="inTxt2">장바구니에 담겼습니다.</span>
        </p>
    </div>
	</div>
<%-- </c:forEach> --%>
 </a>
   <div id="detailmenu">
      <ul style="list-style:none;" id="detailul">
         <li onclick="location.href='/mh/user/product/productlist.do?category=0';">채소</li>
         <li onclick="location.href='/mh/user/product/productlist.do?category=1';">과일</li>
         <li onclick="location.href='/mh/user/product/productlist.do?category=2';">육류</li>
         <li onclick="location.href='/mh/user/product/productlist.do?category=3';">수산</li>
         <li onclick="location.href='/mh/user/product/productlist.do?category=4';">가공식품</li>
         <li onclick="location.href='/mh/user/product/productlist.do?category=5';">양념, 소스</li>
         <li onclick="location.href='/mh/user/product/productlist.do?category=6';">유제품</li>
         <li onclick="location.href='/mh/user/product/productlist.do?category=7';">건강 식품</li>
         <li onclick="location.href='/mh/user/product/productlist.do?category=8';">음료</li>
      </ul>
   </div>
</div>
<div id="menubartp">

   <a class="hyperlink">전체 카테고리</a> 
   <a href="" class="hyperlink">HOT 상품</a> 
   <a href="" class="hyperlink">알뜰 상품</a>
   <a href="/mh/user/myreceipe/myreceipi.do" class="hyperlink">나만의 레시피</a> 
   <a href="/mh/user/event/event.do" class="hyperlink">이달의 이벤트</a> 
   <input type="search" id="searchbox" value="검색내용을 입력해주세요." autocomplete="off"> 
   <span class="glyphicon glyphicon-search" id="searchimg"></span> 
   <a href="/mh/user/product/shoppingbasket.do" id="shoppingbox">
   <!-- 장바구니 넣었을때 뜨는 창 -->
   <div class="inCart" id="inCart2">
    <div class="gsInCart">
        <img src="" class="inImg">
        <p class="cTxt">
            <span class="inTxt"></span>
            <span class="inTxt2">장바구니에 담겼습니다.</span>
        </p>
    </div>
</div>
 
   </a>
   
   <div id="detailmenutp">
      <ul style="list-style: none;" id="detailul" style="z-index:-1;">
         <li onclick="location.href='/mh/user/product/productlist.do?category=0';">채소</li>
         <li onclick="location.href='/mh/user/product/productlist.do?category=1';">과일</li>
         <li onclick="location.href='/mh/user/product/productlist.do?category=2';">육류</li>
         <li onclick="location.href='/mh/user/product/productlist.do?category=3';">수산</li>
         <li onclick="location.href='/mh/user/product/productlist.do?category=4';">가공식품</li>
         <li onclick="location.href='/mh/user/product/productlist.do?category=5';">양념, 소스</li>
         <li onclick="location.href='/mh/user/product/productlist.do?category=6';">유제품</li>
         <li onclick="location.href='/mh/user/product/productlist.do?category=7';">건강 식품</li>
         <li onclick="location.href='/mh/user/product/productlist.do?category=8';">음료</li>
      </ul>
   </div>
</div>


    <!-- <div id="smalltitle" style="background-color: yellow; margin: 0px auto;"> -->
    <div id="smalltitle" class="smalltitle">
        <!-- 전체 카테고리에서 선택한 카테고리명 표시하기 -->
      <!-- <span class="glyphicon glyphicon-apple" style="font-size: 3em; padding-top: 10px;"></span> -->
     	
      <span class="icon_yachea" style="padding-top: 10px;"><img src="" style="width: 50px; height: 50px;" id="ctImg"></span>
      <p style="display: inline-block;  margin-left: 0px; font-size: 16px; margin-top: 30px;" id="ctName"></p>
     
    </div>


    <!-- 소주제(작은카테고리) 선택 순으로 상품목록 정렬하기 -->
    <div id="titleselect" class="titleselect">

        <a class="nameselect">
            <span class="on">${sortname}</span>
            <span class="glyphicon glyphicon-menu-down" id="moreselect"></span>
        </a>
        <ul class="selectlist">
            <li>
                <a class="" id="newPd" href="/mh/user/product/productlist.do?category=${category}&sort=0">신상품순</a>
            </li>
            <li>
                <a class="" id="bestPd" href="/mh/user/product/productlist.do?category=${category}&sort=1">인기상품순</a>
            </li>
            <li>
                <a class="" id="rowPd" href="/mh/user/product/productlist.do?category=${category}&sort=2">낮은가격순</a>
            </li>
            <li>
                <a class="" id="htPd" href="/mh/user/product/productlist.do?category=${category}&sort=3">높은가격순</a>
            </li>
        </ul>
    </div>

   



    <!-- 상품 목록들 -->
    <div id="goodsList" style="border: 1px solid rgb(194, 192, 192);">
        <ul class="list">
    		<c:forEach items="${list}" var="dto"> 
            <li>
                <div class="item">
                   <a class="img">
                    <!-- onclick="location.href='/mh/user/product/productdetail?seq=${dto.seq}" -->
                     <img src="${dto.img }" alt="${dto.name }" onclick="location.href='/mh/user/product/productdetail.do?seq=${dto.seq}';" id="img${dto.seq }">
                        </a> 
                        <button type="button" class="glyphicon glyphicon-shopping-cart shcart" data-toggle="modal" data-target="#myModal${dto.seq }" ></button>
                    <div class="info" onclick="location.href='/mh/user/product/productdetail?seq=${dto.seq}">
                        <span class="name">${dto.name}</span>
                            <span class="price">${dto.price}원</span>
                                	<span class="desc"> ${dto.shortdesc}</span>
                     </div>
                </div>
            </li>
		</c:forEach>
     
        </ul>
        
        
    </div>


    <!-- Modal -->
    <c:forEach items="${list}" var="dto"> 
    <div class="modal fade" id="myModal${dto.seq }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" id="modal-all">
    	
        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">상품 선택</h4>
        </div>

        <div class="modal-body">
        	
          <strong class="goodsname">${dto.name}</strong>
          <ul class="list">
              <li class="goods1">
                  <span class="goodsname2">${dto.name}</span>
                  <div class="adjust">
                    <span class="goodsprice" style=" display: inline-block;">${dto.price}</span>
                    <span class="goodswon" >원</span>
                    <span class="pmBtn">
                    <button class="glyphicon glyphicon-minus btndown"></button>
                    <input type="text" id="myModal${dto.seq }qty" readonly value="1" class="geatsu">
                    <button class="glyphicon glyphicon-plus btnup"></button>
                    </span>
                </div>
              </li>

          </ul>
          
            <div class="sum">
                <strong class="sumname">합계</strong>
                <strong class="sumnum">${dto.price}</strong>
                <strong class="won">원</strong>
            </div>

            <div class="save">
                <span class="txtJukrip">
                    <span class="jukrip">적립</span>
                </span>
                <span class="getpoint">
                    <span class="ifyoubuy">구매 시 </span>
                    <strong class="savenum"></strong>
                    <strong class="savewon">원 적립 </strong>
                </span>
            </div>
        </div>
        <div class="modal-footer">
        	<input type="hidden" class="hiddenprice" value="${dto.price }" id="${dto.seq}">
          <button type="button" class="btn btn-default cancle" data-dismiss="modal" >취소</button>
          <!-- <button type="submit" class="btn btn-primary" id="basket">장바구니 담기</button>  -->
          <a tabindex="0" class="btn btn-lg btn-danger basket" role="button" data-toggle="popover" data-trigger="focus" title="애호박 1개" data-content="장바구니에 담겼습니다." data-placement="bottom"  data-dismiss="modal">장바구니 담기</a> 
          
        </div>
      </div>
    </div>
  </div>
  </c:forEach>

  <div style="clear: both;"></div>


	<!-- 페이징  -->
 		${pagebar}
 
  <!-- top button -->
  <a href="#" id="topbtn" style="border: 0px; outline: none;"></a>


   


       
  


     


    <script>
    
		
    
   		//$(".savenum").text(pdSave);
    			
        
        // 하이퍼링크 마우스 올리면 색 변화 (색은 나중에 변경)
        $(".hyperlink").mouseover(function(){
            // $(this).css("color","red"); // 색 변경 필요
        })

        $(".hyperlink").mouseout(function(){
            $(this).css("color","black"); // 색 변경 필요
        })

       


        //특정 상품 이미지 클릭 시 상품 상세정보(구매)페이지로 이동
         $(".img").click(function() {
            location.href="/mh/user/product/productDetail.do";
            // href="productDetail.html"
        }); 

        //특정 상품 텍스트 클릭 시 상품 상세정보(구매)페이지로 이동
         $(".info").click(function() {
            location.href="/mh/user/product/productDetail.do";
            
            // href="productDetail.html"
        }); 
        
      

        //장바구니 수량버튼 클릭 시 수량 + - 시키기

        // 구매수량 담는 변수
        var txtCount = 0;
        // 상품 가격 담는 변수
        var price = 1;
        // 총 금액 담는 변수
        var sum = 0;
        // 총 적립금
        var sumpoint = 0;


         // 천단위 , 찍기
         function numberWithCommas(x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }
         
       
         
        // - 버튼
        $(".btndown").click(function(){
            txtCount = $(this).parent().find(".geatsu").val();

            if(txtCount >0){
                txtCount--;
                $(this).parent().find(".geatsu").val(txtCount);

            }else if (txtCount ==0) {
                alert("1개 이상 구매 가능합니다.");
                txtCount =1;
                $(this).parent().find(".geatsu").val(txtCount);

            };

            
            price = $(this).parent().parent().find(".goodsprice").text().replace(",", "");
            
            sum = price * txtCount;
            //$(".sumnum").text(numberWithCommas(sum));
            $(this).parent().parent().parent().parent().parent().find(".sum").find(".sumnum").text(numberWithCommas(sum));
        		
            
            sumpoint = parseInt(sum * 0.005);
            // $(".savenum").text(numberWithCommas(sumpoint));
            $(this).parent().parent().parent().parent().parent().find(".save").find(".savenum").text(numberWithCommas(sumpoint));
      
           
        });

        
        
        
        // + 버튼
        $(".btnup").click(function(){
        	
            txtCount = $(this).parent().find(".geatsu").val();
                txtCount++;
                $(this).parent().find(".geatsu").val(txtCount);
				
  
             if (txtCount > 50) {
                alert("더 이상 구매하실 수 없습니다.");
                txtCount =1;
              
                $(this).parent().find(".geatsu").val(txtCount);

            };

           price = $(this).parent().parent().find(".goodsprice").text().replace(",","");
            sum = price * txtCount;
           //$(".sumnum").text(numberWithCommas(sum));
            $(this).parent().parent().parent().parent().parent().find(".sum").find(".sumnum").text(numberWithCommas(sum));
            
            
            
            sumpoint = parseInt(sum * 0.005);
            //$(".savenum").text(numberWithCommas(sumpoint)); 
         	$(this).parent().parent().parent().parent().parent().find(".save").find(".savenum").text(numberWithCommas(sumpoint));
          
        });

        
        
      //모달 적립금     
    	$(".shcart").click(function(){
    		var modalid = $(this).attr("data-target").replace("#","");
    		var pdSave = $("#"+modalid).find(".modal-body").find(".list").find(".goods1").find(".adjust").find(".goodsprice").text().replace(",","");
    		//var pdSave = $(this).parent().parent().parent().parent().parent().find(".modal-body").find(".list").find(".goods1").find(".adjust").find(".goodsprice");
    		console.log(pdSave);
    		$("#"+modalid).find(".modal-body").find(".save").find(".savenum").text(Math.floor(parseInt(pdSave)*0.005));
    	});
      
      
        
		//모달 취소시 초기화 시키기
        $(".cancle").click(function() {
    		var id = $(this).parent().parent().parent().parent().attr("id")+"qty";
    		$(this).parent().parent().find(".modal-body").find("#"+id).val("1");
    		
    		
    		//var sum = $(this).parent().parent().find(".modal-body").find(".sum").find(".sumnum");
    		//sum.text("${dto.price}");
    		//$(this).parent().parent().find(".modal-body").find(".sum").find(".sumnum").text(${dto.price});
    		 var ogprice = 	$(this).parent().find(".hiddenprice").val();
    		 $(this).parent().parent().find(".modal-body").find(".sum").find(".sumnum").text(ogprice);
    		 $(this).parent().parent().find(".modal-body").find(".sum").find(".sumnum").text(numberWithCommas(ogprice));
    		 $(this).parent().parent().find(".modal-body").find(".save").find(".savenum").text(Math.floor(parseInt(ogprice)*0.005));
    	
    	});
		
		
		
		
		

        //소메뉴(카테고리별) 클릭시 소메뉴명 출력
        var block = "none";

        $("#titleselect").click(function(){
			
            console.log(block);
            if(block == "block") {
                block = "none";
                $("#titleselect > ul > li > a").css({"display":block});
                $("#moreselect").attr('class','glyphicon glyphicon-menu-down');
                
            }

            else {
                block = "block";
                $("#titleselect > ul > li > a").css({"display":block});
                $("#moreselect").attr('class','glyphicon glyphicon-menu-up');
               
            }
        });
        
        
        
        //같은 소메뉴명 색 변화 시키기 
         $(".selectlist li a").eq(${sortNum}).addClass("on");
      
        
       
        
        // 페이지버튼 번호 클릭시 해당 번호 페이지로 이동시키기
        $(".pagebar > ul >li").click(function(){
            $(".pagebar > ul > li ").removeClass("active");
            $(this).addClass("active");
        });
        
       
        
        //장바구니 클릭시 장바구니 아이콘에 상품 띄우기
         /* $(".basket").click(function(){
        	 $(".inCart").fadeIn(1500)
                $(".inCart").slideUp(2000)
        	});  */
      
        
        
        
        
        //상품가격 천단위로 , 찍기
        var price = document.getElementsByClassName('price');
        for(var i=0;i<price.length;i++){
        	price[i].innerText = numberWithCommas(price[i].innerText);
        };
        
      
        //모달 가격 천단위로 , 찍기
         var price2 = document.getElementsByClassName('goodsprice');
        for(var i=0;i<price2.length;i++){
        	price2[i].innerText = numberWithCommas(price2[i].innerText);
        };
        //모달 합계 천단위로 ,찍기
         var price3 = document.getElementsByClassName('sumnum');
        for(var i=0;i<price3.length;i++){
        	price3[i].innerText = numberWithCommas(price3[i].innerText);
        };
        
       
        
     
        
        
        
        //소카테고리 
       // var index = 0;
    	
     	
   		/*  if ("${sort}" == "sales") {
    		index = 0;	
    	} else if ("${sort}" == "regdate") {
    		index = 1;
    	} else if ("${sort}" == "price") {
    		index = 2;
    	} */ 
    
    	
    	//$(".fbtns").children().eq(index).addClass("active"); 
    	//$(".selectlist").children().addClass("active"); 
    	
    	
    	
    	function movePage() {
    		//alert(event.srcElement.value);
    		location.href = "/mh/user/product/productlist.do?page=" + event.srcElement.value;
    	};
    	
    	$("#pagebar").val(${page});
    	
    	if("${category}"==0) {
    		$("#ctImg").attr("src","/mh/images/icon_veggies.png");
    		$("#ctName").text("채소");
    	}else if("${category}"==1) {
    		$("#ctImg").attr("src","/mh/images/icon_fruit.png");
    		$("#ctName").text("과일");
    	}else if("${category}"==2) {
    		$("#ctImg").attr("src","/mh/images/icon_meat.png");
    		$("#ctName").text("육류");
    	}else if("${category}"==3) {
    		$("#ctImg").attr("src","/mh/images/icon_seafood.png");
    		$("#ctName").text("수산");
    	}else if("${category}"==4) {
    		$("#ctImg").attr("src","/mh/images/icon_deli.png");
    		$("#ctName").text("가공식품");
    	}else if("${category}"==5) {
    		$("#ctImg").attr("src","/mh/images/icon_sauce.png");
    		$("#ctName").text("양념,소스");
    	}else if("${category}"==6) {
    		$("#ctImg").attr("src","/mh/images/icon_deli.png");
    		$("#ctName").text("유제품");
    	}else if("${category}"==7) {
    		$("#ctImg").attr("src","/mh/images/icon_health.png");
    		$("#ctName").text("건강식품");
    	}else if("${category}"==8) {
    		$("#ctImg").attr("src","/mh/images/icon_snacks.png");
    		$("#ctName").text("음료");
    	}
    	
    	
    	var mseq =1;
    	
    	  
    	   
    	//장바구니로 데이터 보내기
        $(".basket").click(function(){
        	var mseq = ${sessionScope.seq};
        	var pseq = $(this).parent().find(".hiddenprice").attr("id");
        	var qty = $(this).parent().parent().find(".modal-body").find(".list").find(".goods1").find(".adjust").find(".pmBtn").find(".geatsu").val();
        	//console.log($(this).parent().parent().find(".modal-body").find(".list").find(".goods1").find(".adjust").find(".pmBtn").find(".geatsu"));
        	//var cartDiv = 
        		console.log($(this).parent().parent().parent().parent().find("#modal75").artt("id").replace("modal",""));
        	
            $.ajax({
              type:"GET",
              url:"/mh/user/product/productcart.do",
              data:"mseq="+mseq+"&pseq="+pseq+"&qty="+qty,   
              dataType:"text",
              success: function(result){
            	  $(".inCart").fadeIn(1500)
                  $(".inCart").slideUp(2000)
                 // $(".inCart").find(".inImg").attr("src","${dto.img}");
              },
              error: function(a,b,c){
                 console.log(a,b,c);
              }
           })  
  	
         //장바구니 담기 클릭시 모달 초기화 시키기
   		
       		var id = $(this).parent().parent().parent().parent().attr("id")+"qty";
       		$(this).parent().parent().find(".modal-body").find("#"+id).val("1");
       		var ogprice = 	$(this).parent().find(".hiddenprice").val();
       		 $(this).parent().parent().find(".modal-body").find(".sum").find(".sumnum").text(ogprice);
       		 $(this).parent().parent().find(".modal-body").find(".sum").find(".sumnum").text(numberWithCommas(ogprice));
       		 $(this).parent().parent().find(".modal-body").find(".save").find(".savenum").text(Math.floor(parseInt(ogprice)*0.005));
       	
      
        });
           
    	
    	
    	
    	
    	
    	
    	
    	
    </script>
    
    <script src="/mh/js/main.js"></script>
    <script src="/mh/js/modal.js"></script>


<!-- footer -->
<%@include file="/WEB-INF/views/inc/footer.jsp" %>
</body>
</html>