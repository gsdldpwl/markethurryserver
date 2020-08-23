<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/inc/header.jsp" %>
    
    <style>

        #tblList {
            width: 870px;
            border-collapse: collapse;
        }

        #tblList th, #tblList td {
            border-bottom: 1px solid #999;
            text-align: center;
        }

        #tblList td {padding: 20px 0px 20px 0px;}

        #tblList td:nth-child(1) { width: 30px; }
        #tblList td:nth-child(2) { width: 120px; }
        #tblList td:nth-child(3) { text-align: left; padding-left: 30px;}
        #tblList td:nth-child(4) { width: 130px; }
        #tblList th:nth-child(1) { width: 30px; }
        #tblList th:nth-child(2) { width: 710px; }
        #tblList th:nth-child(3) { width: 130px; }

        .no_data {
            text-align: center;
            padding: 100px 0px;
        }

        .label_check { margin: 0px; }
        .ckbox {
            width: 15px;
            height: 15px;
            border: 1px solid #bbb;
            background: white;
        }

        .itemImg {
            width: 100px;
            height: 100px;
            border: 1px solid black;

        }

        .goBasket {
            display: block;
            width: 120px;
            height: 30px;
            border: 1px solid #08718E;
            background-color: #08718E;
            color: white;
            margin: 0px auto 10px auto;
        }

        .deleteList {
            display: block;
            width: 120px;
            height: 30px;
            border: 1px solid #08718E;
            background-color: white;
            color: #08718E;
            margin: 0px auto;
        }

        #goAllOrder {
            display: block;
            float: right;
            width: 140px;
            height: 40px;
            border: 1px solid #08718E;
            background-color: #08718E;
            color: white;
            margin: 30px 0px;
        }

        #deleteAllList {
            display: block;
            float: right;
            width: 140px;
            height: 40px;
            border: 1px solid #08718E;
            background-color: white;
            color: #08718E;
            margin: 30px 10px;
        }

        a.button {
            display:inline-block;
            padding: 10px 20px;
            text-decoration:none;
            color:#fff;
            background:#000;
            margin:20px;
        }

        /* 모달 관련 css */
        #modal {
            display:none;
            position:fixed; 
            width:100%; height:100%;
            top:0; left:0; 
            background:rgba(0,0,0,0.3);
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
            border-bottom: 2px solid black;
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

        /* modal css */

        #modal-all {
            width: 100%;
        }

        .modal {
            width: 100%;
            margin: 0px auto;
            padding: 100PX;
        }

        .modal-header{
            border-bottom: none;
            /* padding: 25px 0 17px 30px; */
            padding-bottom: 0px;
        }
        

        .modal-dialog {
            width: 440px;
            height: auto;
        }
     

        .modal-title {
            font-size: 1.8em;
            font-weight: 500;
            color: black;
            /* padding: 20px; */
            padding: 20px 20px 0px 20px;
           
        }

       .modal-body .goodsname {
        display: block;
        padding-bottom: 12px;
        padding-left: 20px;
        border-bottom: 2px solid #333 ;
        font-size: 16px;
        }

        .modal-body .list{
            list-style: none;
            overflow: hidden;
            overflow-y: auto;
            width: 400px;
            height: 220px;
            /* padding: 0px; */
            padding: 10px 20px 0px 20px;
            
       }

       .modal-body .list .goods1 .adjust .goodsprice {
            margin-right: 200px;
           
       }

      .goods1 .adjust {
           font-weight: 600;
           /* margin-top: 10px; */
           }

        .modal-body .list .adjust button {
            overflow: hidden;
            /* position: absolute; */
            /* left: 200px; */
            /* float: left; */
            width: 22px;
            height: 22px;
            border: 0;
            background: #f6f7f7;
            line-height: 0;
           
        }

        .modal-body .list .adjust .geatsu {
            width: 41px;
            height: 24px;
            padding: 0 0 2px;
            border: 0;
            background-color: white;
            font-size: 14px;
            text-align: center;
            color: black;
        }

        .modal-body .list .goodsname2 {
            font-size: 14px;
        }

        .sum .sumname {
            font-size: 15px;
            margin-left: 15px;
        }

        .sum .sumnum {
            margin-left: 220px;
            font-size: 27px;
        }

        .sum .won {
            font-size: 17px;
        }

        .save {
            margin-left: 216px;
            margin-top: 7px ;
        }
    
        .save .jukrip {
            width: 38px;
            height: 20px;
            margin-right: 2px;
            border: 1px solid #e8a828;
            border-radius: 10px;
            background-color: #ffbf00;
            font-weight: 700;
            font-size: 12px;
            color: #fff;
            line-height: 18px;
            text-align: center;
            vertical-align: 1px;
            display: inline-block;
          
        }

        .save .getpoint {
            font-size: 14px;
        }

       .modal-footer {
         overflow: hidden;
         padding:21px 0 30px;;
         width: 100%;
         text-align: center;
         border-top: none;
       }

       .modal-footer #cancle {
           width:185px ;
           height: 50px;
           color: teal;
           background-color: white;
           border: 1px solid teal;
           border-radius: 3px;
           
       }

       .modal-footer #basket {
           width:185px ;
           height: 50px;
           background-color: teal;
           border: 1px solid white;
           border-radius: 3px;
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
            <div style="height: 82px; border-bottom: 2px solid #08718E;">
                <div style="float: left;">
                    <h2 id="title">찜 목록<span id="subtitle">찜 목록으로 등록하신 상품 목록입니다.</span></h2>
                </div>
            </div>
            
            <!-- ---------------------------------------------------------------------------- -->

            <!-- 콘텐츠 영역 -->
                    
            <table id="tblList">
                <tr style="height: 40px;">
                    <th>
                        <label style="margin: 0px;">
                            <input type="checkbox" id="checkAll" class="ckbox">
                        </label>
                    </th>
                    <th colspan="2">상품정보</th>
                    <th>선택</th>
                </tr>
                <tbody>
                    <tr>
                        <td>
                            <label class="label_check">
                                <input type="checkbox" class="ckbox jjimCheck" name="jjimCheck">
                            </label>
                        </td>
                        <td><img src="" class="itemImg"></td>
                        <td>
                            <div>[오마하] 프라임 등심 스테이크 200g(냉장) 1</div>
                            <div>24,000원</div>
                        </td>
                        <td>
                            <input type="button" class="goBasket" data-toggle="modal" data-target="#myModal" value="장바구니 담기">
                            <input type="button" class="deleteList" value="삭제">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="label_check">
                                <input type="checkbox" class="ckbox jjimCheck" name="jjimCheck">
                            </label>
                        </td>
                        <td><img src="" class="itemImg"></td>
                        <td>
                            <div>[오마하] 프라임 등심 스테이크 200g(냉장) 2</div>
                            <div>24,000원</div>
                        </td>
                        <td>
                            <input type="button" class="goBasket" data-toggle="modal" data-target="#myModal" value="장바구니 담기">
                            <input type="button" class="deleteList" value="삭제">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="label_check">
                                <input type="checkbox" class="ckbox jjimCheck" name="jjimCheck">
                            </label>
                        </td>
                        <td><img src="" class="itemImg"></td>
                        <td>
                            <div>[오마하] 프라임 등심 스테이크 200g(냉장) 3</div>
                            <div>24,000원</div>
                        </td>
                        <td>
                            <input type="button" class="goBasket" data-toggle="modal" data-target="#myModal" value="장바구니 담기">
                            <input type="button" class="deleteList" value="삭제">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="label_check">
                                <input type="checkbox" class="ckbox jjimCheck" name="jjimCheck">
                            </label>
                        </td>
                        <td><img src="" class="itemImg"></td>
                        <td>
                            <div>[오마하] 프라임 등심 스테이크 200g(냉장) 4</div>
                            <div>24,000원</div>
                        </td>
                        <td>
                            <input type="button" class="goBasket" data-toggle="modal" data-target="#myModal" value="장바구니 담기">
                            <input type="button" class="deleteList" value="삭제">
                        </td>
                    </tr>
                </tbody>
            </table>
            
            <div style="height: 100px;">
                <input type="button" id="goAllOrder" value="전체 주문하기">
                <input type="button" id="deleteAllList" value="찜 목록 비우기">
            </div>
            
            <!-- 선택하지 않고 찜목록 비우기나 전체 주문하기를 눌렀을 경우 나오는 팝업창 -->
            <div id="modal"></div>
            <div class="modal_common noSelect">
                <a href="javascript:;" class="close">X</a>
                <p class="title">알림메세지</p>
                <div class="con">
                    선택한 사항이 없습니다.
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
            
            <!-- Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" id="modal-all">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">상품 선택</h4>
                        </div>

                        <div class="modal-body">
                        <strong class="goodsname">애호박 1개</strong>
                        <ul class="list">
                            <li class="goods1">
                                <span class="goodsname2">애호박 1개</span>
                                <div class="adjust">
                                    <span class="goodsprice">1,480</span>
                                    <span class="goodswon">원</span>
                                    <button class="glyphicon glyphicon-minus" id="btndown"></button>
                                    <input type="text" readonly value="1" class="geatsu">
                                    <button class="glyphicon glyphicon-plus" id="btnup"></button>
                                </div>
                            </li>
                        </ul>
                
                        <div class="sum">
                            <strong class="sumname">합계</strong>
                            <strong class="sumnum">1,480</strong>
                            <strong class="won">원</strong>
                        </div>

                        <div class="save">
                            <span class="txtJukrip">
                                <span class="jukrip">적립</span>
                            </span>
                            <span class="getpoint">
                                <span class="ifyoubuy">구매 시 </span>
                                <strong class="savenum" id="sumPoint">7</strong>
                                <strong class="savewon">원 적립 </strong>
                            </span>
                        </div>
                    </div>
                    <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="cancle">취소</button>
                    <!-- <button type="button" class="btn btn-primary" id="basket">장바구니 담기</button> -->
                    <a tabindex="0" class="btn btn-lg btn-danger" role="button" data-toggle="popover" data-trigger="focus" title="애호박 1개" data-content="장바구니에 담겼습니다." data-placement="bottom" id="basket">장바구니 담기</a>
                    
                    </div>
                </div>
            </div>
        </div>
            
            <!-- 실제 데이터 구현되기 전까지 임의대로 실행해주는 버튼 -->
            <!-- 서버와 연결 후에 삭제할 부분 -->
            <div id="wrap">
                <a href="javascript:openModal('noSelect');" class="button modal-open">선택사항없음</a>
                <a href="javascript:openModal('bascketAlready');" class="button modal-open">동일상품존재</a>
            </div>

            <input type="button" value="찜목록없음" id="btnNoData">
            <input type="button" value="찜목록있음" id="btnYesData">
            
            <!-- ※ 오른쪽 영역 끝 ※ -->
            
        </div>
        <div style="clear:both;"></div>
    </div>


