<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/inc/header.jsp" %>

    <style>

        * {outline: none;}

        #mainbox {
            width: 700px;
            margin: 50px auto;
        }

        #leaveTitle {
            text-align: center;
            padding-bottom: 30px;
            border-bottom: 2px solid #999;
            font-weight: bold;
        }

        #tblLeave {
            border-collapse: collapse;
        }
        
        #tblLeave th {
            width: 200px;
            padding-left: 10px;
        }

        #tblLeave td {
            padding: 10px;
            width: 500px;
        }

        .inputTxt {
            width: 300px;
            height: 40px;
            border: 1px solid #aaa;
            border-radius: 3px;
            padding: 0px 10px;
            font-size: 1.2em;
        }
        
        #tblLeave td span { padding-left: 5px; }
        #tblLeave td label:first-child {
            width: 250px;
            height: 30px;
            line-height: 30px;
        }

        .chbox {
            width: 15px;
            height: 15px;
        }

        #cancel {
            display: inline-block;
            width: 150px;
            height: 40px;
            border: #08718E 1px solid;
            color: #08718E;
            border-radius: 3px;
            margin: 30px auto;
            background-color: white;
        }

        #leave {
            display: inline-block;
            width: 150px;
            height: 40px;
            /* font-size: 1.3em; */
            background-color: #08718E;
            color: white;
            border: none;
            border-radius: 3px;
            margin: 30px auto;
        }

        
        /* 모달 관련 css */
        #modal {
            display:none;
            position:fixed; 
            width:100%; height:100%;
            top:0; left:0; 
            background:rgba(0,0,0,0.5);
            z-index: 1;
        }

        .modal_common {
            display:none;
            position:fixed;
            top:50%; left:50%;
            transform: translate(-50%,-50%);
            width:500px;
            height:300px;
            background:#fff;
            z-index: 2;
        }

        .modal_common .title{
            font-size:14px; 
            padding: 20px 0px; 
            background : white;
            border-bottom: 2px solid #ccc;
            margin: 10px 40px;
            color: #08718E;
            font-weight: bold;
        }

        .modal_common .con {
            font-size:14px;
            height: 130px;
            line-height:70px;
            padding: 30px 40px;
            text-align: center;
        }
        
        .modal_common .con_agree {
            
            padding: 15px 40px;
            height: 130px;
            text-align: center;
        }

        .modal_common .close {
            display:block;
            position:absolute;
            width:30px; height:30px;
            text-align:center; line-height: 30px;
            text-decoration:none;
            color:#000; font-size:25px; font-weight: bold;
            right:30px; top:20px;
        }

        .modal_common > div:last-child { 
            background-color: #f5f5f5;
            height: 88px ;
        }

        .modal_common .yes {
            display: block;
            background-color: #08718E;
            color: white;
            border: none;
            width: 150px;
            height: 40px;
            position: relative;
            left: 175px;
            top: 23px;
            padding: 0px; margin: 0px;
        }

        .modal_common .yes_agree {
            display: block;
            background-color: white;
            color: #08718E;
            border: none;
            width: 150px;
            height: 40px;
            position: relative;
            left: 175px;
            top: 23px;
            padding: 0px; margin: 0px;
        }


    </style>
</head>

