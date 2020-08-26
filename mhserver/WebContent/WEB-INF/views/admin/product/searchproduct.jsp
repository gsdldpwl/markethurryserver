<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓허리 관리자 :: 상품관리</title>
</head>
<%@include file="/WEB-INF/views/inc/admin_header.jsp" %>

<style>

	#menustep {
            margin-bottom: 15px;
        }

        #menustep > span {
            font-size: 1.2em;
            color: #999999;
        }

        #menuname > span {
            font-size: 2em;
            font-weight: bold;
            color: #666666;
        }

         /* 상단 헤더 */
         #headerTitle {
            width: 1570px;
            margin: 30px auto;
        }

        /*  */
        #searchOrder {
            /* 검색 감싸기 */
            border:none;
            width: 1570px;
            margin: 0px auto;

        }
        
        #searchOrder > div > div {
            background-color: #F3F3F3;
            border-right: 1px solid #ccc;
            width: 180px;
            height: 58px;
            padding-top: 18px;
            padding-left: 8px;
            font-size: 1.2em;
            font-weight: bold;
            float: left;
        }
        #sel1 {
            /* 검색어의 주문번호*/
            border:1px solid #ccc;
            margin: 16px 10px;
            outline: none;
            height: 30px;
        }

        #txt1,
        #txt2  {
            /* 검색어 & 상품 text box */
            border:1px solid #ccc;
            width: 1000px;
            height: 30px;
            outline: none;
        }
        #date1 {
            /* 기간 */
            margin-left: 10px;
            margin-top: 11px;
        }

        #taste {
            /* 기간 물결 */
            margin: auto 20px;
        }

        #sel2 {
            /* 상품 감싸기 */
            margin: 16px 8px;
            width: 85px;
            height: 30px;
            outline: none;
            border: 1px solid #ccc;
        }
        .btnSearch { 
            outline: none;
            background-color: white;
            border: 1px solid #ccc;
            font-weight: bold;
            width: 100px;
            height: 40px;
            padding-top: 10px;
            padding-bottom: 25px;
        }

        
        
        #btn1 {
            /* 검색 버튼 */
            background-color: #ccc;
            border: none;
        }

        #orderBtn {
            width: 1570px;
            margin: 0px auto;
            margin-top: 30px;
            
            text-align: center;
        }

        #SearchWord,
        /* #period, */
        #product,
        #price {
            /* 검색어,기간,상품 상자*/
            border: 1px solid #ccc;  
            border-bottom: none;
            width: 1570px;
            margin: 0px auto;
            height: 60px;
        }

        #period {
            border: 1px solid #ccc;  
            /* border-bottom: none; */
            width: 1570px;
            margin: 0px auto;
            height: 60px;
        }

        #product {
            /* 상품 상자*/
            border: 1px solid #ccc;;
        }

        #searchresult {
            /* 검색결과 안 박스 감싸기 */
            width: 1570px;
            margin: 0px auto;
            margin-top: 40px;
        }

        #searchresult {
            margin: 70px 40px;
            margin-bottom: 10px;
            font-size: 2em;
            font-weight: bold;
            color: #666666;
        }

        .SearchResultBox {
            /* 검색결과 안 박스 메뉴들 */
            width: 310px;
            height: 40px;
            text-align: center;
        }

        #result {
            border: none;
            width: 1570px;
            margin: 0px auto;
        }
        
        #orderResult {
            margin: 20px auto;
        }


        #deleteBtn {
            background-color: #ccc;
        }

        #secondBtn {
            width: 1570px;
            margin: 0px auto;
            text-align: right;
        }
        
</style>


