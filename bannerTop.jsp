<%@page import="java.util.ArrayList"%>
<%@page import="com.humanwebtoon.vo.BannerInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ArrayList<BannerInfo> topBannerList = (ArrayList<BannerInfo>)request.getAttribute("topBannerList");
if (topBannerList == null) {%>
<jsp:forward page="BannerLoadPro?pos=top"/>
<%}int ran = (int)(Math.random()*topBannerList.size());%>
<div style="background: rgb(69, 56, 40); width: 60px; height: 100%; float: right; border-left: 1px solid black;">
	<img id="upBanner" src="img/banner/arrow.png" width="60px;" height="50%" style="padding: 30px 0 20px; transform: scaleY(-1);" >
	<img id="downBanner" src="img/banner/arrow.png" width="60px;" height="50%" style="padding: 30px 0 20px; border-top: 1px solid black">
</div>
<div id="bannerBox" style="width: 636px; height: 100%; overflow: hidden;">
	<ul id="bannerScroll">
		<li style="height: 206px; width: 100%;" onclick="location.href = '<%=topBannerList.get(0).getLink()%>'">
			<img alt="탑 배너칸" height="100%" width="365px;" style="float: right;" src="img/banner/top1.jpg">
			<h1 style="padding: 5px; font-size: 1.3em"><%=topBannerList.get(0).getTitle()%></h1>
			<p style="padding: 5px; word-break:keep-all"><%=topBannerList.get(0).getIntro()%></p>
		<li>
		<li style="height: 206px; width: 100%;" onclick="location.href = '<%=topBannerList.get(1).getLink()%>'">
			<img alt="탑 배너칸" height="100%" width="365px;" style="float: right;" src="img/banner/top2.jpg">
			<h1 style="padding: 5px; font-size: 1.3em"><%=topBannerList.get(1).getTitle()%></h1>
			<p style="padding: 5px; word-break:keep-all"><%=topBannerList.get(1).getIntro()%></p>
		<li>
		<li style="height: 206px; width: 100%;" onclick="location.href = '<%=topBannerList.get(2).getLink()%>'">
			<img alt="탑 배너칸" height="100%" width="365px;" style="float: right;" src="img/banner/top3.jpg">
			<h1 style="padding: 5px; font-size: 1.3em"><%=topBannerList.get(2).getTitle()%></h1>
			<p style="padding: 5px; word-break:keep-all"><%=topBannerList.get(2).getIntro()%></p>
		<li>
	</ul>
</div>
<script>
/* 랜덤 배너 */
var scroll = Math.floor(Math.random()*3);
$("#bannerScroll").css("marginTop" ,scroll*(-206)+"px" );
/* 업버튼 눌렀을경우 배너 변경 */
$("#upBanner").click(function(e){
	scroll >= 2 ? scroll = 0 : scroll++;
	$("#bannerScroll").animate({ marginTop : scroll*(-206)+"px" },1000);
});
/* 다운버튼 눌렀을경우 배너 변경 */
$("#downBanner").click(function(e){
	scroll <= 0 ? scroll = 2 : scroll--;
	$("#bannerScroll").animate({ marginTop : scroll*(-206)+"px" },1000);
});
/* 10초마다 배너 자동변경 */
setInterval(function() { 
	scroll >= 2 ? scroll = 0 : scroll++;
	$("#bannerScroll").animate({ marginTop : scroll*(-206)+"px" },1000);
}, 10000)



</script>