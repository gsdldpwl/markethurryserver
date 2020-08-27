//로고 누를 시 마켓허리로 이동 -> 서버 구축할 때 변경
$("#header > img").click(function() {
    location.href ="#";
});

//홈페이지 바로가기 누를 시 마켓허리로 이동 -> 서버 구축할 때 변경
$("#home").click(function() {
    location.href ="#";
});

// 세부메뉴 눌렀을 시 색 변화
var menu_color = $("#itemlist > li > a, #orderlist > li > a, #borderlist > li > a, #saleslist > li > a, #itemslist > li > a");
menu_color.click(function() {
    menu_color.css("color", "#999");
    $(this).css("color", "#08718E");
});

//상품관리를 누를 시 하위메뉴 출력
$("#item").click(function() {
    menu_color.css("color", "#999");
    $("#menu > li > div").css("background-color", "#fafafa");
    if($("#itemlist").css("display") == "none") {
        $("#itemlist").show()
        $("#orderlist").hide();
        $("#borderlist").hide();
        $("#staticlist").hide();
        $("#saleslist").hide();
        $("#itemslist").hide();
        $("#itemlist").parent().css("background-color", "#eee");
    } else {
        $("#itemlist").hide();
    }
});

//주문관리를 누를 시 하위메뉴 출력
$("#order").click(function() {
    menu_color.css("color", "#999");
    $("#menu > li > div").css("background-color", "#fafafa");
    if($("#orderlist").css("display") == "none") {
        $("#itemlist").hide();
        $("#orderlist").show();
        $("#borderlist").hide();
        $("#staticlist").hide();
        $("#saleslist").hide();
        $("#itemslist").hide();
        $("#order").parent().css("background-color", "#eee");
    } else {
        $("#orderlist").hide();
    }
});

//고객관리를 누를 시 하위메뉴 출력
$("#customer").click(function() {
    menu_color.css("color", "#999");
    $("#itemlist").hide();
    $("#orderlist").hide();
    $("#borderlist").hide();
    $("#staticlist").hide();
    $("#saleslist").hide();
    $("#itemslist").hide();
    $("#menu > li > div").css("background-color", "#fafafa");
    $("#customer").parent().css("background-color", "#eee");
});

//게시판 관리를 누를 시 하위메뉴 출력
$("#border").click(function() {
    menu_color.css("color", "#999");
    $("#menu > li > div").css("background-color", "#fafafa");
    if($("#borderlist").css("display") == "none") {
        $("#itemlist").hide();
        $("#orderlist").hide();
        $("#borderlist").show();
        $("#staticlist").hide();
        $("#saleslist").hide();
        $("#itemslist").hide();
        $("#border").parent().css("background-color", "#eee");
    } else {
        $("#borderlist").hide();
    }
});


//통계 관리를 누를 시 하위메뉴 출력
$("#static").click(function() {
    menu_color.css("color", "#999");
    $("#menu > li > div").css("background-color", "#fafafa");
    if($("#staticlist").css("display") == "none") {
        $("#itemlist").hide();
        $("#orderlist").hide();
        $("#borderlist").hide();
        $("#staticlist").show();
        $("#saleslist").hide();
        $("#itemslist").hide();
        $("#static").parent().css("background-color", "#eee");
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

$(function () {
    $("#date1").datepicker({
        dateFormat: "yy-mm-dd",
        showOn: "both",
        buttonImage: "../../images/icons8-calendar-28.png",
        buttonImageOnly: true,
        buttonText: "Select date",
    });

    $("#date2").datepicker({
        dateFormat: "yy-mm-dd",
        showOn: "both",
        buttonImage: "../../images/icons8-calendar-28.png",
        buttonImageOnly: true,
        buttonText: "Select date",
    });
});

