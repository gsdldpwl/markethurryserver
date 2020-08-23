<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MarketHurry :: 내레시피</title>
<%@include file="/WEB-INF/views/inc/header.jsp" %>
<style>
   /* 소진구현 */
   			* {
   			outline: none;
   			}
		   	#container {
		   	/* 전체 */
		   	width: 1200px;
		   	margin: 0px auto;

		   	}
		   	
            #foodType,
            #title1 {
                text-align: center;
            }

            #foodType {
                /* 음식타입 */
                color: #666666;
            }

            #title1 {
                /*  제목 */
                font-size: 2.5em;
                margin-bottom: 50px;
            }

            #MainTitle {
                margin: 110px auto;
                width: 1100px;
                margin-bottom: -12px;
            }

            #UserID,
            #Date,
            #viewnum {
                color: #666666;
            }

            #Date,
            #viewnum {
                text-align: right;
                width: 200px;
                margin-left: 900px;
            }

            #UserID {
                text-align: left;
                margin-top: 20px;
                float: left;
                text-align: left;
                width: 100px;
            }

            .foodpic {
          		text-align:center;
                margin: 0px auto;
            }

            #pasta1 {
                /*음식사진*/
                width: 600px;
                height: 500px;
                margin: 0px auto;
            }

            #ExplainRCP {
                /*  레시피 글 */
                background-color: white;
                margin-top: 60px;
                width: 1100px;
                margin: 0px auto;
                margin-bottom: 100px;
                text-align: center;
            }

            #RCPsetBox {
                /* recipe set 상자  */
                width: 1100px;
                margin: 0px auto;
            }

            #RCPsetBox > fieldset legend {
                /* 상자 제목 */
                margin-top: 350px;
                font-size: 30px;
            	text-align: center;
                font-weight: bold;
                border: none;
                width: 400px;
                color: #08718e;
            }

            fieldset {
                border: 2px solid #ccc;
                width: 1100px;
                height: 320px;
                margin: 0px auto;
            }

			#PDExplainBox{
			/* 음식 사진 + 가격 + 이름 전체 */
				width: 50%;
				float: left;
				text-align: center;
			}
            
            #foodPic {
                /* 상자안 사진 */
                width: 200px;
                height: 150px;
            }

            #sellingFoodName {
                /* 상자안 음식 제목 */
                font-weight: bold;
                margin-top: 10px;
                font-size: 20px;

            }

            #SalePrice {
                /* 상자안 가격 */
                padding-top:20px;
                font-weight: bold;
                font-size: 15px;
            }

			#FDListBox {
			/* 상자안 음식 종류 리스트 + 가격리스트  전체*/
				float:right;
				width: 50%;
				margin-top: 30px;
			
			}
            #menuMaterial {
                /* 상자안 음식 종류 */
                letter-spacing: 0.5px;
            }

            .MatarialName {
                /* 상자 안 음식 이름 */
                padding-left: 10px;
                width: 400px;
               
            }

            .rcpPrice {
                /* 상자 안 음식 종류가격 */
                padding-left: 30px;
                text-align: right;
                width: 100px;
            }

            #Cartfood {
                /* 장바구니버튼 전체 */
                width: 1172px;
                margin: 0px auto;
                padding: 35px;
            }

            .InputCart {
                /* 장바구니에 담기 버튼 */
                float: right;
                color: #08718e;
                font-weight: bold;
                width: 120px;
                height: 40px;
                border: 1px solid #08718e;
                background-color: white;
            }

			#allAnwser {
			/* 댓글 전체 */
				padding-top : 100px;
			
			}
            #Answerbox {
                /* 댓글 박스 */
                width: 1100px;
                margin: 0px auto;
            }

            #AnwserTitle {
                /* 댓글글자 */
                width: 1100px;
                font-size: 20px;
                font-weight: bold;
                margin: 0px auto;
                border-bottom: 1px solid rgb(196, 193, 193);
            }

            #UserCommnet1 {
                /* 댓글 작은상자 */
                width: 1098px;
                margin: 0px auto;
                border-bottom: 1px solid rgb(196, 193, 193);
                padding: 10px;
            }

            .AnswerUserId {
                /* 댓글 사용자 아이디 */
                font-weight: bold;
                margin-bottom: 10px;
                font-size: 15px;
                
            }

            .AnswerDate {
                /* 댓글 작성날짜 */
                margin-top: 10px;
                color: #666666;
                font-size: 12px;
            }

            .ReAnswer {
                /* 댓글에 답글달기 버튼*/
                margin-top: 15px;
                background-color: white;
                border: 1px solid white;
                font-weight: bold;
            }

            .TextReAnswer {
                /* 답글 달기 textarea */
                width: 95%;
                height: 100%;
            }

            .RegisterAnswer {
                /* 답글 달기 등록 버튼 */
                float: right;
                height: 100%;
                background-color: white;
                border: 1px solid black;
                font-weight: bold;
              
            }

            .NewReAnswer {
                /* 답글 전체 상자 + 등록버튼 */
                width: 100%;
                height: 50px;
                margin-top: 10px;
                display: none;
           
            }

            #NewCommentBoxClass {
                /* 댓글 전체 상자 + 등록버튼 */
                margin-top: 10px;
                width: 1100px;
                margin: 0px auto;
                padding: 15px;
                height: 100px;
             
            }

            #NewCommentBox {
                /* 새로운 댓글 달기 입력 textarea */
                width: 95%;
                height: 100%;
            }

            #BTNRegisterAnswer {
                /* 댓글 등록 버튼 */
                height: 100%;
                float: right;
                background-color: white;
                border: 1px solid black;
                font-weight: bold;
            
            }

            .comment {
                width: 95%;
                height: 100%;
            }

		#noAnswer {
		/* 댓글없을 시 */
		padding : 5%;
		color: #666;
		text-align: center;
		}
		
		#noAnswerline{
		width: 1100px;
		 border-bottom: 1px solid rgb(196, 193, 193);
		}
		
