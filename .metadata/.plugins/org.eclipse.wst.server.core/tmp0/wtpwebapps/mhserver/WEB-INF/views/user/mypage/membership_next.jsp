<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/inc/header.jsp" %>
    <style>

        /* fieldset 관련 css */
        fieldset {
            width: 1000px;
            margin: 50px auto;
        }
        fieldset legend {color: #ccc; letter-spacing: -2px; padding-bottom: 5px;}
        fieldset strong {color: #666; }
        fieldset ul { list-style: none; padding-left: 0px; }
        fieldset li { padding: 2px 25px; letter-spacing: -0.5px; }

        #benefit {margin-top: 100px;}
        #benefit {border: 2px solid #ddd; }
        #benefit legend {width: 290px;}
        #benefit strong {font-size: 1.3em;}
        #benefit legend:first-child { text-align: center; border: none; }

        /* 내 등급 */
        #myGrade {
            width: 80px;
            height: 80px;
            margin: 30px auto 70px;
            text-align: center;
            line-height: 80px;
            border-radius: 10px;
            letter-spacing: -0.5px;
            font-size: 1.05em;
            font-weight: bold;
            border: 1px solid #aee9ff;
            color: #aee9ff;
            background-color: white;
        }

        /* 등급 테이블 */
        #tblMemebrship {
            border-collapse: collapse;
            /* border: 1px solid #ccc; */
            text-align: center;
            width: 720px;
            height: 300px;
            margin: 10px auto;
            color: #555;
            letter-spacing: -0.5px;
            margin-bottom: 100px;
        }

        #tblMemebrship td, .grade {height: 100px; width: 120px;}
        #tblMemebrship .grade div:nth-child(1) {height: 40px; line-height: 40px; font-weight: bold; font-size: 1.1em;}
        #tblMemebrship .grade div:nth-child(2) {height: 20px; line-height: 35px;}
        #tblMemebrship .grade div:nth-child(3) {height: 40px; line-height: 35px;}
        #tblMemebrship tr > td:nth-child(odd) { background-color: #fafafa; }
        #tblMemebrship tr > td:nth-child(even) { background-color: #f5f5f5; }
        #tblMemebrship tr:nth-child() { background-color: #f5f5f5; }
        #saleRate td:first-child, #accrualRate td:first-child { font-weight: bold; }

        #memberDia { border-bottom: 3px solid #08718E; }
        #tblMemebrship tr:nth-child(1) > td:nth-child(1) { border-top: 2px solid #08718E; }
        #memberDia div:first-child { background-color: #08718E; color: white;}
        #memberPla { border-bottom: 3px solid #2983a3; }
        #tblMemebrship tr:nth-child(1) > td:nth-child(2) { border-top: 2px solid #2983a3; }
        #memberPla div:first-child { background-color: #2983a3; color: white;}
        #memberGld { border-bottom: 3px solid #3c98b9; }
        #tblMemebrship tr:nth-child(1) > td:nth-child(3) { border-top: 2px solid #3c98b9; }
        #memberGld div:first-child { background-color: #3c98b9; color: white;}
        #memberSlv { border-bottom: 3px solid #5abadd; }
        #tblMemebrship tr:nth-child(1) > td:nth-child(4) { border-top: 2px solid #5abadd; }
        #memberSlv div:first-child { background-color: #5abadd; color: white;}
        #memberBrz { border-bottom: 3px solid #7bd2f1; }
        #tblMemebrship tr:nth-child(1) > td:nth-child(5) { border-top: 2px solid #7bd2f1; }
        #memberBrz div:first-child { background-color: #7bd2f1; color: white;}
        #memberBas { border-bottom: 3px solid #aee9ff; }
        #tblMemebrship tr:nth-child(1) > td:nth-child(6) { border-top: 2px solid #aee9ff; }
        #memberBas div:first-child { background-color: #aee9ff; color: white;}

        /* 여백용 */
        #middlecontent { margin-top: 100px; }
        #lastcontent { margin-bottom: 100px; }

        /* 이번달 등급 */
        #tblMemebrship tr:nth-child(1) .nowGrade {
        	border-top-color: #08718E !important;
        	border-right: 2px solid #08718E;
        	border-left: 2px solid #08718E;
        	}
        #tblMemebrship tr:nth-child(2) .nowGrade { border-left: 2px solid #08718E; border-right: 2px solid #08718E; }
        #tblMemebrship tr:nth-child(3) .nowGrade { border: 2px solid #08718E; border-top: none; }
        /* #tblMemebrship tr > td:nth-child(6) { background-color: #aee9ff; } */

    </style>
</head>

