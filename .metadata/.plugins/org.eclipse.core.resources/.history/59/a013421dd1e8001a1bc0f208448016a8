<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓허리 :: 오늘의 장보기</title>
<%@include file="/WEB-INF/views/inc/asset.jsp"%>
<%@include file="/WEB-INF/views/inc/header.jsp"%>
<link rel="stylesheet" href="/mh/css/modal.css">
<style>
* {
	outline: none;
}

::placeholder {
	color: #ccc;
}

#regitheader {
	width: 1100px;
	margin: 0px auto;
	margin-top: 80px;
	text-align: center;
	font-size: 20px;
	font-weight: 500;
}

#regitnotice {
	width: 600px;
	margin: 0px auto;
	margin-top: 80px;
	text-align: right;
	font-size: 12px;
	font-weight: 500;
}

#main {
	width: 600px;
	margin: 10px auto;
	border-top: 1px solid gray;
}

.regitinfo {
	width: 600px;
	margin: 10px auto;
	border: 1px solid black
}

.requiredinfo {
	color: #ee6a7b;
	position: relative;
	top: -2px;
}

#infoinput th {
	width: 156px;
	height: 60px;
	font-size: 14px;
	padding-left: 30px;
}

.checkment {
	padding-top: 0px;
	padding-bottom: 25px;
}

.infobox {
	width: 300px;
	height: 40px;
	margin: 10px auto;
	border: 1px solid #ccc;
	border-radius: 3px;
	padding: 0px 10px;
	font-weight: bold;
	font-size: 13px;
}

.check {
	width: 120px;
	height: 40px;
	margin: 0px 5px;
	background-color: white;
	border: 1px solid #08718E;
	border-radius: 3px;
	color: #08718E;
	font-weight: bold;
}

#checkNum {
	width: 120px;
	height: 40px;
	margin: 0px 5px;
	background-color: white;
	border: 1px solid #08718E;
	color: #08718E;
	border-radius: 3px;
	font-weight: bold;
}

.addressbox {
	width: 300px;
	height: 40px;
	background-color: white;
	border: 1px solid #08718E;
	border-radius: 3px;
	color: #08718E;
	font-weight: bold;
	cursor: pointer;
}

#addresstd {
	height: 100px;
	margin-bottom: 0px;
}

#addresstd>span {
	display: inline-block;
	color: #666666;
	padding-top: 10px;
	font-weight: bold;
	font-size: 11px;
}

#regitcomp {
	width: 600px;
	margin: 50px auto;
	text-align: center;
}

#regitcomp>input {
	width: 240px;
	height: 60px;
	color: white;
	font-weight: bold;
	font-size: 16px;
	border: 1px solid #08718E;
	border-radius: 3px;
	background-color: #08718E;
}

.namingrule {
	width: 300px;
	border: 0px;
	font-size: 11px;
	font-weight: bold;
	color: #b3130b;
}

input[type="radio"] {
	width: 20px;
	height: 20px;
	margin: 10px 15px 10px 0px;
	font-size: 15px;
}

label {
	display: inline-block;
	width: 100px;
	height: 40px;
	line-height: 40px;
	margin: 0;
}

#birthYear {
	border: none;
	width: 220px;
	height: 40px;
	line-height: 38px;
	text-align: center;
	padding-top: 20px;
}

.bar {
	width: auto;
	margin: 0px 15px;
	line-height: 40px;
}

#birthdiv {
	display: inline-block;
	width: 330px;
	height: 60px;
	border: 1px solid #08718E;
	border-radius: 3px;
	text-align: center;
}

#codeinputdiv>div {
	width: 300px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

#codeinputdiv {
	display: none;
}

#inputCode {
	width: 200px;
	height: 40px;
	border: none;
}

#inputCode {
	padding: 0px 10px;
	font-weight: bold;
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

#tblAgreePINFO th {
	background-color: #f5f5f5;
}

#tblAgreePINFO td, #tblAgreePINFO th {
	border: 1px solid #aaa;
	text-align: center;
}

#tblAgreePINFO th:nth-child(1) {
	width: 195px;
}

#tblAgreePINFO th:nth-child(2) {
	width: 105px;
}

#tblAgreePINFO th:nth-child(3) {
	width: 125px;
}