<body>
	
	<div id="main">
    <!-- 전체 내용을 묶는 div#container -->
    <div id="container">
    
    <!-- 상단 카테고리를 묶는 div#headerTitle -->
    <div id="headerTitle">
        <div id="menustep"><span>홈 > 상품관리 > 상품조회</span></div>
        <div id="menuname"><span>상품조회</span></div>
    </div>

    

        <!-- 종류별 검색을 진행하는 div#searchOrder -->
        <div id="searchOrder">
            <div id="SearchWord">
                <div>검색 분류</div>
                <select id="sel1">
                    <option>분류 선택</option>
                    <option>상품명</option>
                    <option>상품번호</option>
                </select>
                <input type="text" id="txt1" required value="${search}">
            </div>

            <div id="product">
                <div>상품 분류</div>
                <select id="sel2">
                    <option>분류 선택</option>
                    <option>채소</option>
                    <option>과일</option>
                    <option>육류</option>
                    <option>수산</option>
                    <option>가공식품</option>
                    <option>소스</option>
                    <option>유제품</option>
                    <option>건강식품</option>
                    <option>음료</option>
                </select>
                <input type="text" id="txt2">
            </div>

            <div id="price">
                <div>상품 금액</div>
                <input type="text" id="startPrice" style="margin-left: 10px; margin-top: 11px; text-align: right;"><span>원</span>
                <span style="margin: auto 20px;"> ~ </span>
                <input type="text" id="endPrice" style="text-align: right;"><span> 원</span>
            </div>

            <div id="period">
                <div>등록일</div>
                <input type="text" id="date1" style="margin-left: 10px; margin-top: 11px;" disabled>
                <span style="margin: auto 20px;">~</span>
                <input type="text" id="date2" disabled>
            </div>
            
        </div>

        <!-- 검색 버튼을 묶는 orderBtn-->
        <div id="orderBtn">
            <button type="submit" id="btn1" class="btnSearch">검색</button>
            <input type="button" value="초기화" id="btn2" class="btnSearch">
        </div>
        
        
        
        
        
        
        


        <!-- 검색 결과 헤더를 묶는 div#ResultHeader -->
        <div id="searchresult">▶ 검색결과</div>

        <div id="result">
            <div id="orderResult">검색결과 ( <span id="resultCount" style="color: red;">0</span>건 )</div>
        

        <!-- 검색 결과 내용을 묶는 div#result -->
        <!-- <div style="width: 1570px; margin: 20px 55px;"> -->
            <table id="resultTable" class="table table-bordered">
                <tr style="text-align:center;">
                    <th>
                        <input type="checkbox" id="allCheck">
                    </th>
                    <th>상품번호</th>
                    <th>상품 분류</th>
                    <th>상품명</th>
                    <th>상품 금액</th>
                    <th>상품 등록일</th>
                </tr>
                

                
                <c:forEach items="${list}" var="dto">
                
                <tr>
                	<td><input type="checkbox" class="productCheck"></td>
                    <td>${dto.seq}</td>
                    <td>${dto.category}</td>
                    <td>${dto.name}</td>
                    <td class="productprice" style="text-align: right;">${dto.price }</td>
                    <td>${dto.regdate}</td>
                </tr>
                
                </c:forEach>
                
                
                <c:if test="${not empty search and list.size() == 0}">
	           	<tr style="text-align:center;">
	           		<td colspan="6">검색 결과가 없습니다.</td>
	           	</tr>                    	
		        </c:if>
	
                
                <!-- <tr>
                    <td>
                        <input type="checkbox" id="c1" class="productCheck">
                    </td>
                    <td>125</td>
                    <td>채소</td>
                    <td>애호박 1개</td>
                    <td class="tblPrice"><span>1,480</span><span>원</span></td>
                    <td>2020-07-11</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" id="c2" class="productCheck">
                    </td>
                    <td>312</td>
                    <td>과일</td>
                    <td>자두(1kg)</td>
                    <td class="tblPrice"><span>8,900</span><span>원</span></td>
                    <td>2020-07-13</td>
                </tr> -->
            </table>

        </div>

        <!-- 수정, 삭제 버튼을 묶는 div#modDelBtn -->
         <!-- 삭제 버튼 -->
         <div id="secondBtn"><input type="button" value="삭제" id="deleteBtn" class="btnSearch" /></div>

    <!-- </div> -->

