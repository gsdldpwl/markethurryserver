<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/inc/header.jsp" %>
<link rel="stylesheet" href="/mh/css/modal.css">

<style>

        /*  */
        #main {
            width: 1100px;
            margin: 50px auto;
        }

        hr {
            border: 2px solid #eee;
        }

        #tblQna th, #tblQna td {
            font-size: 14px;
            text-align: center;
            height: 30px;
        }
 
        #tblQna tbody tr:first-child th, #tblQna tbody tr:first-child td{
            border-top: 2px solid #08718E;
        }

        #btnAddQna {
            border-style: none;
            background-color: #08718E;
            border-radius: 3px;
            color: white;
            font-size:15px;
            height: 40px;
            width: 100px;
        }

        #btnCancelQna {
            border-style: none;
            background-color: #eee;
            border-radius: 3px;
            /* color:  #337ab7; */
            font-size:15px;
            height: 40px;
            width: 100px;
        }

    </style>


</head>

<body>


<div id="main">
        <h3>상품 문의</h3>

        <!-- 상단 문의 안내사항 -->
        <ul id="header">
            <li>
                상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.
            </li>
            <li>
                배송관련, 주문(취소/교환/환불)관련 문의 및 요청 사항은 마이페이지 내 1:1 문의에 남겨주세요.
            </li>
        </ul>


        <!-- id값 바꾸기, 상품에 상품명들어가게 -->
        <!-- 상품 문의 테이블 -->
        
        
        
        <form method="POST" action="/mh/user/product/productqnaok.do">
        
        
        <table id="tblQna" class="table table-bordered" style="width: 1100px; margin-top: 20px;">
        
        	
            <tr>
                <th style="width: 30%;">상품</th>
                <td style="width: 70%; text-align: left;">
                    <span>${pdto.name}</span>
                    <input type="hidden" name="pseq" value="${pdto.seq}">
                </td>
            </tr>
            <tr>
                <th style="width: 30%;">제목</th>
                <td style="width: 70%">
                    <input type="text" class="form-control" id="tblTitle" name="title" style="height: 100%;" required>
                </td>
            </tr>
            
            <tr>
                <th style="width: 30%; height:455px;">내용</th>
                <td style="width: 70%">
                    <div class="divContent" style="height: 100%;">
                    <!-- <input type="text" class="form-control" style="height: 300px;"> -->
                    <textarea class="form-control" id="tblContent" name="content" style="height: 100%;" required>
상품문의 작성 전 확인해주세요!!

답변은 영업일 기준 2~3일 소요됩니다.
해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.
배송관련, 주문(취소/교환/환불)관련 문의 및 요청 사항은 마이페이지 내 1:1 문의에 남겨주세요.
    
- 제품
제품 상세정보는 상세 이미지 또는 상세정보에서 확인 가능합니다.

- 주문취소
입금 전 단계에서는 직접 취소 가능
상품 준비중 단계 이후에는 취소가 제한됩니다.
일부 예약 상품은 배송 3~4일 전에만 취소 가능합니다.
주문상품의 부분 취소는 불가능합니다. 전체 주문 취소 후 재구매 해주세요.

- 배송
배송일 및 배송시간 지정은 불가능합니다. (예약배송 포함)


※ 상세 개인정보가 문의 내용에 저장되지 않도록 주의해 주시기 바랍니다.
                    </textarea>
                </div>
                </td>
            </tr>
            <tr>
                <th style="width: 30%;">첨부 사진</th>
                <td style="text-align: left;">
                    <!-- 이미지 파일만 선택가능 -->
                    <input type="file" style="display: inline;" name="img" accept="image/*"> 
                </td>
            </tr>
        </table>
        
        

        <div style="text-align: center; margin-top: 50px">
            <input type="button" id="btnCancelQna" value="작성 취소" style="margin-right: 20px;">
            <button type="submit" id="btnAddQna">작성 완료</button>
        </div>

		</form>


    </div>
    
    <div id="modal"></div>
    
    <!--문의등록 완료-->
    <div class="modal_common productqnasuccess">
        <a href="javascript:;" class="close">X</a>
        <p class="title">알림메세지</p>
        <div class="con">문의등록 완료</div>
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

        // $("#menubar[0]").css("color","red");
        //$("#menubar > a").first().hide();
        //console.log($("#menubar > a").first);

        $("#menubar > a").first().mouseenter(function(event){
            console.log("click");

        });


        // 로고 클릭시 메인화면으로
        $("#brandlogo").click(function() {
            $(location).attr('href', '/mh/user/main/main.do');
        });


        
        // 텍스트 박스 포커스 가면 내용 사라짐
        $("#tblContent").focus(function() { 
            $(this).val("");
            $(".divContent").attr('class', 'emContent');  
            
        });

        // 내용 입력하면 ok로 변경(등록 가능한 상태)
        $("#tblContent").on("input", function() {
            $(".emContent").attr('class', 'okContent');
        });
            
      

        // 작성 취소 - 상품상세 페이지로 이동
        $("#btnCancelQna").click(function() {
        	history.back();
            /* $(location).attr('href', 'history.back();'); */
        });

        //작성 완료
         $("#btnAddQna").click(function() {
            // 위의 항목을 다 채웠는지 검사해야함
            if ($("#tblTitle").val() == "") {
                alert("제목을 입력하세요!");
            } else if (!($("#tblContent").parent().hasClass('okContent'))) {
                alert("내용을 입력하세요!");
            }

            //상품상세의 상품문의에 추가되게끔
        }); 

  
        

    </script>
    <script src="/mh/js/main.js"></script>
    <script src="/mh/js/modal.js"></script>


</body>
</html>