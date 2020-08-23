<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/inc/header.jsp" %>
    <style>

        #topImg {
            background: url(../../images/499678.jpg) no-repeat 50% 0;
        }

        #top {
            width: 1100px;
            height: 600px;
            margin: 0px auto;
            padding: 60px 20px;
        }

        #top span {
            display: block;
            font-size: 1.3em;
            color: #222;
            letter-spacing: -1.5px;
        }

        #top span:nth-child(1) { margin: 10px 0px; }
        #top span:nth-child(2),
        #top span:nth-child(3) {
            font-size: 6em;
            font-weight: bold;
            height: 70px;
        }

        #top span:nth-child(4) { margin-top: 50px; }

        /* fieldset 관련 css */
        fieldset {
            width: 1000px;
            margin: 50px auto;
        }
        fieldset legend {color: #ccc; letter-spacing: -2px; padding-bottom: 5px;}
        fieldset strong {color: #666; font-size: 1.1em;}
        fieldset ul { list-style: none; padding-left: 0px; }
        fieldset li { padding: 2px 25px; letter-spacing: -0.5px; }

        /* 등급 테이블 */
        #tblMemebrship {
            border-collapse: collapse;
            /* border: 1px solid #ccc; */
            text-align: center;
            width: 840px;
            height: 300px;
            margin: 10px auto;
            color: #555;
            letter-spacing: -0.5px;
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
        #memberDia div:first-child { background-color: #08718E; color: white;}
        #memberPla { border-bottom: 3px solid #2983a3; }
        #memberPla div:first-child { background-color: #2983a3; color: white;}
        #memberGld { border-bottom: 3px solid #3c98b9; }
        #memberGld div:first-child { background-color: #3c98b9; color: white;}
        #memberSlv { border-bottom: 3px solid #5abadd; }
        #memberSlv div:first-child { background-color: #5abadd; color: white;}
        #memberBrz { border-bottom: 3px solid #7bd2f1; }
        #memberBrz div:first-child { background-color: #7bd2f1; color: white;}
        #memberBas { border-bottom: 3px solid #aee9ff; }
        #memberBas div:first-child { background-color: #aee9ff; color: white;}


        #lastcontent { margin-bottom: 100px; }

    </style>
</head>

<body>

    <!-- 자신의 내용은 여기부터 추가하면 됩니다. -->
    <div id="topImg">
        <div id="top">
            <span>특별한 당신을 위한 합리적 혜택</span>
            <span>HURRY</span>
            <span>LOVERS</span>
            <span>HURRY를 아껴주시는 고객님들께 더 많은 사랑을 돌려드리기 위해</span>
            <span><b>매월 결제 금액에 따라 실용적이고 다채로운 혜택</b>을 전합니다.</span>
        </div>
    </div>

    <fieldset id="benefit">
        <legend>01 <strong>회원 등급별 혜택</strong></legend>
        <table id="tblMemebrship">
            <tr>
                <td></td>
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
                <td>할인율</td>
                <td>5%</td>
                <td>4%</td>
                <td>3%</td>
                <td>2%</td>
                <td>1%</td>
                <td>0.5%</td>
            </tr>
            <tr id="accrualRate">
                <td>적립률</td>
                <td>10%</td>
                <td>7%</td>
                <td>5%</td>
                <td>3%</td>
                <td>1%</td>
                <td>0.5%</td>
            </tr>
        </table>
    </fieldset>

    <fieldset>
        <legend>02 <strong>회원 등급 적용 안내</strong></legend>
        <ul>
            <li>매월 1일에 전월(1일 ~ 말일)누적 결제 금액을 기준으로 새로운 등급이 적용됩니다.</li>
            <li>결제 금액은 주문 금액에서 할인, 쿠폰을 제외한 금액입니다.</li>
        </ul>
    </fieldset>

    <fieldset id="lastcontent">
        <legend>03 <strong>적립금 지급 안내</strong></legend>
        <ul>
            <li>적립금은 결제 금액에 적립률을 곱한 금액으로, 주문일 다음날 오전 7시에 지급됩니다.</li>
            <li>주문 취소 시, 지급되었던 적립금은 자동 차감됩니다.</li>
        </ul>
    </fieldset>


<!-- footer -->
<%@include file="/WEB-INF/views/inc/footer.jsp" %>

    <!-- script start -->
    <script>
    </script>
    <script src="/mh/js/main.js"></script>
    
</body>
</html>