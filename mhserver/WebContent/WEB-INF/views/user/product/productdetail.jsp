<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/mh/css/modal.css">
<style>

        #product {
            width: 1100px;
            height: 700px;
            margin: 50px auto;
        }

        #lProduct, #rProduct {
            display: inline-block;
            width:520px;
            height: 540px;
            margin-top:20px;
        }

        #lProduct {
            text-align: center;
        }

        #productImg {
            width: 430px;
            height: 500px;
        }

        #rProduct {
            float: right;
        }

        /* 첫구매 우대 태그 감싸는 div */
        #rProduct div:nth-child(4) {
            font-size: 12px; 
            padding-bottom:20px; 
            border-bottom: 1px solid #ddd;
        }

        /* 첫구매 우대 태그 */
        #buyTag {
            display: inline-block; 
            width: 100px; 
            border: 1px solid #08718E; 
            background-color: white; 
            border-radius: 20px; 
            text-align: center; 
            color: #08718E;
        }

        /* 적립 태그 감싸는 div */
        #rProduct div:nth-child(7) {
            display: inline-block; 
            margin-top: 10px; 
            width:100%;
        }

        /* 적립 태그 */
        #pointTag {
            display: inline-block; 
            width: 40px; 
            border: 1px solid gold; 
            background-color: gold; 
            border-radius: 20px; 
            text-align: center; 
            color:white;
        }

        strong {
            font-size: 25px;
        }

        /* 오른쪽 상단 */
        #rProduct2 > div {
            margin-top:20px; 
            padding-bottom:20px;
            border-bottom: 1px solid #ddd;
        }

        .proTitle {
            display:inline-block;
            font-size: 15px;
            width:80px;
        }

        .proAn {
            font-size: 15px;
        }

        /* 나만의 레시피 공간 */
        fieldset {
            height: 368px;
            width:1100px;
            border: 3px solid #6666;
            margin: 30px auto;
            text-align: center;
        }

        fieldset > a {
            float: left;
        }

        /* 나만의 레시피 사진 */
        .rImage > a > img{
            width: 250px;
            height: 250px;
            /* margin: 20px; */
        }

        .rImage {
            width: 260px;
            height: 220px;
            margin: 30px;
            margin-bottom: 10px;
        }

        legend {
            font-size: 2em;
            color: #08718E;
            text-align: center;
            font-weight: bold;
            border: none;
            width: 400px;
        }

        .rContents {
            font-weight: bold;
            font-size: 15px;
        }


        /* 탭 */
        .tab {
            padding: 0px; 
            margin: 50px auto; 
            width: 1100px;
            border-bottom: 1px solid #6666;
        }

        .tab > li {
            display: inline-block;
            border: 1px solid #6666; 
            border-bottom: none; 
            border-right: none;
            margin-bottom:0px; 
            width: 120px; 
            height: 40px;
            text-align: center;
            padding: 10px;
            font-size: 15px;
        }

        #btnPlus, #btnMinus {
            border-style: none;
            border-radius: 3px;
            color: #08718E;
            font-size:18px;
            width:25px;
        }

        #btnBuy {
            border-style: none;
            border-radius: 3px;
            font-size:15px;
            height: 40px;
            width: 130px;
            background-color: #08718E;
            color: white;
        }

        #btnAlways {
            border: 1px solid #08718E;
            border-radius: 3px;
            color: #08718E;
            background-color: white;
            font-size:15px;
            height: 40px;
            width: 80px;
        }

        #btnReview, #btnQna {
            border-style: none;
            background-color: #08718E;
            border-radius: 3px;
            color: white;
            font-size:15px;
            height: 30px;
            float: right;
            margin: 10px;
        }

        #btnReview {
            margin-bottom: 50px;
        }

        #txtCount {
            width: 40px;
        }

        th, td {
            text-align: center;
        }

        /* 위의 text-align 때문에 추가하였습니다.*/
        #ft1  tr  td, #ft2  tr  td {
            text-align: initial;
        }

        #tblReview > th, #tblReview > td, #tblQna > th, #tblQna > td {
            text-align: center;
            height: 37px;
        }

        .tableTitle {
            text-align: left;
        }

        #proDetail {
            height: 2000px;
            width: 1100px;
            margin: 30px auto;
        }

        #tblReview, #tblQna {
            width: 1080px;
            margin: 20px auto;
        }

        #tblQna tbody tr:first-child th, #tblQna tbody tr:first-child td{
            border-top: 2px solid #08718E;
        }

        #tblQna tbody tr:last-child th, #tblQna tbody tr:last-child td{
            border-bottom: 2px solid #08718E;
        }

        #tblReview tbody tr:first-child th, #tblReview tbody tr:first-child td{
            border-top: 2px solid #08718E;
        }

        #tblReview tbody tr:last-child th, #tblReview tbody tr:last-child td{
            border-bottom: 2px solid #08718E;
        }

        h3 {
            margin-left: 10px;
        }

        /* 게시판 내부 div */
        .qnaInner, .reviewInner {
            display: none; 
            min-height: 37px; 
            margin-top: 10px;
        }
        
        /* 하단 게시판 제목 클릭 */
        .reviewClick, .qnaClick {
            text-align: left;
        }

        .rTitle {
            font-weight: bold;
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


<div id="menubartp">
    <a href="" class="hyperlink">전체 카테고리</a>
    <a href="" class="hyperlink">HOT 상품</a>
    <a href="" class="hyperlink">알뜰 상품</a>
    <a href="" class="hyperlink">나만의 레시피</a>
    <a href="" class="hyperlink">이달의 이벤트</a>
    <input type="text" id="searchbox" value="검색내용을 입력해주세요.">
    <span class="glyphicon glyphicon-search" id="searchimg"></span>
    <a href="#" id="shoppingbox">
        <!-- 장바구니 넣었을때 뜨는 창 -->
 <div class="inCart">
    <div class="gsInCart">
        <img src="${dto.img}">
        <p class="cTxt">
            <span class="inTxt">${dto.name}</span>
            <span class="inTxt2">장바구니에 담겼습니다.</span>
        </p>
    </div>
</div>
    </a>
    
</div>

<!-- user menu (register, login , as) -->
<div id="noticebar">
    <div id="noticeMent" >
        <span class="eachNotice">[마켓허리] "허리라이프-어디든 간다! 마켓멀리! 신선하지 않은 신선MD의 신선한 장미를 찾아서" 댓글이벤트 당첨 결과</span>
        <span class="eachNotice">[마켓허리] 유튜브 ‘컬리라이프-일할 때도 쉴 때도 먹어야 한다, 극한직업 컬리 MD편’ 댓글 이벤트 당첨 공지</span>
        <span class="eachNotice">[마켓허리] 코로나19 확진자 관련 현황 및 대응조치 안내</span>
        <span class="eachNotice">[가격인상공지] [모어댄프레쉬] 맥돈 삼겹살 구이용 300g 외 23건 (2020 5. 20 ~)</span>
        <span class="eachNotice">[마켓컬리] 개인정보처리방침 개정 내용 사전안내</span>
    </div>
</div>

<header>
    <div id="usermenu">
        <a href="#" class="hyperlink">회원가입</a>
        <a href="#" class="hyperlink">로그인</a>
        <a href="#" class="hyperlink">고객센터</a>
    </div>
    <!-- 마켓허리 로고 -->
    <img src="/mh/images/brandlogo.png" alt="brandlogo">
</header>


<!-- menu bar -->
<div id="menubar">
    <a href="" class="hyperlink">전체 카테고리</a>
    <a href="" class="hyperlink">HOT 상품</a>
    <a href="" class="hyperlink">알뜰 상품</a>
    <a href="" class="hyperlink">나만의 레시피</a>
    <a href="" class="hyperlink">이달의 이벤트</a>
    <input type="search" id="searchbox" value="검색내용을 입력해주세요.">
    <span class="glyphicon glyphicon-search" id="searchimg"></span>
    <a href="#" id="shoppingbox">
            <!-- 장바구니 넣었을때 뜨는 창 -->
 <div class="inCart">
    <div class="gsInCart">
        <img src="${dto.img}">
        <p class="cTxt">
            <span class="inTxt">${dto.name}</span>
            <span class="inTxt2">장바구니에 담겼습니다.</span>
        </p>
    </div>
</div>
    </a>
</div>

 

<!-- detail menu -->
<div id="detailmenu">
    <ul style="list-style: none;">
        <a href=""><li>채소</li></a>
        <a href=""><li>과일</li></a>
        <a href=""><li>수산</li></a>
        <a href=""><li>가공식품</li></a>
        <a href=""><li>양념, 소스</li></a>
        <a href=""><li>유제품</li></a>
        <a href=""><li>건강 식품</li></a>
        <a href=""><li>음료</li></a>
    </ul>
</div>
</head>





</head>

<body>

<div id="main">


        <div id="product">
            <div id="lProduct">
                <img src="${dto.img}" id="productImg" alt="productImg">
            </div>
            
            <div id="rProduct">
                <div>
                    <strong id="pName">${dto.name}</strong>
                </div>

                <div style="margin-bottom:35px;">
                    <short>${dto.shortdesc}</short>
                </div>

                <div style="margin-top: 20px; margin-bottom: 10px;">
                    <span id="price" style="font-size: 25px;"></span><span style="font-size: 15px;">원</span>
                </div>

                <!-- 첫구매 우대 태그 -->
                <div>
                    <!-- <span id="buyTag">첫구매 우대9%</span> -->
                    개당 <span id="point"></span>원 적립
                </div>

                <div id="rProduct2">
                    <div>
                        <span class="proTitle">판매단위</span>
                        <span class="proAn">1개</span>
                    </div>
                    <div>
                        <span class="proTitle">원산지</span>
                        <span class="proAn">국산</span>
                    </div>
                    <div>
                        <span class="proTitle">유통기한</span>
                        <span class="proAn">수령 후 7일 이내 권장</span>
                    </div>
                    <div>
                        <span class="proTitle">안내사항</span>
                        <span class="proAn">시세에 따라 가격이 변동될 수 있습니다.</span>
                    </div>
                    <div>
                        <span class="proTitle">구매수량</span>
                        <div style="display:inline-block;">
                            <input type="button" id="btnMinus" value="-" style="float: left;">
                            <input type="text" id="txtCount" value="1" style="text-align: center;">
                            <input type="button" id="btnPlus" value="+" style="float: right;">
                        </div>
                    </div>
                </div>

                <div style=" margin-top:35px; width:100%;">
                    <span style="font-size: 15px; float:right;">총 상품금액 : <span id="sumPrice" style="font-size: 20px;"></span><span>원</span></span>
                </div>

                <!-- 적립 태그 -->
                <div>
                    <span style="float:right;">
                        <span id="pointTag">적립</span>
                        <span>구매 시 </span>
                        <span id="sumPoint"></span>
                        <span>원 적립</span>
                    </span>
                </div>
    
                <div style="float:right; margin-top:20px;">

	    			<button type="submit" id="btnAlways">찜 하기</button>
	               	<button type="submit" id="btnBuy">장바구니 담기</Button>
                    	
                </div>
            </div>

        </div> <!-- product 끝 -->

      
        <!-- 레시피 -->

        <fieldset>
            <legend>Market Hurry Recipe</legend>
            <div class="recipe">
            
   
            
            <c:forEach items="${recipeinfo}" var="redto">
            
                <div class="recipeImg" style="display: inline-block;">
                    <a href="http://localhost:8090/mh/user/myrecipe/myrecipedetail.do?seq=${redto.seq}">
                        <img
                            src="/mh/images/${redto.img}"
                            class="rImage"
                            id="rImage1"
                    /></a>
                    <a href="#">
                        <div class="rContents">
                            ${redto.title}
                        </div></a>
                </div>
           </c:forEach>
           </div>
           </fieldset>
           
           
           
        <!-- 이동 탭을 위한 div -->
        <div id="tabDetail" style="height: 80px;"></div>

        <!-- 상품 설명 탭 -->
        <ul class="tab">
            <li style="border-right: 1px solid #6666;"><a href="#tabQna"><span>상품 문의</span></a></li>
            <li style="float: left; background-color: #ccc;"><a href="#tabDetail"><span>상품 설명</span></a></li>
            <!-- <li style="float: left;"><a href="#tabImg"><span>상품 이미지</span></a></li> -->
            <li style="float: left;"><a href="#tabReview"><span>상품 후기</span></a></li>
        </ul>

        
        <!-- 상품 설명 -->
        <div id="proDetail">
            <div id="detailImg" style="text-align: center; margin: 100px;">
                <img src="${dto.img}" id="img1" style="width: 550px;" alt="productImg">
            </div>
            
            <h1 style="margin: 40px; text-align: center;">${dto.name}</h1>
            <div style="font-size: 20px; margin-top: 30px; text-align: center;">${dto.shortdesc}</div>

            <p id="txtproDetail" style="font-size: 18px; margin: 100px 10px; text-align: center;">${dto.content}</p>
   


 

            <!-- 이동 탭을 위한 div -->
            <div id="tabReview" style="height: 80px;"></div>

            <!-- 상품 후기 탭 -->
                <ul class="tab">
                    <li style="border-right: 1px solid #6666;"><a href="#tabQna"><span>상품 문의</span></a></li>
                    <li style="float: left;"><a href="#tabDetail"><span>상품 설명</span></a></li>
                    <!-- <li style="float: left;"><a href="#tabImg"><span>상품 이미지</span></a></li> -->
                    <li style="float: left; background-color: #ccc;"><a href="#tabReview"><span>상품 후기</span></a></li>
                </ul>



            <!-- 상품 후기 -->
            <div style="margin-bottom: 30px;">
                <div style="font-weight: bold; font-size: 20px;">Product Review</div>
                <div>- 상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</div>
                <div>- 배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 1:1 문의에 남겨주세요.</div>
            </div>

            <table id="tblReview" class="table table-bordered" style="width: 1100px;">
                <tr>
                    <th style="width: 10%;">번호</th>
                    <th style="width: 50%;">제목</th>
                    <th style="width: 10%;">작성자</th>
                    <th style="width: 20%;">작성일</th>
                    <th style="width: 10%;">조회수</th>
                </tr>
                
                
                <c:if test="${rlist.size() == 0}">
                    <tr>
                    	<td colspan="5">상품후기가 없습니다.</td>
                    </tr>                    	
                 </c:if>
                
                
                
                
                
                <c:forEach items="${rlist}" var="rdto">
                
                <tr>
                    <td class="tableNum" style="width: 10%;">${rdto.rownum}</td>
                    <td class="reviewClick" id="reviewTitle1" style="width: 50%;">
                        <!-- 제목 -->
                        ${rdto.title}
                      <div class="reviewInner">
                            <div style="margin-top: 10px;">
                                ${rdto.content}
                            </div>     
                            <img src="${rdto.image}" style="width:150px; height:150px;">
                        </div>
                    </td>
                    <td class="tableName" style="width: 10%;">${rdto.id}</td>
                    <td class="tableDate" style="width: 20%;">${rdto.regdate}</td>
                    <td class="tableCount" id="reviewCount1" style="width: 10%;">${rdto.readcount}
                    <input type="hidden" id="rseq" value="${rdto.seq }">
                    <input type="hidden" id="cnt" value="notCnt">
                    </td>
                    <!-- </div> -->
                </tr>
                
                </c:forEach>

                
            </table>


            

            <div>
                <input type="button" id="btnReview" value="후기 등록">
            </div>

            <!-- 페이지 바 -->
            <nav id="pagebarReview" class="pagebar" style="text-align: center; margin-top: 60px;">
                <ul class="pagination">
                  <li><a href="#">&laquo;</a></li>
                  <li><a href="#">&lsaquo;</a></li>
                  <li class="active"><a href="#" style="z-index: 0;">1</a></li>
                  <li><a href="#">&rsaquo;</a></li>
                  <li><a href="#">&raquo;</a></li>
                </ul>
            </nav>


            <!-- 이동 탭을 위한 div -->
            <div id="tabQna" style="height: 80px;"></div>


            <!-- 상품문의 탭 -->
            <ul class="tab">
                <li style="border-right: 1px solid #6666; background-color: #ccc;"><a href="#tabQna"><span>상품 문의</span></a></li>
                <li style="float: left;"><a href="#tabDetail"><span>상품 설명</span></a></li>
                <!-- <li style="float: left;"><a href="#tabImg"><span>상품 이미지</span></a></li> -->
                <li style="float: left;"><a href="#tabReview"><span>상품 후기</span></a></li>
            </ul>



            <div style="margin-bottom: 30px;">
                <div style="font-weight: bold; font-size: 20px;">Product Q&A</div>
                <div>- 상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</div>
                <div>- 배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 1:1 문의에 남겨주세요.</div>
            </div>

            
            <table id="tblQna" class="table table-bordered">
                <tr>
                    <th style="width: 10%;">번호</th>
                    <th style="width: 50%;">제목</th>
                    <th style="width: 20%;">작성자</th>
                    <th style="width: 20%;">작성일</th>
                </tr>
                
                
                
                    	
                 <c:if test="${ilist.size() == 0}">
                    <tr>
                    	<td colspan="4">상품문의가 없습니다.</td>
                    </tr>                    	
                 </c:if>
                
             
                
                <c:forEach items="${ilist}" var="idto">
                
                <tr>
                    <td class="tableNum" style="height: 37px;">${idto.rownum}</td>
                    <td class="qnaClick" id="qnaTitle1">
                        ${idto.title}
                        <div id="qnaInner1" class="qnaInner"><b>${dto.name}</b>
                            <div style="margin-top: 10px;">
                                ${idto.content}
                                <img src="${idto.img}" style="width:150px; height:150px;">
                            </div>     
                        </div>
                    </td>
                    <td class="tableName">${idto.id}</td>
                    <td class="tableDate">${idto.regdate}</td>
                </tr>

				<c:if test="${idto.answer != null}">
                <tr>
                    <td class="tableNum" style="height: 37px;">[답변]</td>
                    <td class="qnaClick" id="qnaTitle2">
                        [답변] 안녕하세요! 마켓허리 입니다.
                        <div id="qnaInner2" class="qnaInner">
                        ${idto.answer}
                        </div>
                    </td>
                    <td class="tableName">Market Hurry</td>
                    <td class="tableDate">${idto.regdate}</td>
                </tr>
                </c:if>

				</c:forEach>


            </table>




            <div>
                <input type="button" id="btnQna" value="문의 등록">
            </div>

            <!-- 페이지 바 -->
            <nav id="pagebarQna" class="pagebar" style="text-align: center; margin-top: 60px;">
                <ul class="pagination"> 
                  <li><a href="#">&laquo;</a></li>
                  <li><a href="#">&lsaquo;</a></li>
                  <li class="active"><a href="#">1</a></li>
                  <li><a href="#">&rsaquo;</a></li>
                  <li><a href="#">&raquo;</a></li>
                </ul>
            </nav>

            
        </div>
        


    </div> <!-- main 끝 -->
	<div id="modal"></div>
    
    <!--찜 추가 완료-->
    <div class="modal_common jjimsuccess">
        <a href="javascript:;" class="close">X</a>
        <p class="title">알림메세지</p>
        <div class="con">찜 목록에 상품이 담겼습니다.</div>
        <div><input type="button" value="확인" href="javascript:;" class="yes"></div>
    </div>
    
    
    <!-- 장바구니 추가 완료 -->
    <div class="modal_common cartsuccess">
        <a href="javascript:;" class="close">X</a>
        <p class="title">알림메세지</p>
        <div class="con">장바구니에 상품이 담겼습니다.</div>
        <div><input type="button" value="확인" href="javascript:;" class="yes"></div>
    </div>
    
    
    <!-- 1개이상 구매 가능 알림 -->
    <div class="modal_common buyalert">
        <a href="javascript:;" class="close">X</a>
        <p class="title">알림메세지</p>
        <div class="con">1개이상 구매가 가능합니다.</div>
        <div><input type="button" value="확인" href="javascript:;" class="yes"></div>
    </div>
    

	<!-- 상품후기 경고 -->
    <div class="modal_common delivery">
        <a href="javascript:;" class="close">X</a>
        <p class="title">알림메세지</p>
        <div class="con">상품 구매 후 배송완료된 회원 분만 한 달 내 작성 가능합니다.</div>
        <div><input type="button" value="확인" href="javascript:;" class="yes"></div>
    </div>



<div style="clear: both;"></div>

<!-- footer -->
<%@include file="/WEB-INF/views/inc/footer.jsp" %>


<script>
        
        // 하이퍼링크 마우스 올리면 색 변화 (색은 나중에 변경)
        $(".hyperlink").mouseover(function(){
            // $(this).css("color","red"); // 색 변경 필요
        })

        $(".hyperlink").mouseout(function(){
            $(this).css("color","black"); // 색 변경 필요
        })


        $("#menubar > a").first().mouseenter(function(event){
            console.log("click");

        });


        // 로고 클릭시 메인화면으로
        $("#brandlogo").click(function() {
            $(location).attr('href', '/mh/templates/main_template.html');
        });




        // 구매수량 담는 변수
        var txtCount = 0;
        // 상품 가격 담는 변수
        var price = 1;
        // 총 금액 담는 변수
        var sum = 0;

        // 적립금
        var point = 0;
        // 총 적립금
        var sumpoint = 0;
        

        // 천단위 , 찍기
        function numberWithCommas(x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }

        
        //가격 지정(천단위 , 찍기)
        $("#price").text(numberWithCommas(${dto.price}));
        
        //가격 기본 값
        $("#sumPrice").text(numberWithCommas(${dto.price}));
     
        
        var mper = 0; //적립율
    	//적립
    	if (${mdto.gradeseq} == 6) mper = 0.1;
    	else if (${mdto.gradeseq} == 5) mper = 0.07;
    	else if (${mdto.gradeseq} == 4) mper = 0.05;
    	else if (${mdto.gradeseq} == 3) mper = 0.03;
    	else if (${mdto.gradeseq} == 2) mper = 0.01;
    	else mper = 0.005;
    	
    	//적립금
    	var mile = ${dto.price} * mper;
    	$("#point").text((numberWithCommas(Math.round(mile))));
    	$("#sumPoint").text((numberWithCommas(Math.round(mile))));
        

        //구매 수량
        //-버튼
        $("#btnMinus").click(function() {

            txtCount = $("#txtCount").val();

            if (txtCount > 1) {
                txtCount--;
                $("#txtCount").val(txtCount);
            } else if (txtCount == 1) {
                // 수량이 -가 되었을 경우
                /* alert("1개이상 구매가 가능합니다."); */
                openModal("buyalert");
                txtCount = 1;
                $("#txtCount").val(txtCount);
            };

            price = $("#price").text().replace(",", "");
            /* point = parseInt(price * 0.09); */
            point = (numberWithCommas(Math.round(mile)));
            sum = price * txtCount;

            // point = $("#point").text().replace(",", "");
            sumpoint = point * txtCount;

            $("#sumPrice").text(numberWithCommas(sum));
            /* $("#sumPoint").text(numberWithCommas(sumpoint)); */
            $("#sumPoint").text((numberWithCommas(Math.round(sumpoint))));
        });


        //+버튼
        $("#btnPlus").click(function() {

            txtCount = $("#txtCount").val();
            txtCount++;
            $("#txtCount").val(txtCount);
        
            price = $("#price").text().replace(",", "");
            /* point = parseInt(price * 0.09); */
            /* $("#point").text((numberWithCommas(Math.round(mile)))); */
            point = (numberWithCommas(Math.round(mile)));
            sum = price * txtCount;

            // point = $("#point").text().replace(",", "");
            sumpoint = point * txtCount;

            $("#sumPrice").text(numberWithCommas(sum));
            $("#sumPoint").text((numberWithCommas(Math.round(sumpoint))));

        });


        // 후기
        $(".reviewClick").click(function() {
        	
            if($(this).find(".reviewInner").css("display") == "none"){
            	$(this).find(".reviewInner").css({"display": "block"});
            	
            	 if($("#cnt").val() == "notCnt"){
                 	 //리뷰 클릭시 조회수 올라감
                      $.ajax({
                     	type:"GET",
                     	url:"/mh/user/product/productreviewCount.do",
                     	data:"rseq=" + $("#rseq").val(),
                     	dataType:"text",
                     	success: function(result){
                     		if(result == 1){
                     			console.log("카운트 증가 완료");
                     			
                     		}
                     		else {
                     			console.log("카운트 증가 실패");
                     		}
                     	},
                     	error:function(a,b,c){
                     		console.log(a,b,c);
                     	}
                     		
                     }); 
                 	$("#cnt").attr("value","already");
                 } else if($("#cnt").val() == "already") {
                 } 
            	 
            }
            else {
                $(this).find(".reviewInner").css({"display": "none"});
            }
        });




        //문의    
        $(".qnaClick").click(function() {
        	if($(this).find(".qnaInner").css("display") == "none"){
            	$(this).find(".qnaInner").css({"display": "block"});
        	}
        	else {
                $(this).find(".qnaInner").css({"display": "none"});
            }
            	
        });
        
  

        // 후기등록
        // 후기등록 - 마이페이지? 혹은 작성창?
        $("#btnReview").click(function() {
            // 조건문 걸기
            /* alert("상품후기는 상품을 구매하시고 배송완료된 회원 분만 한 달 내 작성 가능합니다."); */
            //배송완료 처리가 되었는지 확인 하기!!!
             /* d.orderseq = o.seq
            inner join orderdetail od
                on o.seq = od.orderseq
                    where d.status = 2
                        and od.productseq = 63
                            and o.memberseq = 529
                                and sysdate < d.deliverycomplete + 30; */
            
            //이미 쿼리문에서 검사
            var pseq = ${dto.seq};
            if (${rdto.productseq == pseq} && ${rdto.memberseq == "529"}) {
            	alert("완료");
            	// 마이페이지 후기 쓰는 창으로 이동
            	//$(location).attr('href', '/mh/user/mypage......')
            	
            }
            	
            	
            else openModal("delivery");
            
            // $(location).attr('href', 'productReview.html');
        });

        
        // 상품문의 등록버튼
        $("#btnQna").click(function() {
            $(location).attr('href', '/mh/user/product/productqna.do?seq=' + ${dto.seq});
        });




    //장바구니 클릭시 장바구니 아이콘에 상품 띄우기
    
    
    $("#btnBuy").click(function(){
        //    $(".inCart").css("display","block");
           $(".inCart").fadeIn(1500)
                $(".inCart").slideUp(2000)
        });
    
    
    //레시피가 없을 경우
    if(${recipeinfo.size() == 0}) {
    	$(".recipe").text("추천 레시피가 없습니다.");
    	$(".recipe").css("margin-top", "100px");
    	$(".recipe").css("font-size", "20px");
    }
    
    //레시피에 마우스 올렸을 때
    $(".recipeImg").mouseover(function() {
    	$(this).css("opacity", "0.3");
    });
    //레시피에서 마우스 똈을 때
    $(".recipeImg").mouseout(function() {
    	$(this).css("opacity", "1");
    });
    
    
    
    
	var mseq = 1;
	
	//찜하기
    $("#btnAlways").click(function(){
    	$.ajax({
    		type:"GET",
    		url:"/mh/user/product/productjjim.do",
    		data:"mseq="+mseq+"&pseq="+${dto.seq},
    		dataType:"text",
    		success: function(result){
    			openModal("jjimsuccess");
    		},
    		error: function(a,b,c){
    			console.log(a,b,c);
    		}
    	})
    })
    
    
    //장바구니
    $("#btnBuy").click(function(){
    	$.ajax({
    		type:"GET",
    		url:"/mh/user/product/productcart.do",
    		data:"mseq="+mseq+"&pseq="+${dto.seq}+"&qty="+$("#txtCount").val(),
    		dataType:"text",
    		success: function(result){
    			openModal("cartsuccess");
    		},
    		error: function(a,b,c){
    			console.log(a,b,c);
    		}
    	})
    });
	
	
	
    

    </script>
    
    <script src="/mh/js/main.js"></script>
    <script src="/mh/js/modal.js"></script>

</body>
</html>