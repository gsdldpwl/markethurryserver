<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/inc/header.jsp" %>

</head>

<style>
		* {
		outline:none;
		}
		
        /* 상품정보 css */
        .orderPage {
            width: 1100px;
            margin: 10px auto;
        }

        .mainFont  {
         margin: 40px auto;
        }
        .mainFont > h2 {
            text-align: center;
            font-weight: 600;
            font-size: 35px;
        }

        .mainFont .subFont {
            text-align: center;
            font-weight: 600;
            color: #999;
            font-size: 15px;
        }

        .orderbody .goodsInfo {
            font-size: 20px;
            font-weight: 700;
        }

        .orderbody .innerShow {
            text-align: center;
            padding: 30px;
            height: 100px;
            border-top: 1px solid black;
            border-bottom: 1px solid #999;
        }

        .orderbody .innerShow .putName {
            margin-bottom: 10px;
            font-weight: 600;
        }


        #detailList ,  #detailList .tbl1  {
            width: 1100px;
            border-top: 1px solid  teal;
            border-bottom: 1px solid rgb(199, 198, 198);
        }

       
        #detailList .tbl1 .gongback,.sangpuomInfo,.sangpuomSum {
            height: 62px;
            border-bottom: 1px solid #999;
        }

        #detailList .tbl1 .sangpuomInfo {
            width: 740px;
            padding-left: 215px;
            text-align: left;
        }
        #detailList .tbl1 .sangpuomSum  {   
            width: 186px;
           text-align: center;
        
        }

        #detailList .tbl1 .gongback {
            width: 120px;
        }

        #detailList .tbl1 .infoSmImg {
            width: 120px;
            padding: 20px 0 19px;
        }

        #detailList .tbl1 .infoSmImg img {
            width: 90px;
            height: 115px;
        }


        #detailList .tbl1 .infoInfo {
            padding: 20px 0 22px;
        }

        #detailList .tbl1 .infoInfo .detalName {
            padding-bottom: 23px;
            font-weight: 700;
            font-size: 16px;
            line-height: 24px;
            text-indent: -.3px;
        }
      
        #detailList .tbl1 .infoInfo .detalInfo {
            overflow: hidden;
            font-size: 12px;
            color: black;
        }

        #detailList .tbl1 .detalPrice {
            padding-right: 66px;
            font-size: 16px;
            line-height: 24px;
            font-weight: 700;
            text-align: right;
            letter-spacing: -.3px;
        }

        /* 주문자 정보 css */

        .jimoonInfo {
             width: 1100px ;
            
             }
        .mainFont2 h2 {
            padding: 60px 0 10px;
            font-weight: bold;
            font-size: 20px;
            line-height: 29px;
            border-bottom: 1px solid black;
        }

       .infoTable th {
        width: 190px;
        padding: 22px 0 0 20px;
        font-size: 14px;
        font-family: 'Noto Sans';
        font-weight: bold;
        vertical-align: top;
       }

       .infoTable td {
        position: relative;
        padding: 16px 0 0 0;
        vertical-align: top;
       } 

       .ordererInfo {
           border-bottom: 1px solid #999;
       }

        .ordererInfo .infoTable .senderName  th {
           padding-top: 26px;
        }

        .ordererInfo .infoTable .senderName .nameSender,
        .ordererInfo .infoTable .senderTel .telSender,
        .ordererInfo .infoTable .senderEmail .emailSender
         {
            width: 162px;
            padding: 0px;
            border: none;
            font-size: 14px;
            margin-top: 8px;
        }

        .ordererInfo .infoTable .senderInfo .txtGuide1 {
            padding: 13px 0 19px;
            font-size: 12px;
        }


        /* 배송 정보 css */

        .deliverPage {
             width: 1100px ;
             }

        .mainFont3 h2 {
            padding: 60px 0 10px;
            font-weight: bold;
            font-size: 20px;
            line-height: 29px;
            border-bottom: 1px solid black;
        }

        .mainFont3 .miniFont {
          font-size: 13px;
          margin-left: 20px;
          font-weight: 400;
        }

        .adres {
            border-bottom: 1px solid #ddd;
            overflow: hidden;
            height: 180px;
            margin: 0;
            padding: 0;
        }
        .adres h3, .receive h3 {
            float: left;
            width: 190px;
            padding: 20px 0 0 20px;
            font-weight: bold;
            font-size: 14px;
            color: #000;
            line-height: 33px;
            letter-spacing: -0.3px;
        }

        #basicPlace {
            display: block;
            width: 68px;
            height: 22px;
            margin-right: 2px;
            padding: 0 7px 4px 6px;
            border-radius: 11px;
            background-color: rgba(198, 238, 238, 0.931);
            font-weight: bold;
            font-size: 12px;
            color: teal;
            line-height: 18px;
            vertical-align: top;
        }

        .adInfo {
            display: block;
            padding-top: 10px;
            font-size: 14px;
            color: #000;
            line-height: 20px;
            font-weight: 500;
            overflow: hidden;
            padding: 26px 20px 20px 0;
        }

        .adInfo .addr {
            display: inline-block;
            padding-top: 10px;
            font-size: 14px;
            color: #000;
            line-height: 20px;
            
        }

        .addrNum {
            font-weight: 500;
           
        }

        .adInfo .adName {
            display: block;
            padding-top: 6px;
            font-size: 14px;
            color: #666;
            line-height: 20px;
            font-weight: 500;
        }
         .adInfo .adTel {
           font-size: 14px;
            color: #666;
            line-height: 20px;
            font-weight: 500;
        }

        .adInfo #adChange , .receive #plChange  {
            border: 1px solid teal;
            border-radius: 3px;
            background-color: teal;
            color: #fff;
            width: 80px;
            margin-top: 20px;
            overflow: hidden;
            height: 34px;
            padding: 6px 0 10px;
            font-weight: bold;
            font-size: 14px;
            line-height: 18px;
            text-align: center;
        }

        .receive {
            height:147px ;
            border-bottom: 1px solid #ddd
        }

        .recvPlace {
            overflow: hidden;
            padding: 26px 20px 20px 0;
        }

        .recvPlace .palce {
            display: block;
            font-size: 14px;
            color: #ccc;
            line-height: 20px;
             font-weight: 400;
        }

        .recvPlace .nopalce {
            display: block;
            padding-top: 1px;
            font-size: 14px;
            color: #ccc;
            line-height: 20px;
             font-weight: 400;
        }

        .recvPlace .way {
            display: block;
            padding-top: 6px;
            font-size: 14px;
            color: #666;
            line-height: 20px;
        }


        /* 포장재 소개 꾸미기 이미지 css */

        .pojangImg {
            padding: 40px 0 0;
        }

        .pojangImg #pj {
            vertical-align: top;
            border: 0;
            max-width: 100%;
            cursor: pointer;
        }

        #modal-all {
            width: 100%;
        }

        .modal {
            width: 100%;
            margin: 0px auto;
            padding: 100PX;
            
        }

        .modal-body{
            margin: 0;
           padding: 0;
        }
        
        .modal-body #ibox{
            overflow: hidden;
            overflow-y: scroll;
            width: 440px;
            height: 500px;
        }

        .modal-dialog {
            width: 440px;
            height: auto;
            overflow: hidden;
            border-radius: 10px;
        }

        #myModal #pj2 {
            width: 440px;
            margin: 0;
            padding: 0;
        }

        .modal-footer {
         overflow: hidden;
         padding:20px;
         width: 100%;
         text-align: center;
         border-top: none;
       }

        .modal-footer #ok {
           width:380px ;
           height: 50px;
           color: white;
           background-color: teal;
           border: 1px solid white;
           border-radius: 3px;
           font-weight: bold;

       }


       /* 적릭금 css */

       .mileagePage {
             width: 742px ;
             border-bottom: 1px solid #ddd;
             }

        .mainFont4 h2 {
            padding: 60px 0 10px;
            font-weight: bold;
            font-size: 20px;
            line-height: 29px;
            border-bottom: 1px solid black;
        }
  
        .mlTable th {
            width: 190px;
            padding: 22px 0 0 20px;
            /* padding:10px; */
            font-size: 14px;
            font-family: 'Noto Sans';
            font-weight: 700;
            vertical-align: top;
           
        }

        .mlTable td  {
            padding: 8px;
            position: relative;
            /* padding: 16px 0 0 0; */
            vertical-align: top;
        }

        .mlTable .usePoint > label {
            margin-left: 15px;
            font-size: 12px;
            
        }

        .mlTable .usePoint .myPoint {
            text-align: right;
        }

        .mlTable .usePoint > label > #mlCheckbox {
            width: 15px;
            height: 15px;
            position: relative;
            top: 3px;
        }

        .txtMl {
            display: block;
            padding: 3px 0 0 0;
            font-size: 12px;
            line-height: 18px;
            letter-spacing: -0.2px;
            font-weight: bold;
        }
        .txtMl2 {
            display: block;
            padding: 10px 0 0 0;
            font-size: 12px;
            line-height: 18px;
            letter-spacing: -0.2px;
        }

        /* 결제하기 css */
        
        .payPage {
             width: 742px ;
             border-bottom: 1px solid #ddd;
             }

        .mainFont5 h2 {
            padding: 60px 0 10px;
            font-weight: bold;
            font-size: 20px;
            line-height: 29px;
            border-bottom: 1px solid black;
        }
  
        .payTable th {
            width: 190px;
            padding: 22px 0 0 20px;
            /* padding:10px; */
            font-size: 14px;
            font-family: 'Noto Sans';
            font-weight: 700;
            vertical-align: top;
           
        }

        .payTable td  {
            padding: 20px;
            position: relative;
            /* padding: 16px 0 0 0; */
            vertical-align: top;
        }

     
        .cdsel select {
            width: 190px;
            height: 34px;
            margin-right:10px ;
        }

      

        .noticePay {
            padding: 42px 0 0 16px;
        }

        .payNotice ul {
            list-style: none;
            /* padding: 42px 0 0 16px; */
            margin: 0;
            margin-right: 60px;
            padding: 0;
            font-size: 11px;
        }

        .noGoods th {
            width: 190px;
            padding: 22px 0 0 20px;
            font-size: 14px;
            font-family: 'Noto Sans';
            font-weight: bold;
            vertical-align: top;
        }

        .noGoods td {
            padding-top: 23px;
        }

        .noGoods .tdcheck {
            display: inline-block;
            padding: 0 18px 0 6px;
            font-size: 14px;
            color: #000;
            line-height: 18px;
            cursor: pointer;
            white-space: nowrap;
            font-weight: normal;
        }

        .noGoods .tdcheck2 {
            display: inline-block;
            padding: 0 18px 0 6px;
            font-size: 14px;
            color: #000;
            line-height: 18px;
            cursor: pointer;
            white-space: nowrap;
            font-weight: normal;
        }


        /* 개인정보 수집 제공 css */

        .perinfo {
             width: 1100px ;
             }

        .personalInfo h2 {
            padding: 60px 0 10px;
            font-weight: bold;
            font-size: 20px;
            line-height: 29px;
            border-bottom: 1px solid black;
        }

        .infoEss .agreeCheck #essCheck {
           margin-right:5px ;
           width: 15px;
           height: 15px;
        }
        
        .txtEss {
            font-size: 14px;
            line-height: 18px;
            letter-spacing: 0;
            cursor: pointer;
        }

        .infoEss ul {
            list-style: none;
            overflow: hidden;
            width: 100%;
            clear: both;
            margin: 0px;
            padding:0px 0px 0px 22px;

        }

        .infoEss li {
            padding-top: 1px;
        }

        .infoEss li .subagtxt {
            font-size: 12px;
            line-height: 16px;
            letter-spacing: 0;
        }

        .infoEss li .emph {
            color: #999;
            font-size: 12px;
            letter-spacing: -0.3px;
        }

        .infoEss li .termsMo {
            margin: 0;
            padding:0 0 0 10px;
            font-size: 12px;
            color: teal;
            cursor: pointer;

        }

        .infoEss li .termsMo2 {
            margin: 0;
            padding:0 0 0 6px;
            font-size: 12px;
            color: teal;
            cursor: pointer;
        }

       #rarrow {
            font-size: 10px;
             color: rgb(110, 110, 110);
        }


        /* 개인정보 동의 madal css */

        .modal-header {
            border-bottom: none;
        }

       #myModalLabel2 {
            font-size: 30px;
            font-weight: 500;
            letter-spacing: -0.5px;
            border-bottom: none;
            padding: 20px;
        }

        .prInfo_agree {
            overflow: hidden;
            overflow-y: auto;
            padding: 0 30px;
            color: #333; 
        }

        #tblAgreePRINFO {
            border-collapse: collapse;
            border: 1px solid #aaaaaa;
            padding: 0px;
            line-height: 35px;
            height: 35px;
            letter-spacing: -0.3px;
            width: 380px;
            margin: 0;
        }

        #tblAgreePRINFO th {
            background-color: #f5f5f5;
            width: 195px;
            font-size: 13px;
            font-weight: bold;
        }
        #tblAgreePRINFO td, #tblAgreePRINFO th {
            border: 1px solid #aaa;
            text-align: center;
            }
            #tblAgreePRINFO td {
                line-height: 18px;
                font-size: 12px;
                height: 100px;
                overflow: hidden;
            }

        #pAgreePRINFO { 
            font-size: 13.8px; 
            letter-spacing: -0.3px; 
            text-align:left;
            margin-top: 20px;
            margin: 20px 0 0 ;
            padding: 0 30px;
            font-weight:400 ;
            }

            .modal-footer #agOk {
           width:380px ;
           height: 50px;
           color: white;
           background-color: teal;
           border: 1px solid white;
           border-radius: 3px;
           font-weight: bold;
           margin: 30px 0px 10px;
       }

       /* 결제대행 modal css */

       #myModalLabel3 {
            font-size: 30px;
            font-weight: 500;
            letter-spacing: -0.5px;
            border-bottom: none;
            padding: 20px;
        }

      
    
        .modal-body3 .mo3title {
            font-weight: 700;
            font-size: 18px;
            margin-bottom: 15px;
            padding: 0 20px;
        }

        .modal-body3 .mo3sub {
            display: block;
            padding: 20px 0 10px 20px;
        }

        .termsAll {
            height: 272px;
            overflow: hidden;
            overflow-y: auto;
            padding: 0 20px;
        }

        .termsAll p {
            padding: 0 20px;
            padding: 30px 0 14px;
            position: relative;
        }

     
        /* 결제하기 버튼 css */
        .realPay {
            text-align: center;
        }
        .realPay #payNow {
            width: 200px;
            height: 48px;
            background-color: teal;
            color: white;
            font-weight: bold;
        }

        /* 결제금액  css */

        .sticky {
             /* width: 742px ; */
             /* position: absolute; */
             /* right: -800px;
             top: 1700px;
             width: 100%;
             height: 485px; */
             position: relative;
                float: right;
                width: 284px;
                height:0px;
                top: -970px;
             }

        .titleFont5 h2 {
            padding: 60px 0 10px;
            font-weight: bold;
            font-size: 20px;
            line-height: 29px;
            border-top: none;
        }

        .stTool {
            /* width: 100%; */
            width: 280px;
            padding: 17px 0px 18px 17px;
            background-color: #fafafa;
            border: 2px solid #f2f2f2;
            margin: 0;
            height: 321px;
        }

        .stTool div {
            /* padding: px; */
        }

        .stTool .tolTit {
            padding-top: 0;
            padding-bottom: 30px;
             width: 250px;
             font-size: 16px;
             vertical-align: top;
             float: left;
            
            
        }
        .stTool #ortxtOr {
            padding-bottom: 10px;
        }

        .stTool .tolSub {
             text-align: right; 
           
        }

        .stTool .toool {
            display: inline-block;
            float: right;
            font-size: 16px;
        }

        .stTool .subTool {
            display: inline-block;
            float: right;
        }
      

        .stTool .detlSub {
            font-size: 14px;
            color: #999;
            line-height: 20px;
             padding: 0 10px 10px 10px;
        }

        .tool4 #tolSumNum {
            font-size: 22px;
        }

        .save {
            float: right;
            padding-right: 10px;
        }

        .save .jukrip {
            width: 30px;
            height: 18px;
            margin-right: 2px;
            border: 1px solid #e8a828;
            border-radius: 10px;
            background-color: #ffbf00;
            font-weight: 700;
            font-size: 10px;
            color: #fff;
            line-height: 18px;
            text-align: center;
            vertical-align: 1px;
            display: inline-block;
          
          
        }

        .save .getpoint {
            font-size: 12px;
        }

        






    </style>
   

