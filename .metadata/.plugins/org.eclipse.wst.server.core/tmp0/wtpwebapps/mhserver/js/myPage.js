
        // 신수진

        // ----------------------------------------------------------------------------
        // 마이페이지 기본 템플릿


        // 주문 내역 클릭시
        $("#goMyOrder").click(function() {
        	location.href='/mh/user/mypage/orderlist.do';
        });

        //  찜 목록 클릭시
        $("#goMyStar").click(function() {
        	location.href='/mh/user/mypage/jjimlist.do';
        });

        //  상품 후기 클릭시
        $("#goMyReview").click(function() {
        	location.href='/mh/user/mypage/review.do';
        });

        //  마일리지, 숫자 클릭시
        $("#goMyPoint_info, #goMyPoint_menu").click(function() {
        	location.href='/mh/user/mypage/mileage.do';
        });

        //  내 레시피 클릭시
        $("#goMyRecipe").click(function() {
        	location.href='/mh/user/mypage/myrecipe.do';
        });

        //  개인 정보 수정 클릭시
        $("#goMyInfo").click(function() {
        	location.href='/mh/user/mypage/info_pwcheck.do';
        });

        //  1대1문의 클릭시
        $("#go1to1Q").click(function() {
        	location.href='/mh/user/customercenter/onebyone.do';
        });

        $(".menulist").mouseover(function() { $(this).addClass("focusPage"); });
        $(".menulist").mouseout(function() { $(this).removeClass("focusPage"); });

        // ----------------------------------------------------------------------------
