<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓허리 :: 오늘의 장보기</title>
<%@include file="/WEB-INF/views/inc/asset.jsp" %>

<style>
        #loginheader {
            width: 1100px;
            margin: 0px auto;
            margin-top: 80px;
            text-align: center;
            font-size: 20px;
            font-weight: 500;
        }

        #logininput {
            width: 1100px;
            height: 140px;
            margin: 0px auto;
            margin-top: 50px;
            text-align: center;
        }

        .infoinput > input {
            width: 340px;
            height: 60px;
            border: 1px solid #ccc;
            border-radius: 3px;
            margin: 5px;
            padding-left: 10px;
            color: #ccc;
            outline:none;
        }

        #findinfo{
            width: 1100px;
            margin: 5px auto;
            text-align: center;
        }

        #findinfo > .eachinfo {
            width: 340px;
            margin: 0px auto;
            text-align: right;
            font-size: 12px;
            color: #333333;
        }

        .btndiv {
            width: 1100px;
            margin: 0px auto;
            text-align: center;
        }
        
        .activebtn {
            width: 340px;
            height: 60px;
            text-align: center;
            margin: 5px auto;
            border: 1px solid #777;
            background-color: #08718E;
            border-radius: 3px ;
            outline: none;
            color: white;
            font-size: 16px;
        }
        #regitbtn {
            background-color: white;
            border: 1px solid #08718E;
            color: #08718E;
        }

        
    </style>
    <%@include file="/WEB-INF/views/inc/header.jsp" %>
</head>

<body>
<div id="loginheader">로그인</div>
	<form method="POST" action="/mh/user/main/loginok.do">
    <div id="logininput">
        <div class="infoinput"><input type="text" placeholder="아이디를 입력해주세요." name="userid"></div>
        <div class="infoinput"><input type="password" placeholder="패스워드를 입력해주세요." name="userpw"></div>
    </div>

    <div id="findinfo"><div class="eachinfo"><a href="">아이디 찾기</a> | <a href="">비밀번호 찾기</a></div></div>
    
    <div class="btndiv"><input type="submit" id="loginbtn" class="activebtn" value="로그인" name="login"></div>
    <div class="btndiv"><input type="button" id="regitbtn" class="activebtn" value="회원가입" onclick="location.href='/mh/user/main/register.do';"></div>
    </form>
<!-- footer -->
 <a href="#" id="topbtn" style="border: 0px; outline: none;"></a>
<%@include file="/WEB-INF/views/inc/footer.jsp" %>
</body>
<script>

        // 로그인 박스 클릭 시에 value값 초기화
        var ogvalue = "";
        
        $(".infoinput > input")
            .focusin(function(){
                ogvalue = $(this).attr("value");
            $(this).css({
                "border":"1px solid black",
            });
            $(this).attr("value","");
            })
            .focusout(function(){
                $(this).css({
                    "border": "1px solid #ccc",
                    "border-radius": "3px",
                });
                $(this).attr("value",ogvalue)
            })   

        // 아이디 입력
        var id= "";
        $(".infoinput:first-child > input").keyup(function(){
            id ="";
            id += $(this).val();
        })

        // 패스워드 입력
        var pw ="";
        $(".infoinput:last-child > input:last-child").keyup(function(){
            pw ="";
            pw += $(this).val();
        })

        // 아이디 및 패스워드 전달
        

       
    </script>
    <script src="/mh/js/main.js"></script>
</html>