</div>
</div>
    
    <script>

        // 전체 체크 순회
        // $("input:checkbox[name=is_check]").each(function() {
        //     this.checked = true;
        // });

        // 체크박스 전체선택
        var check = true;

        $("#allCheck").click(function() {
            if (check) {
                // $("#c1").prop("checked", true);
                // $("#c2").prop("checked", check)
                $("input:checkbox[class=productCheck]").each(function() {
                    this.checked = check;
                });
                check = false;
            } else {
                // $("#c1").prop("checked", check);
                // $("#c2").prop("checked", check);
                $("input:checkbox[class=productCheck]").each(function() {
                    this.checked = check;
                });
                check = true;
            }
        });


        // datepicker 출력
        $(function() {
            $("#date1").datepicker({
                dateFormat: "yy-mm-dd",
                showOn: "both",
                buttonImage: "/mh/images/icons8-calendar-28.png",
                buttonImageOnly: true,
                buttonText: "Select date"
            });

            $("#date2").datepicker({
                dateFormat: "yy-mm-dd",
                showOn: "both",
                buttonImage: "/mh/images/icons8-calendar-28.png",
                buttonImageOnly: true,
                buttonText: "Select date"
            });
        });

        // 검색버튼 클릭
        $("#btn1").click(function() {

            // 항목이 모두 빈칸이면 전체검색
            if ( ($("#txt1").val() == "") && ($("#txt2").val() == "") 
                && ($("#startPrice").val() == "") && ($("#endPrice").val() == "")
                && ($("#date1").val() == "") && ($("#date2").val() == "") ) {
                    alert("전체 검색");
                } 
                
        });

        // 초기화버튼 클릭
        $("#btn2").click(function() {
            $("#txt1").val("");
            $("#txt2").val("");
            $("#startPrice").val("");
            $("#endPrice").val("");
            $("#date1").val("");
            $("#date2").val("");

        });


        // 천단위 , 찍기
        function numberWithCommas(x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }

        var productprice = $("#productprice").text();
        
        $(".productprice").each(function(index, item){
        	var beforeprice = $(item).text();
        	$(item).text(numberWithCommas(beforeprice));
        })
        
        
        
        
        // var startPrice;
        // 가격 칸 천단위 찍어주기
        // $("#startPrice").on("input", function() {
        // });
        //     startPrice = $("#startPrice").val();
        // $("#startPrice").val(numberWithCommas(startPrice));



        // 테이블의 행 갯수 (지금은 검색된 결과의 갯수)
        // 1을 뺀 이유는 헤더부분(첫 행) 제외
        var resultCount = $("#resultTable tbody tr").length - 1;

        // 검색결과 몇건인지
        $("#resultCount").text(resultCount);

        // 수정버튼 클릭
        $("#modifyBtn").click(function() {
           // 체크된 갯수
            var checkCount = $("input:checkbox[class=productCheck]:checked").length;
            // console.log(checkCount);
            if (checkCount == 0) alert("수정하려는 상품을 선택하세요.");
            else {
                // 수정 폼으로 이동
            }
        });

        // 삭제버튼 클릭
        $("#deleteBtn").click(function() {
            // 체크된 갯수
            var checkCount = $("input:checkbox[class=productCheck]:checked").length;
            // console.log(checkCount);
            if (checkCount == 0) alert("삭제하려는 상품을 선택하세요.");
            else {
                $("input:checkbox[class=productCheck]:checked").parent().parent().remove();
                alert("삭제가 완료되었습니다.");
                resultCount = resultCount - checkCount;
                $("#resultCount").text(resultCount);
            }
        });
        
        
        
        
        
        
        $("#txt1").focus(function() {
        	$(this).attr("value", "");
        })

        $("#txt1").keyup(function() {

        if(event.keyCode ==  13){
        	var search = $("#txt1").val();
        	location.href="/mh/admin/product/searchproduct.do?search="+search;
        }
        });




        $("#btn1").click(function(){
        	var search = $("#txt1").val();
        	location.href="/mh/admin/product/searchproduct.do?search=" +search;
        })
        

    </script>
	
	
	
	
	<script src="/mh/js/admin_template.js"></script>
</body>
</html>