// 하이퍼링크 마우스 올리면 색 변화 (색은 나중에 변경)
$(".hyperlink").mouseover(function() {
	$(this).css({
		"color" : "#08718E",
		"cursor" : "pointer"
	}); // 색 변경 필요
})

$(".hyperlink").mouseout(function() {
	$(this).css({
		"color" : "black"
	}); 
})

$("#detailmenutp ul li ").mouseover(function() {
	$(this).css({
		"color" : "#08718E",
		"cursor" : "pointer"
	}); 
})

$("#detailmenutp ul li ").mouseout(function() {
	$(this).css({
		"color" : "black"
	}); 
})

$("#detailmenu ul li").mouseover(function() {
	$(this).css({
		"color" : "#08718E",
		"cursor" : "pointer"
	}); 
})

$("#detailmenu ul li").mouseout(function() {
	$(this).css({
		"color" : "black"
	});
})

// 검색창 클릭 시 value 초기화
$("#menubar > #searchbox").focus(function() {
		$(this).attr("value", "");
})
	
$("#menubar > #searchbox").keyup(function() {
	$("#menubartp > #searchbox").attr("value",$(this).val());
	
	if(event.keyCode ==  13){
		var search = $("#menubar > #searchbox").val();
		location.href="/mh/user/product/searchedlist.do?search="+search;
	}
});

$("#menubar > #searchimg").click(function(){
	var search = $("#menubar > #searchbox").val();
	location.href="/mh/user/product/searchedlist.do?search=" +search;
})
	
$("#menubartp > #searchbox").focus(function() {
	$(this).attr("value", "");
})


$("#menubartp > #searchbox").keyup(function() {
	$("#menubar > #searchbox").attr("value",$(this).val());
	if(event.keyCode ==  13){
		var search = $("#menubartp > #searchbox").val();
		location.href="/mh/user/product/searchedlist.do?search="+search;
	}
});

$("#menubartp > #searchimg").click(function(){
	var search = $("#menubartp > #searchbox").val();
	location.href="/mh/user/product/searchedlist.do?search=" +search;
})


// 상단으로 가는 top 버튼
$(document).scroll(function() {

	if ($(document).scrollTop() > 300) {
		$("#topbtn").css({
			right : "50px",
			bottom : "30px",
			"opacity" : 1
		})
	} else {
		$("#topbtn").css({
			right : "50px",
			bottom : "0px",
			"opacity" : 0
		})
	}
});

// menu bar scroll position
$(document).scroll(function() {

	// 스크롤바가 메뉴바를 지나칠 때
	if ($(document).scrollTop() > $("#menubar").position().top - 10) {
		// 위에 숨겨두었던 같은 메뉴바를 아래로 내린다
		$("#menubartp").css({
			top : "0px",
			opacity : 1,
			"transition" : "all .7s",
		})
		// 기존의 메뉴바는 안보이도록 조절
		$("#menubar").css({
			"opacity" : 0
		})

		// 스크롤이 내려간 뒤의 상단 메뉴에서 전체카테고리가 선택되는 경우
		$("#menubartp > a").first().mouseover(function() {
			$("#detailmenutp").css({
				"display" : "block",
				"position" : "fixed",
				"left" : "482px",
				"top" : "83px",
				"border-top" : "2px solid #f7f7f6",
			})
		})

		$("#menubartp > a").first().mouseleave(function() {
			// 마우스가 하단으로 빠져나가지 않는 경우에만 세부메뉴를 없앰
			if (event.offsetY < 52) {
				$("#detailmenutp").css({
					"display" : "none",
					"position" : "fixed",
					"left" : "0px",
					"top" : "83px",
					"border-top" : "2px solid #f7f7f6",
				})
			}
		})

		// 기존의 메뉴바에서 세부 목록이 출력중일때 스크롤이 내려가면 세부 메뉴 사라지게
		if ($("#menubartp").css('opacity') > 0) {
			$("#detailmenu").css({
				"display" : "none",
			})
		}
	}
	// 다시 상단으로 복귀 시
	else {
		// 메뉴바를 다시 숨김
		$("#menubartp").css({
			top : "-80px",
			"transition" : "all 0s", // 0s 으로 줘야 한번에 사라짐
			"opacity" : 0
		})
		// 기존 메뉴바를 다시 보이게
		$("#menubar").css({
			"opacity" : 1
		})

		$("#detailmenutp").css({
			"display" : "none",
			"position" : "fixed",
			"left" : "0px",
			"top" : "83px",
			"border-top" : "2px solid #f7f7f6",
		})
	}
})

// # 세부 메뉴바
// 상품 카테고리에 마우스 커서 올라가면 세부 메뉴를 나타냄
$("#menubar > a").first().hover(function(e) {
	$("#detailmenu").css({
		"display" : "block"
	})
})

$("#menubar > a").first().mouseleave(function() {
	// 마우스가 하단으로 빠져나가지 않는 경우에만 세부메뉴를 없앰
	if (event.offsetY < 52) {
		$("#detailmenu").css({
			"display" : "none"
		})
	}
})

// hyperlink color change
$("#detailmenu > ul > a > li").mouseover(function() {
	$(this).css("color", "#73B1C4"); // 색 변경 필요
})

$("#detailmenu > ul > a > li").mouseout(function() {
	$(this).css("color", "black"); // 색 변경 필요
})

// 상단 공지사항바
var noticeNum = 1;
var timer;
var timer = setInterval(function() {
	if (noticeNum < 6) {
		$("#noticeMent").css({
			"display" : "block"
		});
		$("#noticeMent").css({
			"transform" : "translateY(-" + 31 * noticeNum + "px)"
		});
		noticeNum++;
	} else if (noticeNum == 6){
		noticeNum = 0;
		$("#noticeMent").css({
			"display" : "none"
		});
		$("#noticeMent").css({
			"transform" : "translateY(0px)"
		});
	}
}, 2000);
