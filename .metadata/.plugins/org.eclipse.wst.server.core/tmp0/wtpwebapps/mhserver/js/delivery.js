// 검색 기능
// 다 입력했을 때 조회되는 data랑 서버가 연동되면 구현하기
$("#btn1").click(function() {
    if ($("#txt1").val() == "") {
    alert("주문번호가 입력되지 않았습니다.");
    $("#txt1").focus();
} else if (!($("#txt1").val() == "") && ($("#date1").val() == "")) {
    alert("기간(시작)이 입력되지 않았습니다.");
    $("#date1").focus();
} else if ((!($("#txt1").val() == "") && !($("#date1").val() == "")) && ($("#date2").val() == "")) {
    alert("기간(끝)이 입력되지 않았습니다.");
    $("#date2").focus();
} else if ($("#sel2 option:selected").val() == "상품명" &&(!($("#txt1").val() == "") && !($("#date1").val() == "")) && !($("#date2").val() == "") && ($("#txt2").val() == "")) {
    alert("상품명이 입력되지 않았습니다.");
    $("#txt2").focus();
} else if ($("#sel2 option:selected").val() == "분류별" &&(!($("#txt1").val() == "") && !($("#date1").val() == "")) && !($("#date2").val() == "") && ($("#txt2").val() == "")) {
    alert("분류별이 입력되지 않았습니다.");
    $("#txt2").focus();
    }
});

//초기화 기능
$("#btn2").click(function() {
    $("#txt1").val("");
    $("#date1").val("");
    $("#date2").val("");
    $("#txt2").val("");
});

//이미지 버튼을 사용해서 datepicker 출력
$(function() {
    $("#date1").datepicker({
        dateFormat: "yy-mm-dd",
        showOn: "both",
        buttonImage: "../images/icons8-calendar-28.png",
        buttonImageOnly: true,
        buttonText: "Select date"
    });

    $("#date2").datepicker({
        dateFormat: "yy-mm-dd",
        showOn: "both",
        buttonImage: "../images/icons8-calendar-28.png",
        buttonImageOnly: true,
        buttonText: "Select date"
    });
});