#pAgreePINFO {
	font-size: 0.9em;
	letter-spacing: -0.3px;
	text-align: left;
	margin-top: 20px;
}

#agreePINFO, #agreeUSE {
	width: 350px;
	height: 40px;
	font-size: 0.9em;
}

.blind {
	display: none;
}

.showblock {
	display: block;
}

.btndisabled {
	border-color: gray;
	color: gray;
}

#showTerm {
	color: #08718E;
	font-weight: bold;
}

#addressbox {
	margin-top:35px;
}

#addressbox2 {
	margin-top: 10px;
}
</style>
</head>

<body>
	<div id="regitheader">회원가입</div>
	<div id="regitnotice">
		<span class="requiredinfo">*</span>필수입력사항
	</div>

	<div id="main">
		<form id="infoForm" method="POST" action="/mh/user/main/registerok.do">
			<table id="infoinput">
				<tbody>
					<tr>
						<th class="checkment">아이디<span class="requiredinfo">*</span></th>
						<td>
							<input type="text" name="id" id="idbox" class="infobox" placeholder="앞 6자 이상의 영문 필수, 영문+숫자 조합">
							<input type="button" id="idduplibtn" class="check" value="중복확인"><br>
							<input type="text" id="idnamingrule" class="namingrule" value="" readonly>
						</td>
					</tr>
					<tr>
						<th class="checkment">비밀번호<span class="requiredinfo">*</span></th>
						<td>
							<input type="password" name="pw" id="pwbox" class="infobox" placeholder="비밀번호를 입력해주세요"><br> 
							<input type="text" id="pwnamingrule" class="namingrule" value="" readonly>
						</td>
					</tr>
					<tr>
						<th class="checkment">비밀번호 확인<span class="requiredinfo">*</span></th>
						<td>
							<input type="password" id="pwcheckbox" class="infobox" placeholder="비밀번호를 다시 입력해주세요"><br> 
							<input type="text" id="pwchecknamingrule" class="namingrule" value="" readonly>
						</td>
					</tr>
					<tr>
						<th>이름<span class="requiredinfo">*</span></th>
						<td>
							<input type="text" name="username" id="namebox" class="infobox" placeholder="이름을 입력해주세요">
						</td>
					</tr>
					<tr>
						<th>이메일<span class="requiredinfo">*</span></th>
						<td><input type="text" name="email" id="emailbox" class="infobox" placeholder="예: markethurry@hurry.com"> 
						<input type="button" id="emailduplibtn" class="check" value="중복확인"></td>
					</tr>
					<tr>
						<th>휴대폰<span class="requiredinfo">*</span></th>
						<td>
							<input type="text" name="tel" id="phonenumbox" class="infobox" placeholder="숫자만 입력해주세요"> 
							<input type="button" id="receivenum" style="border: 1px solid #ccc; color: #ccc" class="check" value="인증번호 받기" disabled="true">
							<div id="codeinputdiv">
								<div style="display: inline-block;">
									<input type="text" id="inputCode"> <input type="text"
										id="timeAttack" value="3:00"
										style="width: 70px; height: 38px; text-align: right; border: none; color: red;"
										readonly>
								</div>
								<input type="button" class="check" id="checkNum" value="인증번호 확인" class="btnForm">
							</div>
						</td>
					</tr>
					<tr>
						<th>주소<span class="requiredinfo">*</span></th>
						<td id="addresstd">
							<input type="text" class="addressbox" id="addressbox" name="addressbox" value="주소 검색" onclick="goPopup();" readonly style="text-align: center">
							<span>배송지에 따라 상품 정보가 달라질 수있습니다.</span>
						</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
							<label class style="margin: 0">
							<input type="radio" name="gender" value="m" class="gender">남자
							</label> 
							<label class>
							<input type="radio" name="gender" value="w" class="gender">여자
							</label> 
							<label class="checked">
							<input type="radio" name="gender" value="n" class="gender" checked>선택안함
							</label>
						</td>
					</tr>
					<tr>
						<th>생년월일</th>
							<td id="birthdiv"><input type="date" name="birth" id="birthYear">
						</td>
					</tr>
					<tr style="border-bottom: 1px solid #888;">
						<th><span class="agreespan">선택약관 동의</span></th>
						<td>
							<div id="agreePINFO"> 
								<label class style="width: 220px;"> 
								<input type="checkbox" id="inputAgreePINFO" class="agreespan"> 
								<span>개인정보처리방침 동의</span><span style="color: #888;">(선택)</span>
							</label> <span id="showTerm">약관보기 ></span>
							</div></td>
					</tr>
					<tr>
						<div id="dividediv"></div>
						<th><span>이용약관 동의</span></th>
						<td><div id="agreeUSE">
								<label class style="width: 350px;"> <input
									type="checkbox" id="inputAgreeUSE" class="inputTxt chboxall">
									<span>무료배송, 할인쿠폰 등 혜택/정보 수신 동의</span><span style="color: #888;">(선택)</span>
								</label>
							</div></td>
					</tr>
					<tr style="border-bottom: 1px solid #888; height: 20px;">
						<th></th>
						<td><label class style="width: 150px;"> <input
								type="checkbox" id="inputAgreeUSE1" class="inputTxt chbox">
								<span>SMS</span><span style="color: #888;">(선택)</span>
						</label> <label class style="width: 150px;"> <input
								type="checkbox" id="inputAgreeUSE2" class="inputTxt chbox">
								<span>이메일</span><span style="color: #888;">(선택)</span>
						</label></td>
					</tr>
				</tbody>
			</table>
			<div id="regitcomp">
				<input type="button" id="regitsubmit" value="가입하기">
			</div>
		</form>
	</div>

	<!-- modal -->
	<div id="modal"></div>

	<!-- 아이디 입력 X-->
	<div class="modal_common idinput">
		<a href="javascript:;" class="close">X</a>
		<p class="title">알림메세지</p>
		<div class="con">아이디를 입력해주세요</div>
		<div>
			<input type="button" value="확인" href="javascript:;" class="yes">
		</div>
	</div>


	<!-- 아이디 형식 -->
	<div class="modal_common idform">
		<a href="javascript:;" class="close">X</a>
		<p class="title">알림메세지</p>
		<div class="con">잘못된 아이디 형식입니다</div>
		<div>
			<input type="button" value="확인" href="javascript:;" class="yes">
		</div>
	</div>

	<!-- 아이디 중복검사 미실시 -->
	<div class="modal_common iddupli">
		<a href="javascript:;" class="close">X</a>
		<p class="title">알림메세지</p>
		<div class="con">아이디 중복검사를 실시해주세요</div>
		<div>
			<input type="button" value="확인" href="javascript:;" class="yes">
		</div>
	</div>

	<!-- 아이디 중복검사 성공 -->
	<div class="modal_common idduplisc">
		<a href="javascript:;" class="close">X</a>
		<p class="title">알림메세지</p>
		<div class="con">사용 가능한 아이디입니다</div>
		<div>
			<input type="button" value="확인" href="javascript:;" class="yes">
		</div>
	</div>

	<!-- 아이디 중복검사 실패 -->
	<div class="modal_common idduplifl">
		<a href="javascript:;" class="close">X</a>
		<p class="title">알림메세지</p>
		<div class="con">중복된 아이디입니다</div>
		<div>
			<input type="button" value="확인" href="javascript:;" class="yes">
		</div>
	</div>

	<!-- 비밀번호 입력 -->
	<div class="modal_common pwinput">
		<a href="javascript:;" class="close">X</a>
		<p class="title">알림메세지</p>
		<div class="con">비밀번호를 입력해주세요</div>
		<div>
			<input type="button" value="확인" href="javascript:;" class="yes">
		</div>
	</div>

	<!-- 비밀번호 형식 -->
	<div class="modal_common pwform">
		<a href="javascript:;" class="close">X</a>
		<p class="title">알림메세지</p>
		<div class="con">잘못된 형식의 비밀번호입니다</div>
		<div>
			<input type="button" value="확인" href="javascript:;" class="yes">
		</div>
	</div>

	<!-- 비밀번호 확인 입력 -->
	<div class="modal_common pwcheckinput">
		<a href="javascript:;" class="close">X</a>
		<p class="title">알림메세지</p>
		<div class="con">비밀번호 확인을 입력해주세요</div>
		<div>
			<input type="button" value="확인" href="javascript:;" class="yes">
		</div>
	</div>

	<!-- 비밀번호 불일치 -->
	<div class="modal_common pwcheck">
		<a href="javascript:;" class="close">X</a>
		<p class="title">알림메세지</p>
		<div class="con">비밀번호가 틀립니다. 다시 입력해주세요</div>
		<div>
			<input type="button" value="확인" href="javascript:;" class="yes">
		</div>
	</div>

	<!-- 이름 입력 -->
	<div class="modal_common nameinput">
		<a href="javascript:;" class="close">X</a>
		<p class="title">알림메세지</p>
		<div class="con">이름을 입력해주세요</div>
		<div>
			<input type="button" value="확인" href="javascript:;" class="yes">
		</div>
	</div>

	<!-- 이메일 입력 -->
	<div class="modal_common emailinput">
		<a href="javascript:;" class="close">X</a>
		<p class="title">알림메세지</p>
		<div class="con">이메일을 입력해주세요</div>
		<div>
			<input type="button" value="확인" href="javascript:;" class="yes">
		</div>
	</div>

	<!-- 잘못된 이메일 형식입니다. -->
	<div class="modal_common emailform">
		<a href="javascript:;" class="close">X</a>
		<p class="title">알림메세지</p>
		<div class="con">잘못된 이메일 형식입니다.</div>
		<div>
			<input type="button" value="확인" href="javascript:;" class="yes">
		</div>
	</div>

	<!-- 이메일 중복검사 -->
	<div class="modal_common emaildupli">
		<a href="javascript:;" class="close">X</a>
		<p class="title">알림메세지</p>
		<div class="con">이메일 중복검사를 실시해주세요.</div>
		<div>
			<input type="button" value="확인" href="javascript:;" class="yes">
		</div>
	</div>

	<!-- 이메일 중복검사 -->
	<div class="modal_common emailduplisc">
		<a href="javascript:;" class="close">X</a>
		<p class="title">알림메세지</p>
		<div class="con">사용가능한 이메일입니다.</div>
		<div>
			<input type="button" value="확인" href="javascript:;" class="yes">
		</div>
	</div>

	<!-- 이메일 중복검사 -->
	<div class="modal_common emailduplifl">
		<a href="javascript:;" class="close">X</a>
		<p class="title">알림메세지</p>
		<div class="con">중복된 이메일입니다.</div>
		<div>
			<input type="button" value="확인" href="javascript:;" class="yes">
		</div>
	</div>

	<!-- 휴대폰 번호 입력 -->
	<div class="modal_common phoneinput">
		<a href="javascript:;" class="close">X</a>
		<p class="title">알림메세지</p>
		<div class="con">휴대전화 번호를 입력해주세요</div>
		<div>
			<input type="button" value="확인" href="javascript:;" class="yes">
		</div>
	</div>

	<!-- 휴대폰 인증-->
	<div class="modal_common phonecheck">
		<a href="javascript:;" class="close">X</a>
		<p class="title">알림메세지</p>
		<div class="con">휴대전화 인증을 완료해주세요.</div>
		<div>
			<input type="button" value="확인" href="javascript:;" class="yes">
		</div>
	</div>

	<!-- 휴대폰 번호 입력 -->
	<div class="modal_common addressinput">
		<a href="javascript:;" class="close">X</a>
		<p class="title">알림메세지</p>
		<div class="con">주소를 입력해주세요.</div>
		<div>
			<input type="button" value="확인" href="javascript:;" class="yes">
		</div>
	</div>


	<!-- 인증번호가 발송되었습니다. -->
	<div class="modal_common sendCode">
		<a href="javascript:;" class="close">X</a>
		<p class="title">알림메세지</p>
		<div class="con">인증번호가 발송되었습니다.</div>
		<div>
			<input type="button" value="확인" href="javascript:;" class="yes">
		</div>
	</div>

	<!-- 인증 제한 시간이 지났습니다. -->
	<div class="modal_common codeTimeDone">
		<a href="javascript:;" class="close">X</a>
		<p class="title">알림메세지</p>
		<div class="con">인증 제한 시간이 지났습니다.</div>
		<div>
			<input type="button" value="확인" href="javascript:;" class="yes">
		</div>
	</div>

	<!-- 인증이 완료되었습니다. -->
	<div class="modal_common completeNum">
		<a href="javascript:;" class="close">X</a>
		<p class="title">알림메세지</p>
		<div class="con">인증이 완료되었습니다.</div>
		<div>
			<input type="button" value="확인" href="javascript:;" class="yes">
		</div>
	</div>

	<!-- 인증에 실패하였습니다. 인증번호를 새로 받아주십시오. -->
	<div class="modal_common failNum">
		<a href="javascript:;" class="close">X</a>
		<p class="title">알림메세지</p>
		<div class="con">인증에 실패하였습니다. 인증번호를 새로 받아주십시오.</div>
		<div>
			<input type="button" value="확인" href="javascript:;" class="yes">
		</div>
	</div>


	<!-- 개인정보처리방침동의(선택) 약관보기 -->
	<div class="modal_common showAgreePINFO" id="showAgreePINFOdiv">
		<a href="javascript:;" class="close">X</a>
		<p class="title" style="color: #444;">
			개인정보 수집 ·이용 동의 <span style="color: #888;">(선택)</span>
		</p>
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
	<!-- footer -->
	<a href="#" id="topbtn" style="border: 0px; outline: none;"></a>
	<%@include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
