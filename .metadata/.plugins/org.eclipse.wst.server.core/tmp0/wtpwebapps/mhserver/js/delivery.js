//이미지 버튼을 사용해서 datepicker 출력
$(function () {
    $("#date1").datepicker({
        dateFormat: "yy-mm-dd",
        showOn: "both",
        buttonImage: "/mh/images/icons8-calendar-28.png",
        buttonImageOnly: true,
        buttonText: "Select date",
    });

    $("#date2").datepicker({
        dateFormat: "yy-mm-dd",
        showOn: "both",
        buttonImage: "/mh/images/icons8-calendar-28.png",
        buttonImageOnly: true,
        buttonText: "Select date",
    });
});

// 테이블의 행 갯수 (지금은 검색된 결과의 갯수)
// 1을 뺀 이유는 헤더부분(첫 행) 제외
var resultCount = $("#resultTable tbody tr").length - 1;
$("#resultCount").text(resultCount);

//배송준비중, 배송중, 배송완료 버튼
$("#topMenu1").on({
    mouseenter: function () {
        $(this).css("opacity", ".3");
    },
    mouseleave: function () {
        $(this).css("opacity", "1");
    },
});

$("#topMenu2").on({
    mouseenter: function () {
        $(this).css("opacity", ".3");
    },
    mouseleave: function () {
        $(this).css("opacity", "1");
    },
});

$("#topMenu3").on({
    mouseenter: function () {
        $(this).css("opacity", ".3");
    },
    mouseleave: function () {
        $(this).css("opacity", "1");
    },
});