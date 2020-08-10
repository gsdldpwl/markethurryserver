//로고 누를 시 마켓허리로 이동 -> 서버 구축할 때 변경
$("#header > img").click(function() {
    location.href ="#";
});

//홈페이지 바로가기 누를 시 마켓허리로 이동 -> 서버 구축할 때 변경
$("#home").click(function() {
    location.href ="#";
});

//상품관리를 누를 시 하위메뉴 출력
$("#item").click(function() {
    if($("#itemlist").css("display") == "none") {
        $("#itemlist").show();
        $("#orderlist").hide();
        $("#borderlist").hide();
        $("#staticlist").hide();
    } else {
        $("#itemlist").hide();
    }
});

//주문관리를 누를 시 하위메뉴 출력
$("#order").click(function() {
    if($("#orderlist").css("display") == "none") {
        $("#itemlist").hide();
        $("#orderlist").show();
        $("#borderlist").hide();
        $("#staticlist").hide();
    } else {
        $("#orderlist").hide();
    }
});

//게시판 관리를 누를 시 하위메뉴 출력
$("#border").click(function() {
    if($("#borderlist").css("display") == "none") {
        $("#itemlist").hide();
        $("#orderlist").hide();
        $("#borderlist").show();
        $("#staticlist").hide();
    } else {
        $("#borderlist").hide();
    }
});

//통계 관리를 누를 시 하위메뉴 출력
$("#static").click(function() {
    if($("#staticlist").css("display") == "none") {
        $("#itemlist").hide();
        $("#orderlist").hide();
        $("#borderlist").hide();
        $("#staticlist").show();
    } else {
        $("#staticlist").hide();
    }
});

//매출분석를 눌렀을 시 하위메뉴 출력
$("#sales").click(function() {
    if($("#saleslist").css("display") == "none") {
        $("#saleslist").show();
        $("#itemslist").hide();
    } else {
        $("#saleslist").hide();
    }
});

//상품분석를 눌렀을 시 하위메뉴 출력
$("#items").click(function() {
    if($("#itemslist").css("display") == "none") {
        $("#saleslist").hide();
        $("#itemslist").show();
    } else {
        $("#itemslist").hide();
    }
});

//주문(버튼)에 마우스 올릴 시 글자색 변경
$("#order2").mouseover(function() {
    $("#order2 > .text1").css("color", "blue")
    $("#order2 > .text2").css("color", "blue")
});

$("#order3").mouseover(function() {
    $("#order3 > .text1").css("color", "blue")
    $("#order3 > .text2").css("color", "blue")
});

//주문(버튼)에 마우스가 떨어질 시 글자색 변경
$("#order2").mouseout(function() {
    $("#order2 > .text1").css("color", "black")
    $("#order2 > .text2").css("color", "black")
});

$("#order3").mouseout(function() {
    $("#order3 > .text1").css("color", "black")
    $("#order3 > .text2").css("color", "black")
});

//주문(버튼)을 클릭했을 때 페이지 이동
$("#order2").click(function() {
    location.href ="#";
});

$("#order3").click(function() {
    location.href ="#";
});

//결제(버튼)에 마우스 올릴 시 글자색 변경
$("#pay").mouseover(function() {
    $("#pay > .text1").css("color", "blue")
    $("#pay > .text2").css("color", "blue")
});

$("#pay2").mouseover(function() {
    $("#pay2 > .text1").css("color", "blue")
    $("#pay2 > .text2").css("color", "blue")
});

//결제(버튼)에 마우스가 떨어질 시 글자색 변경
$("#pay").mouseout(function() {
    $("#pay > .text1").css("color", "black")
    $("#pay > .text2").css("color", "black")
});

$("#pay2").mouseout(function() {
    $("#pay2 > .text1").css("color", "black")
    $("#pay2 > .text2").css("color", "black")
});

//결제(버튼)을 클릭했을 때 페이지 이동
$("#pay").click(function() {
    location.href ="#";
});

$("#pay2").click(function() {
    location.href ="#";
});

//환불(버튼)을 마우스 올릴 시 글자색 변경
$("#payback").mouseover(function() {
    $("#payback > .text1").css("color", "red")
    $("#payback > .text2").css("color", "red")
});

$("#payback2").mouseover(function() {
    $("#payback2 > .text1").css("color", "red")
    $("#payback2 > .text2").css("color", "red")
});

//환불(버튼)에 마우스가 떨어질 시 글자색 변경
$("#payback").mouseout(function() {
    $("#payback > .text1").css("color", "black")
    $("#payback > .text2").css("color", "black")
});

$("#payback2").mouseout(function() {
    $("#payback2 > .text1").css("color", "black")
    $("#payback2 > .text2").css("color", "black")
});

//환불(버튼)을 클릭했을 때 페이지 이동
$("#payback").click(function() {
    location.href ="#";
});

$("#payback2").click(function() {
    location.href ="#";
});

//탭메뉴를 클릭했을 때 탭메뉴의 색깔과 출력되는 정보변경
$(function () {
    $(".tab_content").hide();
    $("ul.tabs li:first").css("background-color", "#08718E");
    $("ul.tabs li:first").css("color", "white");
    $(".tab_content:first").show();

    $("ul.tabs li").click(function () {
        $("ul.tabs li").removeClass("active").css("background-color", "white");
        $("ul.tabs li").removeClass("active").css("color", "black");
        $(this).addClass("active").css("background-color", "#08718E");
        $(this).addClass("active").css("color", "white");
        $(".tab_content").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
    });
});