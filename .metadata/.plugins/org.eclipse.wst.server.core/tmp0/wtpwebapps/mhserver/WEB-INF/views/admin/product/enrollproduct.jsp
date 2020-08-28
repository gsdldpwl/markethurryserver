<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓허리 관리자 :: 상품관리</title>
</head>
<style>
        /* 상품등록 css */

        .prodcBody {
            width: 1600px;
        }

        .where {
            font-size:1.2em ;
            color: #999;
        }

        .mainTitle {
            width: 0 auto;
        }
        .mainTitle h1{
            /* border: 1px solid blueviolet; */
            font-size: 2em;
            font-weight: bold;
            /* height: 60px; */
        }

        #prodcTable {
            padding: 30px;
        }

        #prodcTable th {
            /* width: 150px; */
            height: auto;
            padding: 10px;
           text-align: center;
        }

        #prodcTable td .txtName {
            width: 200px;
            height: 25px;
        }
      
        #prodcTable td .gpselect {
            width: 200px;
            height: 25px;
        }  

        #prodcTable td .txtNum {
            width: 200px;
            height: 25px;
        }

        #prodcTable td .txtPr {
            width: 200px;
            height: 25px;
        }

        textarea {
            resize: none;
            width: 800px;
            height: 150px;
        }

        .InImg {
            padding: 30px;
            margin-left: 70px;
        }

        #inBtn {
            padding: 10px;
        }
        #inBtn button {
            text-align: center;
            width: 185px;
            height: 50px;
            background-color: #08718E;
            border: 1px solid white;
            border-radius: 3px;
            margin: auto;
            position: absolute;
            left: 900px;
        }

        /* modal css */

        .modal-body {
            font-size: 1.5em;
            text-align: center;
           padding: 50px;
        }
        .modal-footer {
            text-align: center;
        }
        .modal-footer #yyeess {
            width: 70px;
            height: 40px;
            background-color: #08718E;
            border: 1px solid white;
            color: white;
            border-radius: 3px;
            margin-right: 10px;
        }

        .modal-footer #nnoo {
            width: 70px;
            height: 40px;
            background-color: white;
            border: 1px solid #08718E;
            color: teal; 
            border-radius: 3px;
        }


    </style>

<%@include file="/WEB-INF/views/inc/admin_header.jsp" %>

<body>
	<!-- 메인 안에서 부터 구현하시면 됩니다. -->
<div id="main">

    <!-- 상품등록 페이지 -->
    <div id="container">

        <div id="headerTitle" style="margin: 30px 15px;">
            <div class="where">
                <span class="wh">
                    상품 관리 > 상품 등록
                </span>
            </div>
            <div class="mainTitle">
                <h1>상품 등록</h1>
            </div>
        </div>

        <div class="prodcBody">
                <table class="table table-bordered" id="prodcTable">
                    <tbody>
                        <tr class="titleName">
                            <th class="pdName">
                                상품명
                                <td class="nameSp">
                                    <input type="text" name="isProductName" class="txtName">
                                </td>
                            </th>
                        </tr>
                        
                         <tr class="titleGroup">
                              <th class="gpName">상품 분류
                                   <td class="gpSp">
                                       <select class="gpselect">
                                        <option value="0">- 분류선택 -</option>
                                        <option value="1">채소</option>
                                        <option value="2">과일</option>
                                        <option value="3">육류</option>
                                        <option value="4">수산</option>
                                        <option value="5">가공식품</option>
                                        <option value="6">양념소스</option>
                                        <option value="7">유제품</option>
                                        <option value="8">건강식품</option>
                                        <option value="9">음료</option>
                                         </select>
                                     </td>
                             </th>
                        </tr>

                        <tr class="titleNum">
                             <th class="pdNum">
                                상품번호
                                    <td class="numSp">
                                        <input type="text" name="isProductNum" class="txtNum">
                                    </td>
                            </th>
                         </tr>


                        <tr class="titlePrice">
                             <th class="gpPrice">
                                 상품 금액
                                     <td class="priceSp">
                                         <input type="text" name="isProductPr" class="txtPr">
                                         원
                                     </td>
                            </th>
                         </tr>

                                    <tr class="titleExp">
                                        <th class="pdExp">
                                            상품 요약설명
                                            <td class="expSp">
                                                <textarea  name="isProductExp" class="txtExp"></textarea>
                                            </td>
                                        </th>
                                    </tr>
                                    <tr class="titleDtExp">
                                        <th class="pdDtExp">
                                            상품 상세설명
                                            <td class="dtExpSp">
                                                <textarea  name="isProductDtExp" class="txtDtExp"> </textarea>
                                            </td>
                                        </th>
                                    </tr>
                                    
                                                <tr class="titleInImg">
                                                    <th class="pdImg">
                                                        대표 이미지
                                                        <td class="dtImg">
                                                            <span class="repImg">
                                                                <img src="../../images/salmon.JPG" class="upInImg">
                                                            </span>
                                                                 <div class="InImg">
                                                                    <input type="file" name="inImgFile" accept="image/*">
                                                                </div>
                                                        </td>
                                                    </th>
                                                </tr>
                                                <!-- <tr class="titleInsubImg">
                                                    <th class="pdImg">
                                                        추가 이미지
                                                        <td class="dtImg">
                                                            <span class="repImg"><추가 이미지1>
                                                                <img src="../../images/salmon2.JPG" class="upInImg">
                                                            </span>
                                                            <div class="InImg">
                                                                <input type="file" name="inImgFile" accept="image/*">
                                                            </div>
                                                        </td>
                                                    </th>
                                                </tr> -->
                    </tbody>
                </table>
                <div id="inBtn">
                  <button class="btn btn-lg btn-danger" data-toggle="modal" data-target="#myModal">등록</button>
                </div>

                <!-- Modal -->
             <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                    상품을 등록하시겠습니까?
                    </div>
                    <div class="modal-footer">
                    <button type="button" id="yyeess" data-dismiss="modal"  >네</button>
                    <button type="button" data-dismiss="modal" id="nnoo">아니요</button>
                    </div>
                </div>
                </div>
            </div>
                    </div>
                </div>




  </div>
        
    <script>
        $("#yyeess").click(function(){
            location.href="";
        });

    </script>
    <script src="/mh/js/admin_template.js"></script>
	
</body>
</html>