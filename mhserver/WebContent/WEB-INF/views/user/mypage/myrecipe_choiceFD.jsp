<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/mh/css/bootstrap.css">

 <script src="/mh/js/jquery-1.12.4.js"></script>
 <script src="/mh/js/bootstrap.js"></script>
 
 <style>
 
 		* {
 		outline: none;
 		
 		}
        #container {
            /* 전체 사이즈 */
            width: 700px;
            margin: 0px auto;
            text-align: center;
   
        }

		#newWindow_list {
			width: 100%;
			min-height: 300px;;
			
		
		}

        #img_logo {
            /* 로고 이미지 */
            width: 250px;
            height: 100px;
            margin-bottom: 10px;
        }
       

        #list_title {
            text-align: center;
            font-weight: bold;
           
        }
        
        #list_title > p {
       	 	/* 설명글 */
        	color: #666;
        	font-size: 12px;
        	margin-bottom: 30px;
        
        }
        .pic_food {
            /* 음식사진 */
            width: 80px;
            height: 70px;
        }
        #btn_All {
            float: right;
            padding: 15px;
        }
        .btn {
            /* 버튼모임 */
            color: #08718e;
            padding: 5px;
            outline: none;
            background-color: white;
            border: 1px #08718e;
        }
		
		#list th {
		text-align: center;
		}
		
		#list td{
			vertical-align: middle;
		}
		
     	#list .tablelist{
      	line-height: 87px;
      	text-align: center;	 

      }
      
      #noList {
      	height : 200px;
      }
        </style>
    </head>
    <body>
        <div id="container">
       
            <div id="list_title">
                <img src="/mh/images/brandlogo.png" id="img_logo" />
                 <p> 선택한 재료 목록은 고객님의 이름의 묶음 상품으로 판매되어지며 수정이 불가합니다.</p>
            </div>
            
            <div id="newWindow_list">
         
         	
     
            <table class="table table-bordered" id="list">
               <thead>
	           	 <th>선택</th>
	           	 <th>상품이미지</th>
	             <th>상품명</th>
	             <th>구매날짜</th>
	           </thead>
	           
	           
	           <c:forEach items="${list}" var="dto">
	             	<tr>
	             		<input type="hidden" class="pseq" value="${dto.pseq}">
		                <td><input type="checkbox" value="food" name="chk" class="chk"/></td>
		                <td><img src=${dto.pimg } class="pic_food" /></td>
		                <td class="foodName">${dto.pname }</td>
		                <td class="gettingdate">${dto.pdate }</td>
	                </tr>
	             </c:forEach>
	             
	             <!-- 구매 목록 없을 때 출력 -->
	             <c:if test="${list.size() == 0}">
	             <tr id="nohave">
	            	 <td colspan="4" id="noList">구매 목록이 없습니다.</td>
	             </tr>
	             </c:if>
            </table>
    
            </div>

            <div id="btn_All">
                <input type="submit" value="선택완료" id="To_combi" class="btn" disabled/>
                <input type="button" value="닫기" id="exit" class="btn" onClick="window.open('','_self').close();"/>
            </div>
        </div> <!--container -->
        <script>
     
        $(".chk").click(function() {
        	
        var chk = $(".chk").is(":checked");
		
        if(chk) {
			$("#To_combi").attr("disabled",false);
		} else {
			$("#To_combi").attr("disabled",true);
			
		} 
        	
        });
        
      	$("#To_combi").click(function(){

      		// 체크된 재료들을 담을 그릇
      		var selected = [];
      		
      		// push() : 담는 행동

      		// input[type="checkbox"] : 지금 페이지에 선언된 모든 checkbox
      		
      		$("input[type='checkbox']:checked").each(function(index){
      			selected.push($(this).parent().parent().find(".pseq").val());
      			alert($(this).parent().parent().find(".pseq").val());
      		});
      		window.close();
      		opener.callback(selected);
      	});
        </script>

</body>
</html>