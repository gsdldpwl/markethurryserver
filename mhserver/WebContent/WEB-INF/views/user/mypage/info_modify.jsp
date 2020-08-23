<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/inc/header.jsp" %>
    <style>

        #boxMain {
            border-top: 1px solid #666;
            border-bottom: 1px solid #666;
            height: auto;
        }
        #boxSub {border-bottom: 1px solid #aaa; height: auto;}
        
        .boxInfo * {
            display: block;
            float: left;
        }

        .boxInfo { width:580px; height: 40px; margin: 20px auto; }
        .boxInfo_naming { width:580px; height: auto; margin: 0px auto; }

        .boxInfo > span:first-child {
            clear: both;
            width: 140px;
            height: 40px;
            line-height: 40px;
            font-weight: bold;
            font-size: 0.9em;
        }
        
        .inputTxt, #birthday {
            width: 300px;
            height: 40px;
            border: 1px solid #aaa;
            border-radius: 3px;
            padding: 0px 10px;
        }

        .boxInfo label {
            display: inline-block;
            width: 100px;
            height: 40px;
            line-height: 40px;
        }
        .boxInfo label input[type="radio"] {
            width: 20px;
            height: 20px;
            margin: 10px 15px 10px 0px;
        }

        .boxInfo label input[type="checkbox"] {
            width: 20px;
            height: 20px;
            margin: 10px 15px 10px 0px;
            border-radius: 10px;
        }

        #birthday input {
            border: none;
            width: 70px;
            height: 38px;
            line-height: 38px;
            text-align: center;
        }
        #birthday .bar {width: auto; margin: 0px 15px; line-height: 40px;}

        .btnForm {
            width: 120px;
            height: 40px;
            margin-left: 20px;
            border: 1px solid #08718E;
            color: #08718E;
            background-color: white;
            font-weight: bold;
            border-radius: 3px;
        }
        
        .inputTxt:focus { 
            border: 1px solid black;
        }

        #goLeave {
            display: inline-block;
            width: 150px;
            height: 40px;
            border: #08718E 1px solid;
            color: #08718E;
            border-radius: 3px;
            margin: 30px auto;
            background-color: white;
        }

        #goModifyComplete {
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

        #showTerm {
            color: #08718E;
            cursor: pointer;
            line-height: 40px;
            margin-left: 10px;
        }

        #tblAgreePINFO {
            border-collapse: collapse;
            border: 1px solid #aaaaaa;
            padding: 0px;
            line-height: 35px;
            height: 35px;
            font-size: 0.8em;
            letter-spacing: -0.3px;
        }

        #tblAgreePINFO th {background-color: #f5f5f5;}
        #tblAgreePINFO td, #tblAgreePINFO th {border: 1px solid #aaa; text-align: center;}
        #tblAgreePINFO th:nth-child(1) {width: 195px;}
        #tblAgreePINFO th:nth-child(2) {width: 105px;}
        #tblAgreePINFO th:nth-child(3) {width: 125px;}

        #pAgreePINFO { font-size: 0.9em; letter-spacing: -0.3px; text-align: left; margin-top: 20px;}

        #agreePINFO, #agreeUSE { width: 350px; height: 40px; font-size: 0.9em;}

        .namingrule {
            display: block;
            margin-left: 150px;
            width: 280px;
            height: 15px;
            line-height: 15px;
            /* background-color: red; */
            border: 0px;
            font-size: 11px;
            font-weight: bold;
            color: #b3130b;
        }

        .blind {display: none;}
        .showblock {display: block;}

        .btndisabled {
            border-color: gray;
            color: gray;
            
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
	<%
		out.flush();
	    RequestDispatcher dinfo = request.getRequestDispatcher("/user/mypage/mypage_cinfo.do");
		dinfo.include(request, response);
	%>
	<!-- 마이페이지 컨텐츠 부분 -->
    <div style="width: 1100px; min-height: 550px; margin: 60px auto;">
        
        <!-- ※ 왼쪽 영역 시작 ※ -->
		<%@include file="/WEB-INF/views/inc/mypage_menu.jsp" %>
        <!-- ※ 왼쪽 영역 끝 ※ -->

        <!-- ---------------------------------------------------------------------------- -->

        <!-- ※ 오른쪽 영역 시작 ※ -->

        <div style="width: 870px; height: auto; float: left; margin-left: 30px; vertical-align: middle;">


            <!-- 마이페이지 메뉴 헤더 들어가는 부분 -->
            <div style="height: 82px;">
                <div style="float: left;">
                    <h2 id="title">개인 정보 수정<span id="subtitle"></span></h2>
                </div>
            </div>
            
            <!-- ---------------------------------------------------------------------------- -->

            <!-- 콘텐츠 영역 -->
            
            <div id="boxMain">
                <div class="boxInfo">
                    <span>아이디</span>
                    <input type="text" id="inputId" name="inputId" class="inputTxt" value="${id}" readonly>
                </div>
                <div class="boxInfo">
                    <span>현재 비밀번호</span>
                    <input type="password" id="inputPwNow" name="inputPwNow" class="inputTxt">
                </div>
                <div class="boxInfo_naming">
                    <span></span>
                    <input type="text" class="namingrule blind" id="inputPwNow_txt" value="" readonly ">
                </div>
                <div class="boxInfo">
                    <span>새 비밀번호</span>
                    <input type="password" id="inputPwNew" name="inputPwNew" class="inputTxt">
                </div>
                <div class="boxInfo_naming">
                    <span></span>
                    <input type="text" class="namingrule blind" id="inputPwNew_txt" value="" readonly ">
                </div>
                <div class="boxInfo">
                    <span>새 비밀번호 확인</span>
                    <input type="password" id="inputPwNewChk" name="inputPwNewChk" class="inputTxt">
                </div>
                <div class="boxInfo_naming">
                    <span></span>
                    <input type="text" class="namingrule blind" id="inputPwNewChk_txt" value="" readonly ">
                </div>
                <div class="boxInfo">
                    <span>이름</span>
                    <input type="text" id="inputName" name="inputNmae" class="inputTxt" value="${name}">
                </div>
                <div class="boxInfo">
                    <span>이메일</span>
                    <input type="text" id="inputMail" name="inputMail" class="inputTxt" value="${email}">
                    <input type="button" id="sameMailChk" value="중복확인" class="btnForm">
                </div>
                <div class="boxInfo">
                    <span>휴대폰</span>
                    <input type="text" id="inputPhone" name="inputPhone" class="inputTxt" value="${tel}" readonly>
                    <input type="button" id="phoneNumChk" value="다른번호 인증" class="btnForm anotherNum">
                </div>
                <div class="boxInfo blind" id="boxCheckNum">
                    <span></span>
                    <div class="inputTxt">
                        <input type="text" id="inputCode" style="width: 200px; height: 38px; border: none;">
                        <input type="text" id="timeAttack" value="3:00" style="width: 70px; height: 38px; text-align: right; border: none; color: red;" readonly>
                    </div>
                    <input type="button" id="checkNum" value="인증번호 확인" class="btnForm">
                </div>
                <div class="boxInfo">
                    <span>성별</span>
                    <label class>
                        <input type="radio" name="gender" value="m" class="gender">
                        남자
                    </label>
                    <label class>
                        <input type="radio" name="gender" value="w" class="gender">
                        여자
                    </label>
                    <label class="checked">
                        <input type="radio" name="gender" value="n" class="gender" checked>
                        선택안함
                    </label>
                </div>
                <div class="boxInfo">
                    <span>생년월일</span>
                    <input type="date" id="birthday" class="inputTxt" style="text-align: center;">
                    <!-- <div id="birthday">
                        <input type="text" id="birthYear" placeholder="YYYY" maxlength="4">
                        <span class="bar">/</span>
                        <input type="text" id="birthMonth" placeholder="MM" maxlength="2">
                        <span class="bar">/</span>
                        <input type="text" id="birthDate" placeholder="DD" maxlength="2">
                    </div> -->
                </div>
                <div class="boxInfo">
                    <span>선택약관 동의</span>
                    <divs id="agreePINFO">
                        <label class style="width: 220px;">
                            <input type="checkbox"" id="inputAgreePINFO" class="inputTxt">
                            <span>개인정보처리방침 동의</span><span style="color: #888;">(선택)</span>
                        </label>
                        <span id="showTerm">약관보기 ></span>
                    </div>
                </div>
                <div id="boxSub">
                    <div class="boxInfo" style="margin-bottom: 0px;">
                        <span>이용약관 동의</span>
                        <div id="agreeUSE">
                            <label class style="width: 350px;">
                                <input type="checkbox" id="inputAgreeUSE" class="inputTxt chboxall">
                                <span>무료배송, 할인쿠폰 등 혜택/정보 수신 동의</span><span style="color: #888;">(선택)</span>
                            </label>
                        </div>
                    </div>
                    <div class="boxInfo" style="margin-top: 0px;">
                        <span></span>
                        <div id="agreeUSE" style="margin-left: 10px;">
                            <label class style="width: 150px;">
                                <input type="checkbox" id="inputAgreeUSE1" class="inputTxt chbox">
                                <span>SMS</span><span style="color: #888;">(선택)</span>
                            </label>
                            <label class style="width: 150px;">
                                <input type="checkbox" id="inputAgreeUSE2" class="inputTxt chbox">
                                <span>이메일</span><span style="color: #888;">(선택)</span>
                            </label>
                        </div>
                    </div>
                </div>
                <div style="clear: both; margin: 0px auto; width: 305px; height: 100px;">
                    <input type="button" id="goLeave" value="탈퇴하기" onclick="location.href='/mh/user/mypage/info_leave.do';">
                    <input type="button" id="goModifyComplete" value="회원정보수정" onclick="location.href='/mh/user/mypage/info_modifyok.do';">
                </div>
            </div>
            <!-- <div style="clear: both;"></div> -->
            

            
            <!-- 잘못된 이메일 형식 -->
            <div id="modal"></div>
            <div class="modal_common emailError">
                <a href="javascript:;" class="close">X</a>
                <p class="title">알림메세지</p>
                <div class="con">
                    잘못된 이메일 형식입니다.
                </div>
                <div>
                    <input type="button" value="확인" href="javascript:;" class="yes">
                </div>
            </div>
            
            <!-- 인증번호가 발송되었습니다. -->
            <div class="modal_common sendCode">
                <a href="javascript:;" class="close">X</a>
                <p class="title">알림메세지</p>
                <div class="con">
                    인증번호가 발송되었습니다.
                </div>
                <div>
                    <input type="button" value="확인" href="javascript:;" class="yes">
                </div>
            </div>
            
            <!-- 인증 제한 시간이 지났습니다. -->
            <div class="modal_common codeTimeDone">
                <a href="javascript:;" class="close">X</a>
                <p class="title">알림메세지</p>
                <div class="con">
                    인증 제한 시간이 지났습니다.
                </div>
                <div>
                    <input type="button" value="확인" href="javascript:;" class="yes">
                </div>
            </div>
            
            <!-- 인증이 완료되었습니다. -->
            <div class="modal_common completeNum">
                <a href="javascript:;" class="close">X</a>
                <p class="title">알림메세지</p>
                <div class="con">
                    인증이 완료되었습니다.
                </div>
                <div>
                    <input type="button" value="확인" href="javascript:;" class="yes">
                </div>
            </div>
            
            <!-- 인증에 실패하였습니다. 인증번호를 새로 받아주십시오. -->
            <div class="modal_common failNum">
                <a href="javascript:;" class="close">X</a>
                <p class="title">알림메세지</p>
                <div class="con">
                    인증에 실패하였습니다. 인증번호를 새로 받아주십시오.
                </div>
                <div>
                    <input type="button" value="확인" href="javascript:;" class="yes">
                </div>
            </div>
            
            <!-- 이미 장바구니에 동일한 상품이 있는 경우 나오는 팝업창 -->
            <div class="modal_common bascketAlready">
                <a href="javascript:;" class="close">X</a>
                <p class="title">알림메세지</p>
                <div class="con">
                    이미 동일한 상품이 장바구니에 존재합니다.
                </div>
                <div>
                    <input type="button" value="확인" href="javascript:;" class="yes">
                </div>
            </div>

            <!-- 개인정보처리방침동의(선택) 약관보기 -->
            <div class="modal_common showAgreePINFO">
                <a href="javascript:;" class="close">X</a>
                <p class="title" style="color: #444;">개인정보 수집 ·이용 동의 <span style="color: #888;">(선택)</span></p>
                <div class="con_agree">
                    <table id="tblAgreePINFO">
                        <tr>
                            <th>수집 목적</th>
                            <th>수집 항목</th>
                            <th>보유 기간</th>
                        </tr>
                        <tr>
                            <td>맞춤형 회원 서비스 제공</td>
                            <td>성별, 생년월일</td>
                            <td>회원 탈퇴 즉시 파기</td>
                        </tr>
                    </table>
                    <p id="pAgreePINFO">동의를 거부하시는 경우에도 서비스는 이용하실 수 있습니다.</p>
                </div>
                <div style="background-color: white;">
                    <input type="button" value="확인" href="javascript:;" class="yes_agree">
                </div>
            </div>

            
        <!-- 비밀번호 입력 -->
        <div class="modal_common pwinput">
            <a href="javascript:;" class="close">X</a>
            <p class="title">알림메세지</p>
            <div class="con">비밀번호를 입력해주세요</div>
            <div><input type="button" value="확인" href="javascript:;" class="yes"></div>
        </div>

        <!-- 비밀번호 형식 -->
        <div class="modal_common pwform">
            <a href="javascript:;" class="close">X</a>
            <p class="title">알림메세지</p>
            <div class="con">잘못된 형식의 비밀번호입니다</div>
            <div><input type="button" value="확인" href="javascript:;" class="yes"></div>
        </div>

        <!-- 비밀번호 확인 입력 -->
        <div class="modal_common pwcheckinput">
            <a href="javascript:;" class="close">X</a>
            <p class="title">알림메세지</p>
            <div class="con">비밀번호 확인을 입력해주세요</div>
            <div><input type="button" value="확인" href="javascript:;" class="yes"></div>
        </div>

        <!-- 비밀번호 불일치 -->
        <div class="modal_common pwcheck">
            <a href="javascript:;" class="close">X</a>
            <p class="title">알림메세지</p>
            <div class="con">비밀번호가 틀립니다. 다시 입력해주세요</div>
            <div><input type="button" value="확인" href="javascript:;" class="yes"></div>
        </div>

        <!-- 이름 입력 -->
        <div class="modal_common nameinput">
            <a href="javascript:;" class="close">X</a>
            <p class="title">알림메세지</p>
            <div class="con">이름을 입력해주세요</div>
            <div><input type="button" value="확인" href="javascript:;" class="yes"></div>
        </div>

        <!-- 이메일 입력 -->
        <div class="modal_common emailinput">
            <a href="javascript:;" class="close">X</a>
            <p class="title">알림메세지</p>
            <div class="con">이메일을 입력해주세요</div>
            <div><input type="button" value="확인" href="javascript:;" class="yes"></div>
        </div>

        <!-- 이메일 중복검사 -->
        <div class="modal_common emaildupli">
            <a href="javascript:;" class="close">X</a>
            <p class="title">알림메세지</p>
            <div class="con">이메일 중복검사를 실시해주세요.</div>
            <div><input type="button" value="확인" href="javascript:;" class="yes"></div>
        </div>

        <!-- 이메일 중복검사 -->
        <div class="modal_common emailduplisc">
            <a href="javascript:;" class="close">X</a>
            <p class="title">알림메세지</p>
            <div class="con">사용가능한 이메일입니다.</div>
            <div><input type="button" value="확인" href="javascript:;" class="yes"></div>
        </div>

        <!-- 이메일 중복검사 -->
        <div class="modal_common emailduplifl">
            <a href="javascript:;" class="close">X</a>
            <p class="title">알림메세지</p>
            <div class="con">중복된 이메일입니다.</div>
            <div><input type="button" value="확인" href="javascript:;" class="yes"></div>
        </div>

        <!-- 휴대폰 번호 입력 -->
        <div class="modal_common phoneinput">
            <a href="javascript:;" class="close">X</a>
            <p class="title">알림메세지</p>
            <div class="con">휴대전화 번호를 입력해주세요</div>
            <div><input type="button" value="확인" href="javascript:;" class="yes"></div>
        </div>

        <!-- 휴대폰 인증-->
        <div class="modal_common phonecheck">
            <a href="javascript:;" class="close">X</a>
            <p class="title">알림메세지</p>
            <div class="con">휴대전화 인증을 완료해주세요.</div>
            <div><input type="button" value="확인" href="javascript:;" class="yes"></div>
        </div>

        <!-- 휴대폰 번호 입력 -->
        <div class="modal_common addressinput">
            <a href="javascript:;" class="close">X</a>
            <p class="title">알림메세지</p>
            <div class="con">주소를 입력해주세요.</div>
            <div><input type="button" value="확인" href="javascript:;" class="yes"></div>
        </div>

            

            <!-- ※ 오른쪽 영역 끝 ※ -->
            
        </div>
        <div style="clear:both;"></div>
    </div>


<!-- footer -->
<%@include file="/WEB-INF/views/inc/footer.jsp" %>


    <!-- script start -->
    <script>

	$("#MyMenu > div").removeClass("nowPage");
	$("#goMyInfo").addClass("nowPage");
         
        // 회원정보수정 flag
        var regitflag = {};
        regitflag['pwnow'] = true;
        regitflag['pwinput'] = true; //0
        regitflag['pwform'] = true; //0
        regitflag['pwcheckinput'] = true; //0
        regitflag['pwcheck'] = true; //0
        regitflag['nameinput'] = true;
        regitflag['emailinput'] = true;
        regitflag['emaildupli'] = true;
        regitflag['phoneinput'] = true; //0
        regitflag['phonecheck'] = true; //0
     

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

        // // 이메일 검사
        // $("#sameMailChk").click(function() {
            
        //     // 사용할 수 없는 이메일의 경우
        //     openModal('emailError');

        //     // 사용 가능한 이메일의 경우
        //     alert("사용이 가능합니다.");

        // });


        // 전화번호 인증
        var phone = "";
        var timer = 0;

        // 다른번호 인증 눌렀을 경우
        $(".anotherNum").click(function() {
            regitflag['phoneinput'] = false;
            regitflag['phonecheck'] = false;
            $("#inputPhone").prop("readonly", false)
            				.val("")
            				.prop("placeholder", "숫자만 입력해주세요");
            $("#phoneNumChk").removeClass('anotherNum')
                            .addClass('checkCode')
                            .val("인증번호 받기")
                            .prop("disabled", true)
                            .css("border-color", "gray")
                            .css("color", "gray");

            // 인증번호받기 활성화 후 클릭시 
            $(".checkCode").click(function() {
                $("#boxCheckNum").removeClass("blind")
                                .addClass("showblock");
                $("#checkNum").prop("disabled", false)
                            .css("border-color", "#08718E")
                            .css("color", "#08718E");
                // 인증번호 발송했다는 모달 팝업
                openModal('sendCode');

                // 3분의 timer가 돌아감
                var min = 2;
                var sec = 59;
                timer = setInterval(function() {
                    if(sec<10) {
                        $("#timeAttack").val(min+":0"+sec);
                    } else {
                        $("#timeAttack").val(min+":"+sec);
                    }
                    sec--;
                    if (sec<0) {
                        min--;
                        sec = 59;
                        if (min<0) {
                            // 3분이 지나면 타이머가 멈추고
                            clearInterval(timer);
                            // 시간이 만료 되었다는 모달 팝업
                            openModal('codeTimeDone');
                            $("#phoneNumChk").prop("disabled", false)
                                            .css("border-color", "#08718E")
                                            .css("color", "#08718E");
                            $("#checkNum").prop("disabled", true)
                                        .css("border-color", "gray")
                                        .css("color", "gray");
                        }
                    }
                }, 1000);
            });
        });

        // 인증번호 확인 버튼을 누르면
        $("#checkNum").click(function() {
            // 인증번호가 맞는지 확인하고,

            if ($("#inputCode").val().length == 6) {
                // 인증이 완료되었습니다.
                openModal('completeNum');
                $("#checkNum, #phoneNumChk, #inputCode, #inputPhone, #timeAttack").prop("disabled", true);
                $("#phoneNumChk").addClass('anotherNum')
                                .removeClass('checkCode');
                $("#phoneNumChk, #checkNum").css("border-color", "gray")
                                            .css("color", "gray");
                // flag true
                regitflag['phonecheck'] = true;
                clearInterval(timer);
                $("#timeAttack").val("");
            } else {
                // 인증번호 틀리면 인증번호 새로 받기...
                clearInterval(timer);
                $("#timeAttack").val("");

                openModal('failNum');
                $("#phoneNumChk").prop("disabled", false)
                                .css("border-color", "#08718E")
                                .css("color", "#08718E");
                $("#checkNum").prop("disabled", true)
                            .css("border-color", "gray")
                            .css("color", "gray");
            }
        });

        // 전화번호 11자리 눌렀을 시
        $("#inputPhone").keyup(function() {

            // 숫자 외에 문자 입력시 삭제
            $(this).val($(this).val().replace(/[^0-9]/g,""));

            phone = "";
            phone += $(this).val();

            if ($(this).val().length == 11) {
                regitflag['phoneinput'] = true;
                $("#phoneNumChk").prop("disabled", false)
                                .css("border-color", "#08718E")
                                .css("color", "#08718E");
            } else {
                regitflag['phoneinput'] = false;
                $("#phoneNumChk").prop("disabled", true)
                                .css("border-color", "gray")
                                .css("color", "gray");
            }
        });


        // 이용약관 체크박스 전체클릭
        $(".chboxall").click(function() {
            var chk = $(this).is(":checked");
            if (chk) {
                $(".chbox").prop('checked', true);
            } else {
                $(".chbox").prop('checked', false);
            }
        });

        // 이용약관 체크박스 하나클릭시 반응X 두개 클릭시 전체클릭 체크박스에도 체크됨.
        $(".chbox").click(function() {
            var chk1 = $("#inputAgreeUSE1").is(":checked");
            var chk2 = $("#inputAgreeUSE2").is(":checked");
            if (chk1 && chk2) {
                $(".chboxall").prop('checked', true);
            } else {
                $(".chboxall").prop('checked', false);
            }
        });


        $("#showTerm").click(function() {
            openModal('showAgreePINFO');
        });

        // 회원 탈퇴 클릭시
        $("#goLeave").click(function() {

            // 회원 탈퇴 페이지 오픈

        });

        // 회원 정보 수정 클릭시
        $("#goModifyComplete").click(function() {

            // 수정된 데이터를 저장해주는 페이지 오픈
            // 이메일 중복확인이 완료되었는지 확인
            // 휴대폰번호 인증을 받았는지 확인 > #phoneNumChk의 클래스가 anotherNum이면 인증받음.

        });

        // =======================================

        // validation func
        function validate(exp, value) {
            var regid =  /^[A-za-z]{6,15}/g;
            var regpw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
            var regemail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
            // id
            if(exp == "id"){
                if(regid.test(value)){
                    return true;
                } else {
                    return false;
                }
            // pw
            } else if(exp =="pw"){
                if(regpw.test(value)){
                    return true;
                } else {
                    return false;
                }
            } else if(exp =="email"){
                if(regemail.test(value)){
                    return true;
                } else {
                    return false;
                }
            }
        }
       
        
        // 비밀번호 검사
        var pw = "";
        var pwflag;
        
        $("#inputPwNew").keyup(function(){

            regitflag['pwform'] = false;
            regitflag['pwinput'] = false;

            pw =  "";
            pw += $(this).val();
            if(pw.length > 0){regitflag['pwinput'] = true;}
            else if(pw.length == 0){regitflag['pwinput'] = false;}
            
            pwflag = validate("pw",pw);

            $("#inputPwNew_txt").removeClass('blind')
                                .addClass('showblock');

            if(pwflag){
                $("#inputPwNew_txt").attr("value","O, 8자리 이상의 숫자+영문자+특수문자 조합")
                                    .css({"color":"#0f851a"});
                regitflag['pwform'] = true;

            } else {
                $("#inputPwNew_txt").attr("value","X, 8자리 이상의 숫자+영문자+특수문자 조합")
                                    .css({"color":"#b3130b"});
                regitflag['pwform'] = false;
            }

        }).focusout(function(){
            if(pw.length == 0) {
                regitflag['pwform'] = true;
                $("#inputPwNew_txt").attr("value","")
                                    .addClass('blind')
                                    .removeClass('showblock');
            }
        });
        

        // 비밀번호 재확인
        var pwcheck = "";
        var pwcheckflag; 

        $("#inputPwNewChk").keyup(function(){

            regitflag['pwcheckinput'] = false;
            regitflag['pwcheck'] = false;

            pwcheck = "";
            pwcheck += $(this).val();
            pwcheckflag = (pw == pwcheck);

            if(pwcheck.length > 0){regitflag['pwcheckinput'] = true;}
            else if(pwcheck.length == 0){regitflag['pwcheckinput'] = false;}

            $("#inputPwNewChk_txt").removeClass('blind')
                                    .addClass('showblock');

            if(pwcheckflag){
                $("#inputPwNewChk_txt").attr("value","O, 비밀번호가 일치합니다.")
                                        .css({"color":"#0f851a"})
                regitflag['pwcheck'] = true;
            } else {
                $("#inputPwNewChk_txt").attr("value","X, 비밀번호가 일치하지 않습니다.")
                                        .css({"color":"#b3130b"});
                regitflag['pwcheck'] = false;
            }
        }).focusout(function(){
            if(pwcheck.length == 0) {
                regitflag['pwcheck'] = true;
                $("#inputPwNewChk_txt").attr("value","")
                                        .addClass('blind')
                                        .removeClass('showblock');

            }
        });

        // 이름
        var name = "";
        $("#inputName").keyup(function(){
            name = "";
            name += $(this).val();
            
            if(name.length > 0){regitflag['nameinput'] = true;}
            else if(name.length == 0){regitflag['nameinput'] = false;}
        });

        // 이메일
        var email = "";
        
        $("#inputMail").keyup(function(){
            email = "";
            email += $(this).val();
            if(email.length > 0){regitflag['emailinput'] = true;}
            else if(email.length == 0){regitflag['emailinput'] = false;}
            
        });
        
        // var emailcheckbox = $("#infoinput tr:nth-child(5) td > input:last-child");
        // emailcheckbox.click(function(){
        //     // 이메일 중복검사
        //     alert("이메일 중복검사 실행하는 코드 넣으면 됩니다.");

        //     var emaildupliflag = true;
        //     if(emaildupliflag){
        //         regitflag['emaildupli'] = true;
        //         openModal('emailduplisc');
        //     } else {
        //         regitflag['emaildupli'] = false;
        //         openModal('emailduplifl');
        //     }
        // });


        // 성별
        var gender = ""
        $("input:radio[name=gender]").click(function(){
           gender = $("input:radio[name=gender]:checked").val();
        });


        // 생년월일
        var year, month, date = "";

        $("#birthday").focusout(function(){
            year = birth.val().substr(0,4);
            month = birth.val().substr(5,2);
            date = birth.val().substr(8,2);
        });
        
        // 가입하기 버튼 클릭
        var info = {};
        $("#goModifyComplete").click(function(){
            for (var key in regitflag) {
                // check if the property/key is defined in the object itself, not in parent
                if(regitflag[key] == false){
                    console.log(key);
                    openModal(key);
                    break;
                }
                info['pw'] = pw;
                info['name'] = name;
                info['email'] = email;
                info['phonenum'] = phone;
                info['gender'] = gender;
                info['birth'] = year+month+date;
                console.log(info);
            }
        });

    </script>
    <script src="/mh/js/main.js"></script>

</body>
</html>