<!-- body -->
<body>

    <!-- 자신의 내용은 여기부터 추가하면 됩니다. -->
    <!-- 정희수 -->

    <div class="orderPage">
    <div class="mainFont">
        <h2>주문서</h2>
        <div class="subFont">주문하실 상품명 및 수량을 정확하게 확인해 주세요.</div>
    </div>
    
    <div class="orderbody">
        <h2 class="goodsInfo">상품 정보</h2>
        <div class="orderGoodsList" >
                      
            <div id="detailList">
            	<form method="POST" action="/mh/user/product/orderpageok.do" id="orderproduct">
                <table class="tbl1" >
                    <caption style="display: none;">상품 정보 상세보기</caption>
                    <thead>
                        <tr >
                            <th class="gongback"></th>
                            <th class="sangpuomInfo">상품 정보</th>
                            <th class="sangpuomSum">상품금액</th>
                        </tr>
                       </thead>
                        <c:forEach items="${list}" var="dto">
                        <tbody>
                        <tr>
                            <td class="infoSmImg">
                            	<input type="hidden" class="pseq" value=${dto.seq } name="pseq">
                                <img src="${dto.img }" class="detailImg" alt="${dto.name}">
                            </td>
                            <td class="infoInfo">
                                <div class="detalName">${dto.name}</div>
                                <input type="hidden" name="orpdname" value="${dto.name}">
                                <div class="detalInfo">
                                    <span class="danga">${dto.qty}개 / 개 당 ${dto.price}원</span>
                                    <input type="hidden" name="orpdqty" value="${dto.qty}">
                                </div>
                            </td>
                            <td class="detalPrice">
                               ${dto.price * dto.qty}
                            </td>
                         </tr>
                       </c:forEach>
                        </tbody>
                    	
                </table>
            </div>
            
           
        </div>
       
    </div> <!-- 상품정보 끝 -->


    <div class="jumoonInfo">
        <div class="mainFont2">
            <h2>주문자 정보</h2>
        </div>
        <div class="ordererInfo">
            <table class="infoTable">
                <tbody>
                    <tr class="senderName">
                        <th>보내는분 *</th>
                        <td class="senderInfo">
                            <input type="text" name="nameOrder" value="${dto.memname}" class="nameSender" readonly>
                        </td>
                    </tr>

                    <tr class="senderTel">
                        <th>휴대폰 *</th>
                        <td class="senderInfo">
                            <input type="text" name="nameOrder" value="${dto.memtel}" class="telSender" readonly>
                        </td>
                    </tr>

                    <tr class="senderEmail">
                        <th>이메일 *</th>
                        <td class="senderInfo">
                            <input type="text" name="nameOrder" value="${dto.mememail}" class="emailSender" readonly>
                            <div class="txtGuide1">
                                이메일을 통해 주문처리과정을 보내드립니다.
                                <div class="txtGuide2">
                                    정보 변경은 마이허리 > 개인정보 수정 메뉴에서 가능합니다.
                                </div>
                            </div>
                        </td>
                    </tr>

                </tbody>
            </table>
        </div>
        </div> <!--주문자 정보 끝-->

    <div class="deliverPage">
        <div class="mainFont3">
            <h2>배송 정보
                <span class="miniFont">
                    *배송 휴무일: 택배 배송(일요일)
                </span>
            </h2>
        </div>

        <div class="adres">
            <h3>배송지</h3>

            <div class="adInfo">
                <span class="badge default" id="basicPlace">기본배송지</span>
                <span class="addr">${dto.memaddress}</span>
                <span class="addrNum">[01861]</span>
                <div class="adName">${dto.memname},<span class="adTel">${dto.memtel}</span></div>
                <button class="btn btn-default" id="adChange">변경</button>
                
            </div>
        </div>

        <div class="receive">
            <h3>받으실 장소</h3>
            <div class="recvPlace">
                <div class="place" >문 앞</div>
                <div class="way" >출입방법: 공동현관 비밀번호</div>
                <button class="btn btn-default" id="plChange">변경</button>
            </div>
        </div>

    </div> <!-- 배송 정보 페이지 끝-->



    <div class="pojangImg">
        <img src="/mh/images/pojang2.jpg" id="pj" data-toggle="modal" data-target="#myModal" >
        <!-- IMG 클릭 Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                	<div id="ibox">
                	<img src="/mh/images/pojang.jpg" id="pj2">
                	</div>
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="ok">확인</button>
                </div>
            </div>
            </div>
        </div>
    </div> <!--꾸미기 이미지 끝-->



    <div class="mileagePage">
        <div class="mainFont4">
            <h2>적립금</h2>
        </div>
        <table class="mlTable">
            <tbody>
                <tr class="useMl">
                    <th>적립금 적용</th>
                    <td class="usePoint">
                        <input type="text" value="0" class="myPoint" >
                        <span>원</span>
                        <label class="checkMl">
                            <input type="checkbox" id="mlCheckbox">
                            <span class="txtCheck">
                                모두사용
                            </span>
                        </label>
                        <div class="txtMl">
                            <span>보유적립금:</span>
                            
                            <span class="havePoint">${dto.memmile}</span> 
                            <span>원</span>
                            <div class="txtMl2">
                                *적립금 내역: 마이허리 > 적립금
                            </div>
                        </div>
                    </td>
                </tr>                 
            </tbody>               
        </table>
    </div> <!--적립금 페이지 끝-->


    <div class="payPage">
        <div class="mainFont5">
            <h2>결제 수단</h2>
        </div>
        <table class="payTable">
            <tbody>
                <tr class="cdPay">
                    <th>신용결제</th>
                    <td class="cdcd">
                        <input type="radio" class="pCheck" checked name="howPay">
                        <span>신용카드</span>
                        <div class="cdsel">
                            <select name="cardCode" class="cdList"  >
                                <option disabled >카드를 선택해 주세요.</option>
                                <option value="61" >현대</option>
                                <option value="41" >신한</option>
                                <option value="31" >비씨</option>
                                <option value="11" >KB국민</option>
                                <option value="51" >삼성</option>
                                <option value="36" >씨티</option>
                                <option value="71" >롯데</option>
                                <option value="21" >하나(외한)</option>
                                <option value="91" >NH채움</option>
                                <option value="33" >우리</option>
                                <option value="34" >수협</option>
                                <option value="46" >광주</option>
                                <option value="35" >전북</option>
                                <option value="42" >제주</option>
                                <option value="62" >신협체크</option>
                                <option value="38" >MG새마을체크</option>
                                <option value="39" >저축은행체크</option>
                                <option value="37" >우체국카드</option>
                                <option value="30" >KDB산업은행</option>
                                <option value="15" >카카오뱅크</option>
                            </select>
                            <select name="lumpSum" class="lumpList">
                                <option disabled >할부기간을 선택해 주세요.</option>
                                <option value="0"  >일시불</option>
                        </div>
                    </td>
                </tr>
                
                <tr class="cdPay">
                    <th>무통장입금</th>
                    <td class="mooDeposit">
                        <input type="radio" class="pCheck" name="howPay">
                        <span>무통장입금</span>
                    </td>
                </tr>  

                <tr class="payNotice">
                    
                    <td colspan="2" class="noticePay">
                        <ul>
                            <li>※ 고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰에서 가입한 LG데이콤의 구매안전(에스크로) 서비스를 이용하실 수 있습니다.</li>
                            <li>※ 무통장입금 결제 선택시 결제하기 창에 무통장 입금 번호가 출력됩니다. 일주일 내에 입금하여주시길 바랍니다. 일주일 후 주문이 자동취소됩니다.</li>
                            <li>※ 보안강화로 Internet Explorer 8 미만 사용 시 결제창이 뜨지 않을 수 있습니다. </li>
                        </ul>
                    </td>
                </tr>  
            </tbody>               
        </table>
    </div> <!--결제 수단 페이지 끝-->

    <div class="ifnoGoods">
        <table class="noGoods">
            <tbody>
                <tr>
                    <th>미출고 시 조치방법*</th>
                    <td>
                        <label class="tdcheck">
                            <input type="radio" id="mick" checked name="mck">
                            결제수단으로 환불
                        </label>
                        <label class="tdcheck2">
                            <input type="radio" id="mick" name="mck">
                            상품 입고 시 배송
                        </label>
                    </td>
                </tr>
            </tbody>
        </table>
    </div> <!--상품 미출고시 체크박스 선택  div 끝-->