</style>
</head>

<body>

	<div id="container">
	
	  <div id="MainTitle">
            <div id="foodType">${dto.category}</div>
            <div id="title1">${dto.title}</div>
            <div id="UserID">${dto.memberID}</div>
            <div id="viewnum">조회수 : ${dto.readCount }</div>
            <div id="Date">작성일 : ${dto.regdate}</div>
        </div>
        <hr
            style="border: solid 1px rgba(158, 155, 155, 0.671);"
            width="1100px"
        />
        <!-- 상자 안 음식 사진 -->
        <div class="foodpic">
            <img src="/mh/images/${dto.img}" id="pasta1" />
        </div>
        <!-- 레시피 내용 -->
        <div id="ExplainRCP" style="white-space: pre;">
      		 ${dto.content}
        </div>

        <!-- 장바구니 담기 버튼 -->
        <div id="Cartfood">
            <input type="button" value="장바구니에 담기" class="InputCart" />
        </div>

        <!-- 레시피 세트 상자 -->
        <div id="RCPsetBox">
            <fieldset>
                <legend>Market Hurry Recipe Set</legend>
       		
       		 <div id="PDExplainBox">
                    <img src="/mh/images/${dto.img}" id="foodPic" />
                    <div id="sellingFoodName">${dto.memberID}님의 ${dto.title}set</div>
                    <div id="SalePrice">${totalPrice}</div>
              
				</div>
                <!-- 음식 set 목록 -->
                <div id="FDListBox">
                    <c:forEach items="${productlist}" var="dto">
                <table id="menuMaterial">
                    <tr>
                        <td><span class="glyphicon glyphicon-ok"></span></td>
                        <td class="MatarialName">${dto.name}</td>
                        <td class="rcpPrice">${dto.price}원</td>
                    </tr>
                </table>
		           	</c:forEach>
		           	</div>

            </fieldset>
        </div>
    

        <!-- 댓글 -->
	<div id="allAnwser">
        <div id="AnwserTitle">댓글</div>
        <c:forEach items="${clist}" var="cdto">
        <div id="Answerbox">
            <div id="UserCommnet1">
                <div class="AnswerUserId">${cdto.memberID}</div>
                <div class="AnswerDate">${cdto.regdate}</div>
                <div class="AnswerComment">
                    ${cdto.content}
                </div>
			</div>
          </div>
                </c:forEach>
	
			<div id="noAnswerBox">
			<div id="noAnswer"> 입력된 댓글이 없습니다. 첫번째 댓글을 달아보세요! </div>
			<hr id="noAnswerline">
			</div>

        <!-- 새로운 댓글 입력 시 -->
        <div id="NewCommentBoxClass">
            <textarea placeholder="댓글을 입력해주세요." class="comment"></textarea>
            <button type="button" id="BTNRegisterAnswer" name="BTNRegisterAnswer" >등록</button>
        </div>
        
        

	</div> <!-- 댓글전체 -->
	</div> <!-- 페이지 전체 -->

<!-- footer -->
<%@include file="/WEB-INF/views/inc/footer.jsp" %>

</body>
	<script>
	var mseq = ${seq};//멤버 seq
	var seq = ${dto.seq}; //레피시 seq가져오기
	
	//새로운 댓글 등록하기
	$("#BTNRegisterAnswer").click(function() {
		var content = $("#NewCommentBoxClass > textarea").val(); //새로운 댓글 입력하는 입력창
		
		if(content.length > 0) { //댓글에 값이 0이상일때만 실행이되도록
			$.ajax({
				type: "GET",
				url: "/mh/user/myrecipe/myrecipecommentok.do", 
				//사용자가 입력한 댓글 내용(content)과 멤버번호, 레시피페이지 번호를 가져와서 실행이됩니다
				data: "content=" + content + "&mseq=" + mseq + "&seq=" + seq,
				dataType: "json",
				//success빼고 모두 실행완료! -> success 는 왜 실행이 되지않는감ㅜ_ㅜ
				success: function(data) {
					console.log(data);
// 					var result = data.responseText;

// 					if(result == "SUCCESS"){
// 						//success가 되버리면 새로고침 + alert가 되도록 구현을 원합니다
				
// 						//alert띄우기
 						 alert("등록되었습니다.");
// 						//초기화 -> 새로고침하면 필요없는건가?
// 				 		content.html(""); 
// 						//새로고침하는 거??
// 				 	   location.reload();
// 					}else{
// 					 alert("시스템 오류입니다.");
// 					}
				}, error: function(e){
					console.log(e);
// 					 alert("시스템 오류입니다.");
				}
			});
     	}; 
	});

	
	// 답글 클릭 시
	function fn_openReAnswer(data) {
		
	    var parent = $(data).parent(); // 부모 찾기
	    var target = $(parent).children(".NewReAnswer"); //
	    $(target).toggle();
	}
	
	
	//댓글 없을 시 댓글 없습니다. 출력
	if ($(".AnswerComment").length != 0) {
		$("#noAnswerBox").hide();
	} else {
		$("#noAnswerBox").show();
	}
	
	
	 // 천단위 , 찍기
    function numberWithCommas(x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
	 $("#SalePrice").text(numberWithCommas(${totalPrice})+"원");
	 
	

</script>
</html>