<script>
	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("/mh/jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");

		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2) {
		$("#addressbox").attr("value", roadAddrPart1 + roadAddrPart2);
		$("#addresstd")
				.append(
						"<input type='text' class='addressbox' id='addressbox2' name='addressbox2' value='" + addrDetail + "' readonly>");

		$("#addresstd > span").hide();
		$("#addressbox").css({
			"color" : "black",
			"text-align" : "left"
		});
		$("#addressbox2").css({
			"color" : "black",
			"text-align" : "left"
		});
	}
	// validation func
	function validate(exp, value) {
		var regid = /^[A-za-z]{6,15}/g;
		var regpw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
		var regemail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

		// id
		if (exp == "id") {
			if (regid.test(value)) {
				return true;
			} else {
				return false;
			}
			// pw
		} else if (exp == "pw") {
			if (regpw.test(value)) {
				return true;
			} else {
				return false;
			}
		} else if (exp == "email") {
			if (regemail.test(value)) {
				return true;
			} else {
				return false;
			}
		}
	}

	// 회원가입 flag
	var regitflag = {};
	regitflag['idinput'] = false;
	regitflag['idform'] = false;
	regitflag['iddupli'] = false;
	regitflag['pwinput'] = false;
	regitflag['pwform'] = false;
	regitflag['pwcheckinput'] = false;
	regitflag['pwcheck'] = false;
	regitflag['nameinput'] = false;
	regitflag['emailinput'] = false;
	regitflag['emailform'] = false;
	regitflag['emaildupli'] = false;
	regitflag['phoneinput'] = false;
	regitflag['phonecheck'] = false;
	regitflag['addressinput'] = false;
	

	// 아이디
	var id = "";
	var idbox = $("#idbox");
	var idcheckbox = $("#idnamingrule");
	var idduplicheck = $("#idduplibtn");

	idbox.focusin(function() {
		idbox.keyup(function() {
			id = "";
			id += $(this).val();
			if (id.length > 0) {
				regitflag['idinput'] = true;
			} else if (id.length == 0) {
				regitflag['idinput'] = false;
			}
			idflag = validate("id", id);

			if (idflag) {
				idcheckbox.attr("value", "O, 앞 6자 이상의 영문 필수, 영문+숫자 조합");
				idcheckbox.css({
					"color" : "#0f851a"
				});
				regitflag['idform'] = true;
			} else {
				idcheckbox.attr("value", "X, 앞 6자 이상의 영문 필수, 영문+숫자 조합");
				idcheckbox.css({
					"color" : "#b3130b"
				});
				regitflag['idform'] = false;
			}
		})
	}).focusout(function() {
		if (id.length == 0) {
			idcheckbox.attr("value", "");
		}
	})

	idduplicheck.click(function() {
		if (regitflag['idinput'] == true && regitflag['idform'] == true) {

			$.ajax({
				type : "GET",
				url : "/mh/user/main/registeridcheck.do",
				data : "id=" + $("#idbox").val(),
				dataType : "text",
				success : function(result) {
					if(result == 0){
						openModal("idduplisc");
						regitflag['iddupli'] = true;
					} else {
						openModal("idduplifl");
					}
				},
				error : function(a, b, c) {
					console.log(a, b, c);
				}
			})
		} else if (regitflag['idinput'] == false) {
			openModal('idinput');
		} else if (regitflag['idform'] == false) {
			openModal('idform');
		}

	});

	// 비밀번호 검사
	var pw = "";
	var pwbox = $("#pwbox");
	var pwboxment = $("#pwnamingrule");
	var pwflag;

	pwbox.keyup(function() {
		pw = "";
		pw += $(this).val();

		if (pw.length > 0) {
			regitflag['pwinput'] = true;
		} else if (pw.length == 0) {
			regitflag['pwinput'] = false;
		}

		pwflag = validate("pw", pw);

		if (pwflag) {
			pwboxment.attr("value", "O, 8자리 이상의 숫자+영문자+특수문자 조합");
			pwboxment.css({
				"color" : "#0f851a"
			});
			regitflag['pwform'] = true;

		} else {
			pwboxment.attr("value", "X, 8자리 이상의 숫자+영문자+특수문자 조합");
			pwboxment.css({
				"color" : "#b3130b"
			});
			regitflag['pwform'] = false;
		}
	}).focusout(function() {
		if (pw.length == 0) {
			pwboxment.attr("value", "");
		}
	});

	// 비밀번호 재확인
	var pwcheck = "";
	var pwcheckbox = $("#pwcheckbox");
	var pwcheckboxment = $("#pwchecknamingrule");
	var pwcheckflag;

	pwcheckbox.keyup(function() {
		pwcheck = "";
		pwcheck += $(this).val();
		pwcheckflag = (pw == pwcheck);

		if (pwcheck.length > 0) {
			regitflag['pwcheckinput'] = true;
		} else if (pwcheck.length == 0) {
			regitflag['pwcheckinput'] = false;
		}

		if (pwcheckflag) {
			pwcheckboxment.attr("value", "O, 비밀번호가 일치합니다.");
			pwcheckboxment.css({
				"color" : "#0f851a"
			});
			regitflag['pwcheck'] = true;
			pwcheckboxment.attr("value", "");
		} else {
			pwcheckboxment.attr("value", "X, 비밀번호가 일치하지 않습니다.");
			pwcheckboxment.css({
				"color" : "#b3130b"
			});
			regitflag['pwcheck'] = false;
		}
	}).focusout(function() {
		if (pwcheck.length == 0) {
			pwcheckboxment.attr("value", "");
		}
	});

	// 이름
	var name = "";
	var namebox = $("#namebox");
	namebox.keyup(function() {
		name = "";
		name += $(this).val();

		if (name.length > 0) {
			regitflag['nameinput'] = true;
		} else if (name.length == 0) {
			regitflag['nameinput'] = false;
		}

	})

	// 이메일
	var email = "";
	var emailbox = $("#emailbox");
	var emailcheckbox = $("#emailduplibtn");
	var emailformflag;
	
	
	
	emailcheckbox.click(function() {
		//emailinput,emailduplisc,emailduplifl
		if($("#emailbox").val().length == 0){
			openModal('emailinput');
			
		} else if($("#emailbox").val().length > 0){
			regitflag['emailinput'] = true;
			
			emailformflag = validate("email", $("#emailbox").val());
			
			if(emailformflag){
					regitflag['emailform'] = true;
					$.ajax({
						type:"GET",
						url:"/mh/user/main/registeremialcheck.do",
						data: "email="+$("#emailbox").val(),
						dataType: "text",
						success: function(result){
							if(result == 0){
								openModal('emailduplisc')
								regitflag['emaildupli'] = true;
							} else {
								openModal('emailduplifl');
							}
						},
						error: function(a,b,c){
							console.log(a,b,c);
						}
					});
				
			} else if(!emailformflag){
				openModal('emailform');
			}
		}
		
	});

	// 휴대폰 (todo)
	var phone = "";
	var phonebox = $("#phonenumbox");
	var receivebox = $("#receivenum");

	phonebox.keyup(function() {
		// 숫자 외에 문자 입력시 삭제
		$(this).val($(this).val().replace(/[^0-9]/g, ""));

		phone = "";
		phone += $(this).val();

		if (phone.length > 0) {
			regitflag['phoneinput'] = true;
		} else if (phone.length == 0) {
			regitflag['phoneinput'] = false;
		}

		if (phone.length == 11) {
			receivebox.css({
				"border" : "1px solid #08718E",
				"color" : "#08718E"
			})
			$("#receivenum").prop("disabled", false);
		} else {
			receivebox.css({
				"border" : "1px solid #ccc",
				"color" : "#ccc"
			})
		}

	})

	var codeinsertbox = $("#inputcode");
	var codeinsertdiv = $("#codeinputdiv");
	receivebox.click(function() {
		receivebox.css({
			"border" : "1px solid #ccc",
			"color" : "#ccc"
		})

		codeinsertdiv.css({
			"display" : "block"
		})
		openModal('sendCode');

		// timer
		var min = 2;
		var sec = 59;
		timer = setInterval(function() {
			if (sec < 10) {
				$("#timeAttack").val(min + ":0" + sec);
			} else {
				$("#timeAttack").val(min + ":" + sec);
			}
			sec--;
			if (sec < 0) {
				min--;
				sec = 59;
				if (min < 0) {
					// 3분이 지나면 타이머가 멈추고
					clearInterval(timer);
					$("#checkNum").css({
						"border" : "1px solid #08718E",
						"color" : "#08718E"
					})
					// 시간이 만료 되었다는 모달 팝업
					openModal('codeTimeDone');
					$("#phoneNumChk").prop("disabled", false);
					$("#phoneNumChk").css("border-color", "#08718E");
					$("#phoneNumChk").css("color", "#08718E");
					$("#checkNum").prop("disabled", true);
					$("#checkNum").css("border-color", "gray");
					$("#checkNum").css("color", "gray");
				}
			}
		}, 1000);
	})
	var codevalue = "";
	var phonecheck = true;
	$("#checkNum")
			.click(
					function() {
						// 인증번호가 맞는지 확인하고,

						if ($("#inputCode").val().length == 6) {
							openModal('completeNum');
							$(
									"#checkNum, #phoneNumChk, #inputCode, #inputPhone, #timeAttack")
									.prop("disabled", true);
							$("#phoneNumChk").addClass('anotherNum');
							$("#phoneNumChk").removeClass('checkCode');
							$("#phoneNumChk, #checkNum").css("border-color",
									"#ccc");
							$("#phoneNumChk, #checkNum").css("color", "#ccc");
							clearInterval(timer);

							if (phonecheck) {
								regitflag['phonecheck'] = true;
							}

							else {
								regitflag['phonecheck'] = false;
							}
						} else {
							// 인증번호 틀리면 인증번호 새로 받기...
							clearInterval(timer);
							$("#timeAttack").val("");
							openModal('failNum');
							$("#phoneNumChk").prop("disabled", false);
							$("#phoneNumChk").css("border-color", "#08718E");
							$("#phoneNumChk").css("color", "#08718E");
							$("#checkNum").prop("disabled", true);
							$("#checkNum").css("border-color", "#ccc");
							$("#checkNum").css("color", "#ccc");
						}
					})

	// 도로명 주소 api
	if($("#addressbox").val().length > 0){
		regitflag['addressinput'] = true;
	}

	// 성별
	var gender = ""
	var gendercheck = $("#infoinput tr:nth-child(8) td > label > input:radio[name=gender]");
	gendercheck
			.click(function() {
				gender = $(
						"#infoinput tr:nth-child(8) td > label > input:radio[name=gender]:checked")
						.val();
			});

	// 생년월일
	var year, month, date = "";
	var birth = $("#infoinput tr:last-child td > input");

	birth.focusout(function() {
		year = birth.val().substr(0, 4);
		month = birth.val().substr(5, 2);
		date = birth.val().substr(8, 2);
	})

	// 가입하기 버튼 클릭
	var info = {};
	$("#regitsubmit").click(function() {
		for ( var key in regitflag) {
			// check if the property/key is defined in the object itself, not in parent
			if (regitflag[key] == false) {
				openModal(key);
				break;
			}

		}

		var submitflagNum = 0;
		
		for ( var key in regitflag) {
			if (regitflag[key] == true) {
				submitflagNum++;
			}
			
			if (submitflagNum == 14) {
				alert("submit");
				$("#infoForm").submit();
			}
		}
		console.log(submitflagNum);

	})
	// ------------ 약관 script ------------

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
</script>
<script src="/mh/js/main.js"></script>
<script src="/mh/js/modal.js"></script>
</html>