<div class="perinfo">
    <div class="personalInfo">
        <h2>개인정보 수집/제공*</h2>
    </div>
        <table class="noGoods">
            <tbody>
                <tr>
                    <td class="perAgree">
                        <div class="infoEss">
                            <label class="agreeCheck">
                                <input type="checkbox" name="ordAgree" id="essCheck">
                                <span class="txtEss">
                                    결제 진행 필수 동의
                                </span>
                            </label>
                            <ul class="agreeList">
                                <li>
                                    <span class="subagtxt">
                                        개인정보 수집 · 이용 동의
                                    </span>
                                    <span class="emph">(필수)</span>
                                    <span class="termsMo"  data-toggle="modal" data-target="#myModal2" >
                                        약관확인
                                        <span class="glyphicon glyphicon-menu-right" id="rarrow"></span>
                                    </span>
                                </li>
                                <li>
                                    <span class="subagtxt">
                                       결제대행 서비스 약관 동의
                                    </span>
                                    <span class="emph">(필수)</span>
                                    <span class="termsMo2"  data-toggle="modal" data-target="#myModal3">
                                        약관확인
                                        <span class="glyphicon glyphicon-menu-right" id="rarrow"></span>
                                    </span>
                                </li>
                            </ul>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

<!-- 개인정보수집 동의 Modal2 -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="myModalLabel2"> 개인정보 수집 · 이용 동의(필수)</h4>
        </div>
        <div class="modal-body">
            <div class="prInfo_agree">
                <table id="tblAgreePRINFO">
                    <tr>
                        <th>수집 목적</th>
                        <th>수집 항목</th>
                        <th>보유 기간</th>
                    </tr>
                    <tr>
                        <td>온라인 쇼핑 구매자에 대한 상품 결제 및 배송</td>
                        <td>결제정보, 수취인명, 휴대전화번호, 수취인 주소</td>
                        <td>업무 목적 달성 후 파기(단, 타 법령에 따라 법령에서 규정한 기간동안 보존)</td>
                    </tr>
                </table>
                <p id="pAgreePRINFO">서비스 제공을 위해서 필요한 최소한의 개인정보이므로 동의를 해 주셔야 서비스를 이용하실 수 있습니다.</p>
            </div>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" id="agOk">확인</button>
        </div>
      </div>
    </div>
  </div>

  <!--결제대행 동의 Modal3 -->
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="myModalLabel3">LG유플러스 전자결제 서비스 이용약관</h4>
        </div>
        <div class="modal-body3">
            <div class="termsAll">
          <h5 class="mo3title">전자금융거래 기본 약관(이용자용)</h6>
            <strong class="mo3sub">제1조 (목적)</strong>
            
           <p>
               이 약관은 전자지급결제대행서비스 및 결제대금예치서비스를 제공하는 주식회사 LG유플러스(이하 '회사'라 합니다)과 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함으로써 전자금융거래의 안정성과 신뢰성을 확보함에 그 목적이 있습니다.
           </p> 

            <strong class="mo3sub">제2조 (용어의 정의)</strong>
            <p>
                이 약관에서 정하는 용어의 정의는 다음과 같습니다.

            </p>
            <br>
            <br>
            <p>
                
                ① 전자금융거래'라 함은 회사가 전자적 장치를 통하여 전자지급결제대행서비스 및 결제대금예치서비스(이하 '전자금융거래 서비스'라고 합니다)를 제공하고, 이용자가 회사의 구성원과 직접 대면하거나 의사소통을 하지 아니하고 전산화된 방식으로 이를 이용하는 거래를 말합니다.
                <br>
    
                ② '전자지급결제대행 서비스'라 함은 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 서비스를 말합니다.
                <br>
    
                ③ ‘결제대금예치서비스'라 함은 이용자가 재화의 구입 또는 용역의 이용에 있어서 그 대가(이하 '결제대금'이라 한다)의 전부 또는 일부를 재화 또는 용역(이하 '재화 등'이라 합니다)을 공급받기 전에 미리 지급하는 경우, 회사가 이용자의 물품수령 또는 서비스 이용 확인 시점까지 결제대금을 예치하는 서비스를 말합니다.
                <br>
    
                ④ '이용자'라 함은 이 약관에 동의하고 회사가 제공하는 전자지급결제대행 서비스를 이용하는 자를 말합니다.
                <br>
    
                ⑤ '접근매체'라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함한다), '전자서명법'상의 인증서, 금융기관 또는 전자금융업자에 등록된 이용자번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등 전자금융거래법 제2조 제10호에서 정하고 있는 것을 말합니다.
                <br>
    
                ⑥ '거래지시'라 함은 이용자가 전자금융거래계약에 따라 금융기관 또는 전자금융업자에게 전자금융거래의 처리를 지시하는 것을 말합니다.
                <br>
    
                ⑦ '오류'라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 전자금융거래계약 또는 이용자의 거래지시에 따라 이행되지 아니한 경우를 말합니다.

            </p>    

            <strong class="mo3sub">제3조 (약관의 명시 및 변경)</strong>
            <p>
                
                ① 회사는 이용자가 전자지급결제대행 서비스를 이용하기 전에 이 약관을 게시하고 이용자가 이 약관의 중요한 내용을 확인할 수 있도록 합니다.
                <br>
    
                ② 회사는 이용자의 요청이 있는 경우 서면제공 방식 또는 전자문서의 전송방식에 의하여 본 약관의 사본을 이용자에게 교부합니다.
                <br>
                ③ 회사가 약관을 변경하는 때에는 그 시행일 1월 전에 변경되는 약관을 지급결제정보 입력화면 및 회사의 홈페이지에 게시함으로써 이용자에게 공지합니다.
                
            </p>            

            <strong class="mo3sub">제4조 (전자지급결제대행서비스의 종류)</strong>
            <p>
                
                회사가 제공하는 전자지급결제대행서비스는 지급결제수단에 따라 다음과 같이 구별됩니다.
                <br>
                
                ① 신용카드결제대행서비스: 이용자가 결제대금의 지급을 위하여 제공한 지급결제수단이 신용카드인 경우로서, 회사가 전자결제시스템을 통한 신용카드 지불정보의 송,수신 및 결제대금의 정산을 대행하거나 매개하는 서비스를 말합니다.
                <br>
                ② 계좌이체대행서비스: 이용자가 결제대금을 회사의 전자결제시스템을 통하여 금융기관에 등록한 자신의 계좌에서 출금하여 원하는 계좌로 이체할 수 있는 실시간 송금 서비스를 말합니다.
                <br>
    
                ③ 가상계좌서비스: 이용자가 결제대금을 현금으로 결제하고자 경우 회사의 전자결제시스템을 통하여 자동으로 이용자만의 고유한 일회용 계좌의 발급을 통하여 결제대금의 지급이 이루어지는 서비스를 말합니다.
                <br>
    
                ④ 기타: 회사가 제공하는 서비스로서 지급결제수단의 종류에 따라 '휴대폰 결제대행서비스', 'KT전화(ARS,폰빌)결제대행서비스', '상품권결제대행서비스'등이 있습니다.
            </p>



            <strong class="mo3sub">제5조 (결제대금예치서비스의 내용)</strong>
            <p>
                
                ① 이용자(이용자의 동의가 있는 경우에는 재화 등을 공급받을 자를 포함합니다. 이하 본조에서 같습니다)는 재화 등을 공급받은 사실을 재화 등을 공급받은 날부터 3영업일 이내에 회사에 통보하여야 합니다.
                <br>
    
                ② 회사는 이용자로부터 재화 등을 공급받은 사실을 통보 받은 후 회사와 통신판매업자간 사이에서 정한 기일 내에 통신판매업자에게 결제대금을 지급합니다.
                <br>
    
                ③ 회사는 이용자가 재화 등을 공급받은 날부터 3영업일이 지나도록 정당한 사유의 제시 없이 그 공급받은 사실을 회사에 통보하지 아니하는 경우에는 이용자의 동의 없이 통신판매업자에게 결제대금을 지급할 수 있습니다.
                <br>
    
                ④ 회사는 통신판매업자에게 결제대금을 지급하기 전에 이용자에게 결제대금을 환급받을 사유가 발생한 경우에는 그 결제대금을 소비자에게 환급합니다.
                <br>
    
                ⑤ 회사는 이용자와의 결제대금예치서비스 이용과 관련된 구체적인 권리,의무를 정하기 위하여 본 약관과는 별도로 결제대금예치서비스이용약관을 제정할 수 있습니다.
            </p>            


            <strong class="mo3sub">제6조 (접근매체의선정,관리 등)</strong>
            <p>
                
                ① 회사는 전자지급결제대행 서비스 제공 시 접근매체를 선정하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인할 수 있습니다.
                <br>
    
                ② 이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다.
                <br>
    
                ③ 이용자는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.
                <br>
    
                ④ 회사는 이용자로부터 접근매체의 분실이나 도난 등의 통지를 받은 때에는 그 때부터 제3자가 그 접근매체를 사용함으로 인하여 이용자에게 발생한 손해를 배상할 책임이 있습니다.
            </p>            

            <strong class="mo3sub">제7조 (회사의 책임)</strong>
            <p>
                
                ① 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 있습니다. 다만, 이용자가 제6조 제2항에 위반하거나 제3자가 권한 없이 이용자의 접근매체를 이용하여 전자금융거래를 할 수 있음을 알았거나 알 수 있었음에도 불구하고 이용자가 자신의 접근매체를 누설 또는 노출하거나 방치한 경우 그 책임의 전부 또는 일부를 이용자가 부담하게 할 수 있습니다.
                <br>
    
                ② 회사는 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고로 인하여 이용자에게 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만, 본조 제1항 단서에 해당하거나 법인('중소기업기본법' 제2조 제2항에 의한 소기업을 제외한다)인 이용자에게 손해가 발생한 경우로서 회사가 사고를 방지하기 위하여 보안절차를 수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우 그 책임의 전부 또는 일부를 이용자가 부담하게 할 수 있습니다.
                <br>
                ③ 회사는 이용자로부터의 거래지시가 있음에도 불구하고 천재지변, 회사의 귀책사유가 없는 정전, 화재, 통신장애 기타의 불가항력적인 사유로 처리 불가능하거나 지연된 경우로서 이용자에게 처리 불가능 또는 지연사유를 통지한 경우(금융기관 또는 결제수단 발행업체나 통신판매업자가 통지한 경우를 포함합니다)에는 이용자에 대하여 이로 인한 책임을 지지 아니합니다.
                <br>
    
                ④ 회사는 본조 제4항의 경우 전자지급결제대행 서비스의 제공을 일시적으로 중단할 수 있습니다.
                <br>
    
                ⑤ 회사는 전자금융거래를 위한 전자적 장치 또는 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’ 제2조제1항제1호에 따른 정보통신망에 침입하여 거짓이나 그 밖의 부정한 방법으로 획득한 접근매체의 이용으로 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다.
            </p>            

            <strong class="mo3sub">제8조 (거래내용의 확인)</strong>
            <p>
                
                ① 회사는 이용자와 미리 약정한 전자적 방법을 통하여 이용자의 거래내용(이용자의 '오류정정 요구사실 및 처리결과에 관한 사항'을 포함합니다)을 확인할 수 있도록 하며, 이용자의 요청이 있는 경우에는 요청을 받은 날로부터 2주 이내에 전자적양식, 모사전송, 서면 등의 방법으로 거래내용에 관한 서면을 교부합니다.
                <br>
    
                ② 회사가 이용자에게 제공하는 거래내용 중 거래계좌의 명칭 또는 번호, 거래의 종류 및 금액, 거래상대방을 나타내는 정보, 거래일자, 전자적 장치의 종류 및 전자적 장치를 식별할 수 있는 정보와 해당 전자금융거래와 관련한 전자적 장치의 접속기록은 5년간, 건당 거래금액이 1만원 이하인 소액 전자금융거래에 관한 기록, 전자지급수단 이용시 거래승인에 관한 기록, 이용자의 오류정정 요구사실 및 처리결과에 관한 사항은 1년간의 기간을 대상으로 하되, 회사가 가맹점에 대한 전자지급결제대행 서비스 제공의 대가로 수취한 수수료에 관한 사항은 제공하는 거래내용에서 제외됩니다.
                <br>
                ③ 이용자가 본조 제1항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수 있습니다.
                <br>
    
                - 주소: 서울특별시 한강대로 32 LG유플러스 결제사업팀
                <br>
    
                - 이메일 주소: ecredithelp@lguplus.co.kr
                <br>
    
                - 전화번호: 1544-7772
            </p>            

            <strong class="mo3sub">제9조 (오류의 정정 등)</strong>
            <p>
                
                ① 이용자는 전자지급결제대행 서비스를 이용함에 있어 오류가 있음을 안 때에는 회사에 대하여 그 정정을 요구할 수 있습니다.
                <br>
    
                ② 회사는 전항의 규정에 따른 오류의 정정요구를 받은 때에는 이를 즉시 조사하여 처리한 후 정정요구를 받은 날부터 2주 이내에 그 결과를 이용자에게 알려 드립니다.
                <br>
    
                ③ 이용자는 다음의 주소 및 전화번호로 본 조항상의 정정 요구를 할 수 있습니다.
                <br>
    
                - 주소: 서울특별시 한강대로 32 LG유플러스 결제사업팀
                <br>
    
                - 이메일 주소: ecredithelp@lguplus.co.kr
                <br>
    
                - 전화번호: 1544 - 7772
            </p>            

            <strong class="mo3sub">제10조 (전자지급결제대행 서비스 이용 기록의 생성 및 보존)</strong>
            <p>
                
                ① 회사는 이용자가 전자지급결제대행 서비스 이용거래의 내용을 추적, 검색하거나 그 내용에 오류가 발생한 경우에 이를 확인하거나 정정할 수 있는 기록을 생성하여 보존합니다.
                <br>
                ② 전항의 규정에 따라 회사가 보존하여야 하는 기록의 종류 및 보존방법은 제8조 제2항에서 정한 바에 따릅니다.
            </p>


          </div>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" id="agOk">확인</button>
         
        </div>
      </div>
    </div>
  </div> <!--모달 끝-->


