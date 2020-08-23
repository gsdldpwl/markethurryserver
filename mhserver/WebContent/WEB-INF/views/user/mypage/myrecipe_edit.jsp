<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/inc/header.jsp" %>
    <style>
        .MyRCPpart{
            /* 영역 사이즈 */
            margin: 20px 0px;
            width: 880px;
        }
        .rcpTitle {
            /* 분류 제목 */
            float: left;
            font-weight: bold;
            font-size: 16px;
        }

        #rcpTypeList {
            /* 요리분류 select box */
            margin-left: 50px;
            width: 130px;
            height: 26px;
        }

        #UserInputTitle {
            /* 제목 입력 상자  */
            margin-left: 80px;
            width: 755px;
            height: 40px;
            resize: none;
            padding: 10px;
        }
        
        #UserInputsubstance {
            /* 내용 입력 상자 */
            margin-left: 80px;
            width:755px;
            height:500px;
            resize: none;
            padding: 10px;
        }

        #MaterialSubtitle {
            /* 재료선택 소제목 */
            font-weight: normal;
            font-size: 12px;
            color: #666666;
            width:110px;
        }
         .upload-file{
            /* 이미지, 재료선택파일 선택 버튼 */
            margin-left: 113px;
            width: 250px;
        }

        #mypagetwobtn {
            /* 버튼을 감싸고 있는 틀 */
            width: 350px;
            height: 50px;
            margin-top: 80px;
            margin-left: 350px;
            
        }
        .btnInputBorad {
            /* 작성취소 작성완료 버튼 */
            width: 100px;
            height: 45px;
            font-weight: bold;
            font-size: 16px;
            outline:none;
        }

        #CancleInput {
            /* 작성취소 버튼 */
            background-color: white;
            color: #08718e;
            border: 1px solid #08718e;
        }

        #SuccessInput {
            /* 작성완료 버튼 */
            margin-left:30px;
            background-color: #08718e;
            color: white;
            border:none;
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
                    <h2 id="title">내 레시피<span id="subtitle">내가 등록한 레시피의 목록입니다.</span></h2>
                </div>

                <div style="float: right; margin-top: 15px;">
                </div>
            </div>
            
            <!-- ---------------------------------------------------------------------------- -->

            <!-- 콘텐츠 영역 -->
            <!-- 내 레시피 -->
         
                <!-- select button -->
                <div class="MyRCPpart" style="margin-top: 40px;">
                <div class="rcpTitle">요리분류</div>
                <select name="rcpTypeList1" id="rcpTypeList">
                    <option value="Koreanfood">한식</option>
                    <option value="Westernfood">양식</option>
                    <option value="Chinesefood">중식</option>
                    <option value="Japanesefood">일식</option>
                    <option value="Desert">디저트</option>
                    <option value="foodect">그외</option>
                </select>
                </div>

                <div class="MyRCPpart">
                  <div class="rcpTitle">제목</div>
                  <input type="text" id="UserInputTitle" class="UserInputRCP">
                </div>

              
                  <div class="rcpTitle">내용</div>
                  <textarea id="UserInputsubstance" class="UserInputRCP"></textarea>
                
                  <div class="MyRCPpart">
                  <div class="filebox preview-image"> 
                  <div class="rcpTitle">이미지 선택</div>
                  <input type="file" value="이미지추가하기" class="upload-file" >
                  </div>
                   </div>


                  <div class="MyRCPpart">
                    <div class="filebox preview-image"> 
                  <div class="rcpTitle">재료 선택</div>
                  <input type="file" value="재료 추가하기" class="upload-file" id="contract_file" multiple>
                  <div id="MaterialSubtitle">내가 구매한 재료만 선택할 수 있습니다.</div>
                  </div>
                   </div>

                   <div id="mypagetwobtn">
                   <button class="btnInputBorad" id="CancleInput" onclick="clearInput()">수정취소</button>
                   <input type="button" value="수정완료" class="btnInputBorad" id="SuccessInput">
                </div>
      
            <!-- ※ 오른쪽 영역 끝 ※ -->
            
        </div>
        <div style="clear:both;"></div>
    </div>


<!-- footer -->
<%@include file="/WEB-INF/views/inc/footer.jsp" %>

    <!-- script start -->
    <script>
        // 소진

   	$("#MyMenu > div").removeClass("nowPage");
   	$("#goMyRecipe").addClass("nowPage");
   	
    //제목 입력 시 저장
    $("#UserInputTitle")
    // // 입력 시 작동하도록 key up func
    .keyup(function(){
        
    //     // 자신이 입력하는 값을 담을 변수 선언
        var inputtext ="";
    //     // 선언한 변수에 값을 추가 (이 경우 백스페이스를 하면 자동으로 값이 지워짐)
        inputtext += $(this).val();
    });


    //내용 입력 시 저장
    $("#UserInputsubstance")
    // // 입력 시 작동하도록 key up func
    .keyup(function(){   
    //     // 자신이 입력하는 값을 담을 변수 선언
        var inputtext ="";
    //     // 선언한 변수에 값을 추가 (이 경우 백스페이스를 하면 자동으로 값이 지워짐)
        inputtext += $(this).val();
    });


    $("#SuccessInput").on("click",function() {
            console.log("click");
            if(event.keyCode == 13) {
            // 입력받은 값을 처리
            // 입력받은 값은 inputtext
            }  

    // 제목에 아무 내용이 없을 때
     if($("#UserInputTitle").val().length==0) {
         
         alert("제목을 입력하세요."); 
         $("#UserInputTitle").focus();
         
     } else if ($("#UserInputsubstance").val().length==0) {
         //내용을 입력안했을 때
         
         alert("내용을 입력하세요."); 
         $("#UserInputsubstance").focus();
   
     } else {
         //모두 입력되었으면 완료 메세지 출력
        $(location).attr('href', 'mypageUplodeRecipeAlert.html');
     }
   
 });
         //작성취소 버튼 누를 시 초기화
         $("#CancleInput").on("click",function() {
             $('.UserInputRCP').val('');
            });

    </script>
    <script src="/mh/js/main.js"></script>
    
</body>
</html>