<body>

    <!-- 자신의 내용은 여기부터 추가하면 됩니다. -->

    <div id="mainbox">
        <div id="leaveTitle">
            <h2>회원탈퇴안내</h2>
        </div>
        <table id="tblLeave">
            <tr>
                <th>회원탈퇴안내</th>
                <td style="padding-top: 40px;">고객님께서 회원 탈퇴를 원하신다니 저희 쇼핑몰의 서비스가 많이 부족하고 미흡했나봅니다. 불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다.</td>
            </tr>
            <tr>
                <th></th>
                <td style="color: #08718E; font-weight: bold;">아울러 회원 탈퇴시의 아래 사항을 숙지하시기 바랍니다.</td>
            </tr>
            </tr>
            <tr>
                <th></th>
                <td>1. 회원 탈퇴 시 고객님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 고객정보 보호정책에따라 관리 됩니다.
                    <br>
                    2. 탈퇴 시 고객님께서 보유하셨던 적립금은 모두 삭제됩니다.
                    <br>
                    3. 회원 탈퇴 후 30일간 재가입이 불가능합니다.</td>
            </tr>
            <tr>
                <th>비밀번호 확인</th>
                <td>
                    <input type="password" id="inputPw" class="inputTxt">
                </td>
            </tr>
            <tr>
                <th>무엇이 불편하였나요?</th>
                <td>
                    <label class="chblist">
                        <input type="checkbox" id="inconv1" class="chbox">
                        <span>고객서비스(상담, 포장 등) 불만</span>
                    </label>
                    <label class="chblist">
                        <input type="checkbox" id="inconv2" class="chbox">
                        <span>배송불만</span>
                    </label>
                </td>
            </tr>
            <tr>
                <th></th>
                <td>
                    <label class="chblist">
                        <input type="checkbox" id="inconv3" class="chbox">
                        <span>교환/환불/반품 불만</span>
                    </label>
                    <label class="chblist">
                        <input type="checkbox" id="inconv4" class="chbox">
                        <span>방문 빈도가 낮음</span>
                    </label>
                </td>
            </tr>
            <tr>
                <th></th>
                <td>
                    <label class="chblist">
                        <input type="checkbox" id="inconv5" class="chbox">
                        <span>상품가격 불만</span>
                    </label>
                    <label class="chblist">
                        <input type="checkbox" id="inconv6" class="chbox">
                        <span>개인 정보유출 우려</span>
                    </label>
                </td>
            </tr>
            <tr>
                <th></th>
                <td>
                    <label class="chblist">
                        <input type="checkbox" id="inconv7" class="chbox">
                        <span>쇼핑몰의 신뢰도 불만</span>
                    </label>
                    <label class="chblist">
                        <input type="checkbox" id="inconv8" class="chbox">
                        <span>쇼핑 기능 불만</span>
                    </label>
                </td>
            </tr>
            <tr>
                <th></th>
                <td>
                    <textarea cols="50" rows="10" style="padding: 20px; resize: none; font-size: 1.2em; border: solid 1px #aaa; border-radius: 3px;" placeholder="고객님의 진심어린 충고 부탁드립니다."></textarea>
                </td>
            </tr>
        </table>
    </div>

    <div style="clear: both; margin: 0px auto; width: 405px; height: 100px; padding-left: 100px;">
        <input type="button" id="cancel" value="취소" onclick="location.href='/mh/user/mypage/info_pwcheck.do';">
        <input type="button" id="leave" value="탈퇴" onclick="location.href='/mh/user/mypage/info_leaveok.do';">
    </div>


    <!-- 비밀번호를 입력해 주십시오. -->
    <div id="modal"></div>
    <div class="modal_common plzInputPw">
        <a href="javascript:;" class="close">X</a>
        <p class="title">알림메세지</p>
        <div class="con">
            비밀번호를 입력해 주십시오.
        </div>
        <div>
            <input type="button" value="확인" href="javascript:;" class="yes">
        </div>
    </div>
            

    <!-- 서비스 불편사항을 1개 이상 체크하여 주십시오.. -->
    <div id="modal"></div>
    <div class="modal_common plzInputChb">
        <a href="javascript:;" class="close">X</a>
        <p class="title">알림메세지</p>
        <div class="con" style="line-height:30px;">
            서비스 불편사항을 1개 이상 체크하여 주십시오.
            <br>
            해당사항은 개선사항에 반영되어집니다.
        </div>
        <div>
            <input type="button" value="확인" href="javascript:;" class="yes">
        </div>
    </div>
            

<!-- footer -->
<%@include file="/WEB-INF/views/inc/footer.jsp" %>

    <!-- script start -->
    <script>

        // 취소 버튼 누를 시
        $("#cancel").click(function() {

        });
    
        // 탈퇴 버튼 누를 시
        $("#leave").click(function() {

            // 비밀번호가 맞으면 탈퇴 진행
            if ($("#inputPw").val() != 0) {

                // 체크박스에 체크된 것이 있는지 확인하기 위해.
                var chk = $(".chbox").is(":checked");
                if (chk) {
                    if (confirm("회원탈퇴를 하시면 회원님의 모든 데이터(개인정보 등)가 삭제되어집니다. 그래도 회원을 탈퇴하시겠습니까?")) {
                        // 회원 탈퇴 진행

                    } else {
                        // 회원 탈퇴 취소
                    }
                } else {
                    // 체크박스 체크해라!
                    openModal('plzInputChb');
                }
            } else {
                // 비밀번호 적어라!
                openModal('plzInputPw');
            }
        });

        
        // 모달 열기
        function openModal(modalname){
            document.get
            $("#modal").fadeIn(300);
            $("."+modalname).fadeIn(300);
        }

        $("#modal, .close, .yes, .yes_agree").on('click',function(){
            $("#modal").fadeOut(300);
            $(".modal_common").fadeOut(300);
        });


    </script>
    <script src="/mh/js/main.js"></script>

</body>
</html>