<div class="realPay">
    <input type="button" class="btn btn-default" id="payNow" value="결제하기">
    <!-- <button type="submit" class="btn btn-default" id="payNow">결제하기</button> -->
</div> <!--결제하기 버튼 끝-->



<div class="sticky">
    <div class="titleFont5">
        <h2>결제 금액</h2>
    </div>
    <div class="stTool">
     
        <div class="tool1">
            <div class="tolTit" id="ortxtOr">
                주문금액 
                <div class="toool">
                    <span class="tolSub" id="payPrice"> ${ogprice}</span>
                    <input type="hidden" name="orpayprice" value="${ogprice}">
                    <span class="tolSub">원</span>
                </div>
            </div>
                <div class="detlSub">└ 상품금액
                    <div class="subTool">
                            <span class="detlprice" id="ogPrice">${ogprice}</span>
                            <input type="hidden" name="pdogprice" value="${ogprice}">
                        <span class="detlprice">원</span>
                     
                    </div>
                </div>
                <div class="detlSub">└ 상품할인
                    <div class="subTool">
                        <span class="detlprice" id="salesprice">- ${salesprice}</span>
                        <input type="hidden" name="pdslprice" value="${salesprice}">
                        <span class="detlprice">원</span>
                    </div>
                </div>
            </div>

        <div class="tool2">
            <div class="tolTit">
                배송비
                <div class="toool">
                    <span class="tolSub">+ 0원</span>
                </div>
            </div>
        </div>

            <div class="tool3">
                <div class="tolTit">
                    적립금 사용
                    <div class="toool">
                        <span class="tolSub" id="orMail">0</span>
                        <input type="hidden" name="usemile" value="0" id="orMile">
                        <span class="tolSub">원</span>
                    </div>
                </div>
            </div>

      <div class="tool4">
          <div class="tolTit">
                  최종 결제 금액 
              <div class="toool">
                  <span class="tolSub" id="tolSumNum" >${finalprice}</span>
                  <input type="hidden" name="totalprice" value="${finalprice}" id="tolPay">
                  <span class="tolSub">원</span>
              </div>
         </div>

          <div class="save">
              <span class="txtJukrip">
                  <span class="jukrip">적립</span>
              </span>
              <span class="getpoint">
                  <span class="ifyoubuy">구매 시 </span>
                  <strong class="savenum">${finalprice}</strong>
                  <input type="hidden" name="savemile" value="${finalprice}" class="savenum">
                  <strong class="savewon">원 (0.5%) </strong>
              </span>
          </div>
      </div>
	
     </div>
