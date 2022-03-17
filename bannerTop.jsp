<%@page import="java.util.ArrayList"%>
<%@page import="com.humanwebtoon.vo.BannerInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ArrayList<BannerInfo> topBannerList = (ArrayList<BannerInfo>)request.getAttribute("topBannerList");
if (topBannerList == null) {%>
<jsp:forward page="BannerLoadPro?pos=top"/>
<%}int ran = (int)(Math.random()*topBannerList.size());%>
<div style="background: #ccc; width: 60px; height: 100%; float: right; border-left: 1px solid black">
	<img id="upBanner" src="img/banner/arrow.png" width="60px;" height="50%" style="padding: 30px 0 20px; transform: scaleY(-1);" >
	<img id="downBanner" src="img/banner/arrow.png" width="60px;" height="50%" style="padding: 30px 0 20px; border-top: 1px solid black">
</div>
<div id="bannerBox" style="width: 100%; height: 100%; cursor: pointer;">
	<img alt="탑 배너칸" id="topBanner" height="100%" width="350px;" style="float: right;">
	<h1 id="topH" style="padding: 5px;"></h1>
	<p id="topP" style="padding: 5px;"></p>
</div>
<script>
var num = <%=ran%>+1;
var min = 1;
var max = <%=topBannerList.size()%>;

var topH;
var topH1;
var topH2;
var topH3;

<%for(int i = 0 ; i < topBannerList.size() ; i++){%>
topH<%=i+1%> = "<%=topBannerList.get(i).getTitle()%>";
<%}%>

var topP;
var topP1;
var topP2;
var topP3;

<%for(int i = 0 ; i < topBannerList.size() ; i++){%>
topP<%=i+1%> = "<%=topBannerList.get(i).getIntro()%>";
<%}%>

var link;
var link1;
var link2;
var link3;

<%for(int i = 0 ; i < topBannerList.size() ; i++){%>
	link<%=i+1%> = "<%=topBannerList.get(i).getLink()%>";
<%}%>

$("#topBanner").attr("src","img/banner/top"+num+".jpg");
$("#bannerBox").attr("onclick","location.href='<%=topBannerList.get(ran).getLink()%>'");
$("#topH").text("<%=topBannerList.get(ran).getTitle()%>")
$("#topP").text("<%=topBannerList.get(ran).getIntro()%>")

$("#upBanner").click(function(){
	num >= max ? num = min : num++;
	
	if(num == 1) {
		link = link1;
		topH = topH1;
		topP = topP1;
	}else if(num == 2) {
		link = link2;
		topH = topH2;
		topP = topP2;
	}else if(num == 3) {
		link = link3;
		topH = topH3;
		topP = topP3;
	}
	
	$("#topBanner").attr("src","img/banner/top"+num+".jpg");
	$("#bannerBox").attr("onclick","location.href='"+link+"'");
	$("#topH").text(topH);
	$("#topP").text(topP);
})
$("#downBanner").click(function(){
	num <= min ? num = max : num--;
	
	if(num == 1) {
		link = link1;
		topH = topH1;
		topP = topP1;
	}else if(num == 2) {
		link = link2;
		topH = topH2;
		topP = topP2;
	}else if(num == 3) {
		link = link3;
		topH = topH3;
		topP = topP3;
	}
	
	$("#topBanner").attr("src","img/banner/top"+num+".jpg");
	$("#bannerBox").attr("onclick","location.href='"+link+"'");
	$("#topH").text(topH);
	$("#topP").text(topP);
})
</script>