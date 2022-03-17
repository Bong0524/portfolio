<%@page import="com.humanwebtoon.vo.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
UserInfo user = (UserInfo) session.getAttribute("user");
%>
<input id="logoutBtn" type="button" value="로그아웃" onclick="location.href='LogoutPro'">
<p style="font-weight: bold"><%=user.getName()%>(<%=user.getGrade()%>)님</p>
<p style="color: rgb(100, 100, 100); font-size: 0.8em"><%=user.getId()%></p>
<a href="#">정보수정</a>	

<%if(user.getGrade().equals("관리자")){%>
<a href="system/system.jsp?=home" target="_blank">관리창</a>
<%}else{%>
<a onclick="request();return false;" style="cursor: pointer;">연재신청</a>
<%} %>
<script>
function request() {
	$.ajax({
		type:"post",
		url:"http://localhost:8081/webtoon/RequestAlreadyPro",
		success: function(data){
			data == 0 ? location.href="request.jsp" : alert("한번에 하나의 작품만 신청하실 수 있습니다.\n신청하신 작품을 검토중이니 기다려 주세요.");
		}, //요청 응답에 성공했을경우의 처리 구문
		error:function(){
			alert("실패");
		},
		complete:function(){
			
		}
	});
}
</script>