</div> <!--결제금액 끝-->
</form>


<div style="clear: both;"></div>

</div> <!--전체 주문 페이지 끝 -->
    
    
  



    <!-- top button -->
    <a href="#" id="topbtn" style="border: 0px; outline: none;"></a>

    
    <!-- script start -->
    <script>

        // // 약관보기 클릭시 모달 뜨기
        $(".tremsMo").click(function(){
            $('#myModal2').modal(show)
        });

        $(".tremsMo2").click(function(){
            $('#myModal3').modal(show)
        });
        
       
      

        //적립금 모두사용 체크박스 클릭시 보유적립금 적용되기
        var check = true;
        $("#mlCheckbox").click(function(){
          if(check){
              $(".myPoint").val($(".havePoint").text());
              $("#orMail").text($(".havePoint").text());
              $("#orMile").val($(".havePoint").val());
              $("#tolSumNum").text(numberWithCommas(${finalprice - dto.memmile}));
              $("#tolPay").val(numberWithCommas(${finalprice - dto.memmile}));
            check = false;
          }  else  {
            $(".myPoint").val(0);
            $("#orMail").text(0);
            $("#orMile").val(0);
            $("#tolSumNum").text(numberWithCommas(${finalprice}));
            $("#tolPay").val(numberWithCommas(${finalprice}));
            check = true;
          }
      

        });

        //개인정보동의 클릭 안하고 결제하기 클릭시 경고문 출력
        $("#payNow").click(function(){
            if($("#essCheck").is(':checked')) {
                	$("#orderproduct").submit();
                 // 결제완료 페이지로 넘어가기
            }else {
                alert("개인정보 수집/제공에 동의해주세요.");
            }
        });

        
        //전화번호 '-' 넣기
         function telhyphen(th) {
           return th.toString().replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
       }
       
         $(function(){
        	 $(".telSender").each(function(index, item){
	        	var thth = $(item).val();
	        	$(item).val(telhyphen(thth));
	        	
	        })
         });
         
         
         $(function(){
        	 $(".adTel").each(function(index, item){
	        	var thth = $(item).text();
	        	$(item).text(telhyphen(thth));
	        	
	        })
         });
   
      
         
       //적립금 소수점 자르기
      $(function(){
 	        $('.savenum').each(function(index, item){
 	        	var temp = $(item).text();
 	        	$(item).text(Math.floor(parseInt(temp)*0.005));
 	        	
 	        })
         }); 
         
         
        // 천단위 , 찍기
        function numberWithCommas(x) {
           return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
       }
       	
        //상품 단가 , 찍기
        $(function(){
	        $('.danga').each(function(index, item){
	        	var temp = $(item).text();
	        	$(item).text(numberWithCommas(temp));
	        	
	        })
        });
     
        //상품금액 천단위로 , 찍기
        $(function(){
	        $('.detalPrice').each(function(index, item){
	        	var temp = $(item).text();
	        	$(item).text(numberWithCommas(temp));
	        	
	        })
        });
        
        
      //상품금액 천단위로 , 찍기
        $(function(){
	        $('.detalPrice').each(function(index, item){
	        	var temp = $(item).text();
	        	$(item).text(numberWithCommas(temp));
	        	
	        })
        });
      
      
      //결제하기 div 금액들  천단위로 , 찍기
        $(function(){
	        $('#payPrice').each(function(index, item){
	        	var temp = $(item).text();
	        	$(item).text(numberWithCommas(temp));
	        	
	        })
        });
      
        $(function(){
	        $('#ogPrice').each(function(index, item){
	        	var temp = $(item).text();
	        	$(item).text(numberWithCommas(temp));
	        	
	        })
        });
        
        
        $(function(){
	        $('#salesprice').each(function(index, item){
	        	var temp = $(item).text();
	        	$(item).text(numberWithCommas(temp));
	        	
	        })
        });
        
        
        $(function(){
	        $('#orMail').each(function(index, item){
	        	var temp = $(item).text();
	        	$(item).text(numberWithCommas(temp));
	        	
	        })
        });
        
        
        $(function(){
	        $('#tolSumNum').each(function(index, item){
	        	var temp = $(item).text();
	        	$(item).text(numberWithCommas(temp));
	        	
	        })
        });
        
        $(function(){
	        $('.havePoint').each(function(index, item){
	        	var temp = $(item).text();
	        	$(item).text(numberWithCommas(temp));
	        	
	        })
        });
        
        
        
       /*  //결제하기 버튼 클릭시 결제완료 alert뜨고, 메인화면으로 돌려보내기
        $("#payNow").click(function(){
        	alert("주문이 완료되었습니다.");
        	location.href="/mh/user/main/main.do";
        }) */
        
      
      
     
        


    </script>
    <script src="/mh/js/main.js"></script>


<!-- footer -->
<%@include file="/WEB-INF/views/inc/footer.jsp" %>
</body>
</html>