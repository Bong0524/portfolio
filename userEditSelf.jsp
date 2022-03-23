<%@page import="com.humanwebtoon.vo.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%UserInfo user = (UserInfo)session.getAttribute("user"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저정보 수정</title>
<link rel="icon" href="img/logo/favicon.ico">
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

#container {
	width: 800px;
	margin: 80px auto;
	text-align: center;
}

.inputBox:focus {
	outline: none;
}

.inputBox {
	width: 400px;
	height: 50px;
	font-size: 1.02em;
	margin: 10px;
	padding-left: 10px;
}

input {
	cursor: pointer;
}

#resisterBtn {
	width: 226px;
	height: 50px;
	border: 0px;
	background: rgb(69, 56, 40);
	color: #ddd;
	font-weight: bold;
	font-size: 1.3em;
	border-radius: 5px;
	margin: 30px 0 10px;
}

#resisterBox {
	margin: 30px auto 10px;
	padding: 25px 30px;
	width: 400px;
	border-radius: 3px;
}

#warning {
	text-align: left;
	color: red;
	font-weight: bold;
	margin-top: 5px
}

.label {
	font-weight: bold;
	margin: 20px 0 0 10px;
}

.surely {
	color: red;
	margin-left: 10px;
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
	<div id="container">
		<form action="ResisterPro" method="post" name="resisterForm">
			<a href="index.jsp?inPage=home"><img id="logo" alt="LOGO"
				src="img/logo/logo.png"></a>
			<fieldset id="resisterBox">
				<div style="text-align: left;">
					<p class="label">아이디</p>
					<input class="inputBox" type="text" name="id" id="id">
					<p class="surely" id="idMessage"></p>
					<p class="label">비밀번호</p>
					<input class="inputBox" type="text" name="pw" id="pw">
					<p class="surely" id="pwMessage"></p>
					<p class="label">이름</p>
					<input class="inputBox" type="text" name="name" id="name">
					<p class="surely" id="nameMessage"></p>
				</div>
				<input id="resisterBtn" type="button" value="회원가입">
			</fieldset>
		</form>
	</div>
	<script type="text/javascript">
	var inputBox = document.getElementsByClassName("inputBox");
	var surely = document.getElementsByClassName("surely");
	var overlap;
	/* 입력항목 유효성 검사 */
	$("#resisterBtn").click(function(e) {
		e.preventDefault();
		/* 유효하지 않은 항목에 대한 메세지 출력 */
		for(var i = 0 ; i < inputBox.length ; i++){
		if(!inputBox[i].value){
				surely[i].innerText = "필수 입력 항목입니다.";
			}
		}
		/* 유효하지 않은 항목이 있으면 가입을 막는 구문 */
		for(var i = 0 ; i < inputBox.length ; i++){
			if(!inputBox[i].value){
				inputBox[i].focus();
				return;
			}
		}
		if(overlap==1){
			$("#id").focus()
			return;
		}
		resisterForm.submit();
	})
	
	
	/* 입력/변경시 유효한 칸의 유도문 추가/제거 */
	
	$("#pw").change(function() {
		$("#pwMessage").text($("#pw").val()!="" ? "":"필수 입력 항목입니다.");
	})

	$("#name").change(function() {
		$("#nameMessage").text($("#name").val()!="" ? "":"필수 입력 항목입니다.");
	})
	
	
	/* 아이디 중복체크 및 유효성 검사 */
	$("#id").change(function() {
		$.ajax({
			type:"post",
			url:"http://localhost:8081/webtoon/IdOverlapPro",
			data:{id:$("#id").val()},
			success: function(data){
				overlap = data;
				if(overlap==1){
					$("#idMessage").css("color", "red");
					$("#idMessage").text("이미 존재하는 아이디입니다.");
				}else{
					$("#idMessage").css("color", "lime");
					$("#idMessage").text("멋진 아이디로군요!");
				}
				if($("#id").val()==""){
					$("#idMessage").css("color", "red");
					$("#idMessage").text("필수 입력 항목입니다.");
				}
			},
			error:function(){
				alert("오류");
			}
		});
	});
	
</script>
</body>
</html>