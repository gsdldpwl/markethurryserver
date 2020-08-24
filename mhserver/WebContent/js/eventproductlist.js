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

        //전체상품 목록 카테고리에서 선택시 (현재 예: 채소)
        //장바구니 수량버튼 클릭 시 수량 + - 시키기

        // 구매수량 담는 변수
        var txtCount = 0;
        // 상품 가격 담는 변수
        var price = 1;
        // 총 금액 담는 변수
        var sum = 0;
        // 총 적립금
        var sumpoint = 0;


         // 천단위 , 찍기
         function numberWithCommas(x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }

        // - 버튼
        $("#btndown").click(function(){
            txtCount = $(".geatsu").val();

            if(txtCount >0){
                txtCount--;
                $(".geatsu").val(txtCount);

            }else if (txtCount ==0) {
                alert("1개 이상 구매 가능합니다.");
                txtCount =1;
                $(".geatsu").val(txtCount);

            };

            price = $(".goodsprice").text().replace(",", "");
            sum = price * txtCount;

            $(".sumnum").text(numberWithCommas(sum));

            sumpoint = parseInt(sum * 0.005);
                    $(".savenum").text(numberWithCommas(sumpoint));
           
        });

        
        // + 버튼
        $("#btnup").click(function(){
            txtCount = $(".geatsu").val();

                txtCount++;
                $(".geatsu").val(txtCount);
  
             if (txtCount > 50) {
                alert("더 이상 구매하실 수 없습니다.");
                txtCount =1;
              
                $(".geatsu").val(txtCount);

            };

            price = $(".goodsprice").text().replace(",", "");
            sum = price * txtCount;

            $(".sumnum").text(numberWithCommas(sum));
            
            sumpoint = parseInt(sum * 0.005);
                    $(".savenum").text(numberWithCommas(sumpoint));
        
            // console.log($(".sumnum").text(numberWithCommas(sum)));
        });


       

        //소메뉴(카테고리별) 클릭시 소메뉴명 출력
        var block = "none";

        $("#titleselect").click(function(){

            console.log(block);
            if(block == "block") {
                block = "none";
                $("#titleselect > ul > li > a").css({"display":block});
                $("#moreselect").attr('class','glyphicon glyphicon-menu-down');
            }

            else {
                block = "block";
                $("#titleselect > ul > li > a").css({"display":block});
                $("#moreselect").attr('class','glyphicon glyphicon-menu-up');
            }
        });

        //같은 소메뉴명 색 변화 시키기  클릭시(class="on")으로 되있는 애가 색이 변해용
        $("#titleselect > ul > li > a").click(function() {
            //alert($(this).text());
            $(".nameselect > span:eq(0)").text($(this).text());
            $("#titleselect > ul > li > a").removeClass("on");
            $(this).addClass("on");
        });


        // 페이지버튼 번호 클릭시 해당 번호 페이지로 이동시키기
        $(".pagebar > ul >li").click(function(){
            $(".pagebar > ul > li ").removeClass("active");
            $(this).addClass("active");
        });
        
       
        //장바구니 클릭시 장바구니 아이콘에 상품 띄우기

        // $("#basket").click(function(){
        //    if($(".inCart").css("display")=="none") {
        //         $(".inCart").css("display","block");
        //    }else {
        //        $(".inCart").css("display","none");
        //    }
           
        // });

        $("#basket").click(function(){
        //    $(".inCart").css("display","block");
           $(".inCart").fadeIn(1500)
                $(".inCart").slideUp(2000)
        });
        
        