<!-- footer -->
<%@include file="/WEB-INF/views/inc/footer.jsp" %>

 <!-- script start -->
    <script>

	$("#MyMenu > div").removeClass("nowPage");
	$("#goMyStar").addClass("nowPage");

        // 전체 선택시 모든 찜 목록 체크됨.
        $("#checkAll").click(function() {
            var chk = $(this).is(":checked");
            if (chk) {
                $(".jjimCheck").prop('checked', true);
            } else {
                $(".jjimCheck").prop('checked', false);
            }
        });

        // 장바구니 선택시
        $(".goBasket").click(function() {
            
            // 장바구니 팝업창 뜨고
            // 장바구니 담기를 눌렀을 때 동일한 상품이 있으면 알림메세지
            // 동일한 상품이 없으면 바로 장바구니에 담기
            
        })

        // 삭제 선택시
        // 처음부터 있는 경우는 되는데 나중에 태그를 추가시에는 이 버튼 작동하지 않음 ㅠㅜ
        $(".deleteList").click(function() {
            $(this).parent().parent().remove();
            console.log($("#tblList").children().children().length);
            if ($("#tblList").children().children().length == 1) {
                $("#tblList tbody:last-child").append(`<tr><td class="no_data" colspan="4">찜 목록 내역이 없습니다.</td></tr>`);
            }
        });

        // 전체 주문하기 클릭시
        $("#goAllOrder").click(function() {

            // 찜 목록 체크박스에 체크된 것이 있는지 확인
            var chk = $(".jjimCheck").is(":checked");

            // 찜 목록 체크박스에 아무것도 없을 시에는 선택사항 없음 팝업창 뜨기
            if (!chk) { openModal('noSelect'); }
            // 그 외엔 주문 페이지로 넘어가기
            else {
                $("input[name='jjimCheck']:checked").each(function() {
                    
                });
            }
        });

        // 찜 목록 비우기
        $("#deleteAllList").click(function() {

            // 찜 목록 체크박스에 체크된 것이 있는지 확인
            var chk = $(".jjimCheck").is(":checked");

            // 찜 목록 체크박스에 아무것도 없을 시에는 선택사항 없음 팝업창 뜨기
            if (!chk) { openModal('noSelect'); }
            // 그 외엔 선택된 태그 삭제
            else {
                $("input[name='jjimCheck']:checked").each(function() {
                    $(this).parent().parent().parent().remove();
                    if ($("#tblList").children().children().length == 1) {
                        $("#tblList tbody:last-child").append(`<tr><td class="no_data" colspan="4">찜 목록 내역이 없습니다.</td></tr>`);
                    }
                });
            }
            
            // // 하위 태그 전부 삭제
            // $("#tblList tbody:last-child *").remove();
            // // 찜 목록이 없다고 나타내주는 태그 추가
            // $("#tblList tbody:last-child").append(`<tr><td class="no_data" colspan="4">찜 목록 내역이 없습니다.</td></tr>`);

        });
        
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

            sumpoint = parseInt(sum * 0.005);
            $("#sumPoint").text(numberWithCommas(sumpoint));

            $(".sumnum").text(numberWithCommas(sum));
           
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

            sumpoint = parseInt(sum * 0.005);
            $("#sumPoint").text(numberWithCommas(sumpoint));

            $(".sumnum").text(numberWithCommas(sum));
        
            // console.log($(".sumnum").text(numberWithCommas(sum)));
        });


        // 모달 열기
        function openModal(modalname){
            document.get
            $("#modal").fadeIn(300);
            $("."+modalname).fadeIn(300);
        }

        $("#modal, .close, .yes").on('click',function(){
            $("#modal").fadeOut(300);
            $(".modal_common").fadeOut(300);
        });


        // 버튼 클릭은 서버 적용 후에 삭제해야하는 데이터임.
        

        // 찜 목록이 있는 경우
        $("#btnYesData").click(function() {

            // 하위 태그 전부 삭제
            $("#tblList tbody:last-child *").remove();

            // 찜 목록 태그 작성
            var contents = `<tr>
                        <td>
                            <label class="label_check">
                                <input type="checkbox" class="ckbox jjimCheck" name="jjimCheck">
                            </label>
                        </td>
                        <td><img src="" class="itemImg"></td>
                        <td>
                            <div>[오마하] 프라임 등심 스테이크 200g(냉장) 1</div>
                            <div>24,000원</div>
                        </td>
                        <td>
                            <input type="button" class="goBasket" value="장바구니 담기">
                            <input type="button" class="deleteList" value="삭제">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="label_check">
                                <input type="checkbox" class="ckbox jjimCheck" name="jjimCheck">
                            </label>
                        </td>
                   <td><img src="" class="itemImg"></td>
                        <td>
                            <div>[오마하] 프라임 등심 스테이크 200g(냉장) 2</div>
                            <div>24,000원</div>
                        </td>
                        <td>
                            <input type="button" class="goBasket" value="장바구니 담기">
                            <input type="button" class="deleteList" value="삭제">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="label_check">
                                <input type="checkbox" class="ckbox jjimCheck" name="jjimCheck">
                            </label>
                        </td>
                        <td><img src="" class="itemImg"></td>
                        <td>
                            <div>[오마하] 프라임 등심 스테이크 200g(냉장) 3</div>
                            <div>24,000원</div>
                        </td>
                        <td>
                            <input type="button" class="goBasket" value="장바구니 담기">
                            <input type="button" class="deleteList" value="삭제">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="label_check">
                                <input type="checkbox" class="ckbox jjimCheck" name="jjimCheck">
                            </label>
                        </td>
                        <td><img src="" class="itemImg"></td>
                        <td>
                            <div>[오마하] 프라임 등심 스테이크 200g(냉장) 4</div>
                            <div>24,000원</div>
                        </td>
                        <td>
                            <input type="button" class="goBasket" value="장바구니 담기">
                            <input type="button" class="deleteList" value="삭제">
                        </td>
                    </tr>`;

            // 리스트, li 태그 추가
            $("#tblList tbody:last-child").append(contents);

        });


    </script>
    <script src="/mh/js/main.js"></script>
</body>
</html>