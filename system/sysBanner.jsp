<%@page import="com.humanwebtoon.vo.BannerInfo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ArrayList<BannerInfo> sideBannerList = (ArrayList<BannerInfo>) request.getAttribute("sideBannerList");
ArrayList<BannerInfo> topBannerList = (ArrayList<BannerInfo>) request.getAttribute("topBannerList");
if (sideBannerList == null) {%>
	<jsp:forward page="../BannerListPro"/>	
<%}%>
<style>
.imgBtn{
		background: rgb(69,56,40); 
		color: #ddd; 
		padding: 4px; 
		border-radius: 3px;
		cursor: pointer;
		vertical-align: super;
		margin: 5px;
	}
</style>			
<div style="display: flex; flex-direction: column;">
<%for(int i = 0 ; i < topBannerList.size() ; i++) {
	BannerInfo topBanner = topBannerList.get(i);%>
	<form style="width: 750px; text-align: center; background: white; position: relative; margin: 10px auto; border: 1px solid black" 
	action="../BannerEdit" method="post" name="<%=topBanner.getBanner_id()%>From" enctype="multipart/form-data">
		<h1 style="display: inline; margin-right: 10px;">탑<%=i+1 %></h1>
		<label class="imgBtn" for="<%=topBanner.getBanner_id()%>Img" id="<%=topBanner.getBanner_id()%>ImgBtn">이미지 첨부</label>
		<span class="imgBtn" onclick="saveThis(<%=topBanner.getBanner_id()%>From)">저 장</span>
		<input type="file" name="bannerImg" style="display: none;" id="<%=topBanner.getBanner_id()%>Img" onchange="changeImg('<%=topBanner.getBanner_id()%>')">
		<input type="hidden" name="banner_id" value="<%=topBanner.getBanner_id()%>">
		<div style="height: 200px;">
			<div style="background: #ccc; width: 60px; height: 200px; float: right; border-left: 1px solid black">
				<img src="../img/banner/arrow.png" width="60px;" height="50%" style="padding: 30px 0 20px; transform: scaleY(-1);" >
				<img src="../img/banner/arrow.png" width="60px;" height="50%" style="padding: 30px 0 20px; border-top: 1px solid black" >
			</div>
			<img  alt="탑 <%=i+1 %>배너" src="../img/banner/<%=topBanner.getBanner_id()%>.jpg" width="350px;" height="200px;" style="float: right;" id="<%=topBanner.getBanner_id()%>View">
			<input type="text" placeholder="제목" name="title"  
			style="border: none; width: 325px; border-bottom: 1px solid #ccc; font-size: 1.5em; font-weight: bold; padding: 0 10px;"
			value="<%=topBanner.getTitle()==null?"":topBanner.getTitle()%>">
			<textarea style="width: 325px; height: 150px; border: none; outline: none; padding: 10px; font-size: 1.2em; resize: none;"
			name="intro" placeholder="웹툰 홍보 멘트" ><%=topBanner.getIntro()==null?"":topBanner.getIntro()%></textarea>
		</div>
		<textarea style="width:100%; border: none; resize: none; font-size: 1.2em; padding: 10px;" name="link"
		placeholder="연결될 URL을 입력해 주세요." rows="3"><%=topBanner.getLink()==null?"":topBanner.getLink()%></textarea>
	</form>
<%}%>
</div>
<div style="display: flex; justify-content: space-between; width: 100%;">
<%for(int i = 0 ; i < sideBannerList.size() ; i++) {
	BannerInfo sideBanner = sideBannerList.get(i);%>
	<form style="width: 250px; text-align: center; background: white; height: 1000px; position: relative; margin-bottom: 20px; border: 1px solid black" 
	action="../BannerEdit" method="post" name="<%=sideBanner.getBanner_id()%>From" enctype="multipart/form-data">
		<div style="height: 100px;">
			<h1 style="margin-right: 10px; padding: 10px;">사이드</h1>
			<label class="imgBtn" for="<%=sideBanner.getBanner_id()%>Img" id="<%=sideBanner.getBanner_id()%>ImgBtn">이미지 첨부</label>
			<input type="file" name="bannerImg" style="display: none;" id="<%=sideBanner.getBanner_id()%>Img" onchange="changeImg('<%=sideBanner.getBanner_id()%>')">
			<input type="hidden" name="banner_id" value="<%=sideBanner.getBanner_id()%>">
			<span class="imgBtn" onclick="saveThis(<%=sideBanner.getBanner_id()%>From)">저 장</span>
		</div>
		<img alt="사이드 <%=i+1 %>배너" src="../img/banner/<%=sideBanner.getBanner_id()%>.jpg" width="100%" id="<%=sideBanner.getBanner_id()%>View">
		<textarea style="width: 100%; border: none; resize: none; font-size: 1.2em; position: absolute; bottom: 0px; left: 0px;"
		placeholder="연결될 URL을 입력해 주세요." rows="5" name="link"><%=sideBanner.getLink()==null?"":sideBanner.getLink()%></textarea>
	</form>
<%} %>
</div> 
<script>
function changeImg(id) {
	var banner = document.getElementById(""+id+"Img");
	$("#"+id+"View").attr("src" , URL.createObjectURL(banner.files[0]));
}
function saveThis(frm) {
	frm.submit();
}
</script>