<body>

    <!-- 자신의 내용은 여기부터 추가하면 됩니다. -->

    <fieldset id="benefit">
        <legend><strong>다음달 나의 예상 등급</strong></legend>
        <c:if test="${total < 150000}">
        <div id="myGrade" style="color: #aee9ff; border-color: #aee9ff">MEMBER</div>
        </c:if>
        <c:if test="${total >= 150000 && total < 300000}">
        <div id="myGrade" style="color: #7bd2f1; border-color: #7bd2f1">BRONZE</div>
        </c:if>
        <c:if test="${total >= 300000 && total < 500000}">
        <div id="myGrade" style="color: #5abadd; border-color: #5abadd">SILVER</div>
        </c:if>
        <c:if test="${total >= 500000 && total < 1000000}">
        <div id="myGrade" style="color: #3c98b9; border-color: #3c98b9">GOLD</div>
        </c:if>
        <c:if test="${total >= 1000000 && total < 1500000}">
        <div id="myGrade" style="color: #2983a3; border-color: #2983a3">PLATINUM</div>
        </c:if>
        <c:if test="${total >= 1500000}">
        <div id="myGrade" style="color: #08718E; border-color: #08718E">DIAMOND</div>
        </c:if>
        <table id="tblMemebrship">
            <tr>
                <td>
                    <div id="memberDia" class="grade">
                        <div>DIAMOND</div>
                        <div>전월 결제</div>
                        <div>150만원 이상</div>
                    </div>
                </td>
                <td>
                    <div id="memberPla" class="grade">
                        <div>PLATINUM</div>
                        <div>전월 결제</div>
                        <div>100만원 이상</div>
                    </div>
                </td>
                <td>
                    <div id="memberGld" class="grade">
                        <div>GOLD</div>
                        <div>전월 결제</div>
                        <div>50만원 이상</div>
                    </div>
                </td>
                <td>
                    <div id="memberSlv" class="grade">
                        <div>SILVER</div>
                        <div>전월 결제</div>
                        <div>30만원 이상</div>
                    </div>
                </td>
                <td>
                    <div id="memberBrz" class="grade">
                        <div>BRONZE</div>
                        <div>전월 결제</div>
                        <div>15만원 이상</div>
                    </div>
                </td>
                <td>
                    <div id="memberBas" class="grade">
                        <div>MEMBER</div>
                        <div>전월 결제</div>
                        <div>15만원 미만</div>
                    </div>
                </td>
            </tr>
            <tr id="saleRate">
                <td>5% 할인</td>
                <td>4%</td>
                <td>3%</td>
                <td>2%</td>
                <td>1%</td>
                <td>0.5%</td>
            </tr>
            <tr id="accrualRate">
                <td>10%</td>
                <td>7%</td>
                <td>5%</td>
                <td>3%</td>
                <td>1%</td>
                <td>0.5%</td>
            </tr>
        </table>
    </fieldset>

    <fieldset id="middlecontent">
        <legend> <strong>회원 등급 적용 안내</strong></legend>
        <ul>
            <li>매월 1일에 전월(1일 ~ 말일)누적 결제 금액을 기준으로 새로운 등급이 적용됩니다.</li>
            <li>결제 금액은 주문 금액에서 할인, 쿠폰을 제외한 금액입니다.</li>
        </ul>
    </fieldset>

    <fieldset id="lastcontent">
        <legend> <strong>적립금 지급 안내</strong></legend>
        <ul>
            <li>적립금은 결제 금액에 적립률을 곱한 금액으로, 주문일 다음날 오전 7시에 지급됩니다.</li>
            <li>주문 취소 시, 지급되었던 적립금은 자동 차감됩니다.</li>
        </ul>
    </fieldset>


<!-- footer -->
<%@include file="/WEB-INF/views/inc/footer.jsp" %>

    <!-- script start -->
    <script>
		var total = '<c:out value="${total}"/>';
		
		if (total < 150000) {
			//MEMBER등급
			$(".grade").parents().removeClass("nowGrade");
			$("#memberBas").parents().addClass("nowGrade");
			
			$("#saleRate td").removeClass("nowGrade");
			$("#saleRate td:nth-child(6)").addClass("nowGrade");
			
			$("#accrualRate td").removeClass("nowGrade");
			$("#accrualRate td:nth-child(6)").addClass("nowGrade");
			
		} else if (total >= 150000 && total < 300000) {
			//BRONZE 등급
			$(".grade").parents().removeClass("nowGrade");
			$("#memberBrz").parents().addClass("nowGrade");	
			
			$("#saleRate td").parents().removeClass("nowGrade");
			$("#saleRate td:nth-child(5)").addClass("nowGrade");
			
			$("#accrualRate td").removeClass("nowGrade");
			$("#accrualRate td:nth-child(5)").addClass("nowGrade");
			
		} else if (total >= 300000 && total < 500000) {
			//SLIVER 등급
			$(".grade").parents().removeClass("nowGrade");
			$("#memberSlv").parents().addClass("nowGrade");			
			
			$("#saleRate td").parents().removeClass("nowGrade");
			$("#saleRate td:nth-child(4)").addClass("nowGrade");
			
			$("#accrualRate td").removeClass("nowGrade");
			$("#accrualRate td:nth-child(4)").addClass("nowGrade");
			
		} else if (total >= 500000 && total < 1000000) {
			//GOLD 등급
			$(".grade").parents().removeClass("nowGrade");
			$("#memberGld").parents().addClass("nowGrade");	
			
			$("#saleRate td").removeClass("nowGrade");
			$("#saleRate td:nth-child(3)").addClass("nowGrade");
			
			$("#accrualRate td").removeClass("nowGrade");
			$("#accrualRate td:nth-child(3)").addClass("nowGrade");
			
		} else if (total >= 1000000 && total < 1500000) {
			//PLATINUM 등급
			$(".grade").parents().removeClass("nowGrade");
			$("#memberPla").parents().addClass("nowGrade");	
			
			$("#saleRate td").removeClass("nowGrade");
			$("#saleRate td:nth-child(2)").addClass("nowGrade");
			
			$("#accrualRate td").removeClass("nowGrade");
			$("#accrualRate td:nth-child(2)").addClass("nowGrade");
			
		} else if (total >= 1500000) {
			//DIAMOND 등급
			$(".grade").parents().removeClass("nowGrade");
			$("#memberDia").parents().addClass("nowGrade");	
			
			$("#saleRate td").removeClass("nowGrade");
			$("#saleRate td:nth-child(1)").addClass("nowGrade");
			
			$("#accrualRate td").removeClass("nowGrade");
			$("#accrualRate td:nth-child(1)").addClass("nowGrade");
			
		}
    </script>
    <script src="/mh/js/main.js"></script>
    
</body>
</html>