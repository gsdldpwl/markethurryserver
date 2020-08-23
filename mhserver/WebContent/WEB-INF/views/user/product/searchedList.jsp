<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마켓허리 :: 오늘의 장보기</title>
	<%@include file="/WEB-INF/views/inc/header.jsp" %>
	<script src="/mh/js/main.js"></script>
	<link rel="stylesheet" href="/mh/css/eventproductlist.css">
</head>

<body>

    <!-- <div id="smalltitle" style="background-color: yellow; margin: 0px auto;"> -->
   <div id="smalltitle" class="smalltitle">
       <!-- 전체 카테고리에서 선택한 카테고리명 표시하기 -->
     <!-- <span class="glyphicon glyphicon-apple" style="font-size: 3em; padding-top: 10px;"></span> -->
     <p style="display: inline-block; margin-left: 0px; font-size: 16px; margin-top: 30px;">검색어 : ${search }<span style="color:#08718E; font-size:1.1em; padding-left:0px;" >&nbsp; ${size }</span> 건</p>
   </div>



    <!-- 상품 목록들 -->
    <div id="goodsList" style="border: 1px solid rgb(194, 192, 192);">
        <ul class="list">
        	<c:forEach var="dto" items="${list}">
	            <li>
	                <div class="item">
	                   <a class="img" onclick="location.href='/mh/productdetail.do<%-- ?seq=${i.getPseq()} --%>';">
                   		 <img src="${dto.getImg()}" alt="">
	                   </a>
	                        <button type="button" id="shopping" class="glyphicon glyphicon-shopping-cart" data-toggle="modal" data-target="#myModal"></button>
	                    <div class="info" onclick="location.href='/mh/user/product/productdetail.do?seq=${dto.seq};'">
	                        <span class="name">${dto.getName()}</span>
	                        <span class="price">${dto.getPrice()}원</span>
	                        <span class="desc">${dto.getShortdesc()}</span>
	                    </div>
	                </div>
	                <input type="hidden" value="${dto.getSeq()}">    
	            </li>
            </c:forEach>
        </ul>
    </div>
	
	 <div id="paging">${pagebar}</div> 

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" id="modal-all">
        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">상품 선택</h4>
        </div>
		
        <div class="modal-body">
          <strong class="goodsname"></strong>
          <ul class="list">
              <li class="goods1">
                  <span class="goodsname2">애호박 1개</span>
                  <div class="adjust">
                    <span class="goodsprice" style=" display: inline-block;">1,480</span>
                    <span class="goodswon" >원</span>
                    <span class="pmBtn">
	                    <button class="glyphicon glyphicon-minus" id="btndown"></button>
	                    <input type="text" readonly value="1" class="geatsu">
	                    <button class="glyphicon glyphicon-plus" id="btnup"></button>
                    </span>
                </div>
              </li>
          </ul>
          
            <div class="sum">
                <strong class="sumname">합계</strong>
                <strong class="sumnum">1,480</strong>
                <strong class="won">원</strong>
            </div>

            <div class="save">
                <span class="txtJukrip">
                    <span class="jukrip">적립</span>
                </span>
                <span class="getpoint">
                    <span class="ifyoubuy">구매 시 </span>
                    <strong class="savenum">7</strong>
                    <strong class="savewon">원 적립 </strong>
                </span>
            </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" id="cancle">취소</button>
          <!-- <button type="button" class="btn btn-primary" id="basket">장바구니 담기</button> -->
          <a tabindex="0" class="btn btn-lg btn-danger" role="button" data-toggle="popover" data-trigger="focus" title="애호박 1개" data-content="장바구니에 담겼습니다." data-placement="bottom" id="basket"  data-dismiss="modal">장바구니 담기</a>
          
        </div>
      </div>
    </div>
  </div>

  <div style="clear: both;"></div>

<!-- footer -->
<%@include file="/WEB-INF/views/inc/footer.jsp" %>
<script src="/mh/js/eventproductlist.js"></script>
</body>
</html>