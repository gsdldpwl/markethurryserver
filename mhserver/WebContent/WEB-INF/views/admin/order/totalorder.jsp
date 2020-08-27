<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓허리 관리자 :: 주문관리</title>
</head>

<style>
    /* 상단 헤더 */
    #menustep>span {
        font-size: 1.2em;
        color: #999999;
    }

    #menuname>span {
        font-size: 2em;
        font-weight: bold;
        color: #666666;
    }

      /* 상단 헤더 */
      #menustep > span {
            font-size: 1.2em;
            color: #999999;
        }

        #menuname > span {
            font-size: 2em;
            font-weight: bold;
            color: #666666;
        }

        #menustep {
            margin-bottom: 15px;
        }

        #headerTitle {
            width: 1570px;
            margin: 30px auto;
        }

        /* 테이블 */
        #tblsearch {
            border-collapse: collapse;
            border: 1px solid #ccc;
            margin: 0px 15px;
            padding: 10px;
            width: 1550px;
        }
        
        #tblsearch td, #tblsearch th {
            border: 1px solid #ccc;
            height: 50px;
        }
        
        #tblsearch th {
            text-align: center;
            width: 200px;
            font-size: 1.2em;
            font-weight: bold;
            background-color: #F3F3F3;
        }

        #tblsearch td {
            width: 1350px;
            padding-left: 10px;
        }
        
        #taste { margin-left: 10px; }
        
        .datepick {height: 30px;}
        .ui-datepicker-week-end .ui-state-default {color:RED;}
        .hasDatepicker { 
            width: 120px;
            margin: 0px 10px;
            text-align: center;
        }
        
        #sel1, #sel2 {
            height: 30px;
            border-color: #aaa;
            margin-left: 10px;
        }

        .txtbox {
            height: 30px;
            width: 800px;
            border: 1px solid #aaa;
            margin-left: 5px;
            padding-left: 10px;
        }

        /* 버튼 */
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
            /* border: none; */
        }

        #orderBtn {
            width: 1570px;
            margin: 0px auto;
            margin-top: 30px;
            text-align: center;
            padding-bottom: 30px;
            border-bottom: 1px solid #aaa;
        }
        #searchresult {
            width: 1570px;
            margin: 0px auto;
            margin-top: 40px;
            font-size: 2em;
            font-weight: bold;
            color: #666666;
        }

        .SearchResultBox {
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

        #resultTable td {
            vertical-align: middle;
        }

        .overflowtd {
            overflow: hidden;
            height: 20px;
        }

</style>
<%@include file="/WEB-INF/views/inc/admin_header.jsp" %>
<body>
	 <div id="main">
        <div id="container">

            <!-- 전체 내용을 묶는 div#container -->
            <!-- main 상단 -->
            <div id="headerTitle">
                <div id="menustep"><span>홈 > 주문 관리 > 전체주문목록</span></div>
                <div id="menuname"><span>전체주문목록</span></div>
            </div>

            <!-- 기능별 검색내용을 입력하는 div를 묶는 div#searchOrder -->
             <!-- 기능별 검색내용을 입력하는 div를 묶는 div#searchOrder -->
             <form method="GET" action="/mh/admin/order/totalorderok.do" id="membersubmit">
            <table id="tblsearch">
                <tr>
                    <th>검색어</th>
                    <td>
                        <select id="sel1" name="category">
                            <option>아이디</option>
                            <option>상품명</option>
                        </select>
                        <input type="text" class="txtbox" id="txt1" name="word"/>
                    </td>
                </tr>
                <tr>
                    <th>기간</th>
                    <td>
                        <input type="text" class="datepick" id="date1" name="startdate"/>
                        <span id="taste">~</span>
                        <input type="text" class="datepick" id="date2" name="enddate"/>
                    </td>
                </tr>
            </table>
			</form>

            <!-- 검색 버튼을 묶는 orderBtn-->
            <div id="orderBtn">
                <input type="button" value="검색" id="btn1" class="btnSearch" />
                <input type="button" value="초기화" id="btn2" class="btnSearch" />
            </div>

            <!-- 검색결과 -->
            <div id="searchresult">▶ 검색결과</div>

            <div id="result">
                <div id="orderResult">검색결과 ( <span id="resultCount" style="color: red;">0</span>건 )</div>
                <table id="resultTable" class="table table-bordered">
                    <tr class="resultList">
                        <th><input type="checkbox" id="allCheck"></th>
                        <th id="thnum">주문번호</th>
                        <th id="thdate">주문날짜</th>
                        <th id="thcate">상품분류</th>
                        <th id="thname">상품명</th>
                        <th id="thqty">수량</th>
                        <th id="thprice">가격</th>
                    </tr>
					<c:forEach items="${list}" var="dto">
                    <tr class="resultList"> 
                        <td> <input type="checkbox" class="productCheck"></td>
                        <td>${dto.seq }</td>
                        <td>${dto.regdate }</td>
                        <td >
                            <div class="productCategory overflowtd">
                                <div>${dto.category }</div>
                            </div>
                        </td>
                        <td>
                            <div class="productName overflowtd">
                                <div>${dto.name }</div>
                            </div>
                        </td>
                        <td>
                            <div class="productQty overflowtd">
                                <div>${dto.qty }</div>
                            </div>
                        </td>
                        <td>${dto.price}</td>
                    </tr>
                    </c:forEach>
                </table>
            </div>

            <!-- 삭제 버튼 -->
            <div id="secondBtn"><input type="button" value="삭제" id="deleteBtn" class="btnSearch" /></div>

        </div>
    </div>
    <script>


        // 테이블의 행 갯수 (지금은 검색된 결과의 갯수)
        var resultCount = $("#resultTable tbody tr").length - 1;
        $("#resultCount").text(resultCount);

        
        $(".resultList").click(function(){
            var overflowstatus = $(this).children().children().css("overflow");
            if(overflowstatus == "visible" || overflowstatus == "hidden"){
                $(this).children().children().css({
                    "overflow":"auto",
                    "height": "auto"
                });
            } else {
                $(this).children().children().css({
                    "overflow":"hidden",
                    "height": "20px"
                });
            }
        })

        $("#allCheck").click(function(){
            if($(this).prop("checked") == false){
                $("input[type=checkbox]").prop("checked",false);
            } else {
                console.log("nocheck")
                $("input[type=checkbox]").prop("checked",true);
            }
        })
        
        $("#btn1").click(function(){
        	if($("#txt1").val().length > 0 || ($("#date1").val().length > 0 && $("#date2").val().length > 0)){
	        	$("#membersubmit").submit();
        	} else {
        		alert("검색어, 날짜 중 하나를 입력해주세요.");
        	}
        })
            
    </script>
    <script src="/mh/js/admin_template.js"></script>
</body>
</html>