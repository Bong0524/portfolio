<%@page import="com.humanwebtoon.vo.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
UserInfo user = (UserInfo) session.getAttribute("user");
if(user == null){
	response.sendRedirect("index.jsp");
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연재신청 페이지</title>
<style type="text/css">
	* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;	
	}
	#container{
		width: 960px;
		margin: 0 auto;
	}
	
	#viewThumbnail{
		width: 200px;
		height: 200px;
	}
	#viewSubThumbnail{
		width: 100px;
		height: 100px;
	}
	
	#viewBox{
		width: 600px;
		margin: 0 auto;
	}
	.uploadBtn{
		background: rgb(69,56,40); 
		color: #ddd; 
		padding: 4px; 
		border-radius: 3px;
		cursor: pointer;
	}
	input {
		outline: none;
		border: none;
	}
	.viewImgs{
		width: 600px;
	}
	input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
    }
</style>
</head>
<body>
	<div id="container">
		<jsp:include page="header.jsp"/>
		<form name="requestForm" action="RequestPro" method="post" enctype="multipart/form-data">
			<!-- 웹툰에 대한 소개 -->
			<div id="inputInfo" style="width: 700px; margin: 0 auto;">
			<fieldset style="margin-bottom: 20px; height: 204px;">
				<div id="thumbnailBox" style="width: 200px; height: 200px;float: left; margin-right: 10px;"></div>
				<input type="text" name="title" placeholder="제목만 입력해주세요." style="padding:5px; font-size: 1.5em; border-bottom: 1px solid #ddd; margin-bottom: 20px">
				<textarea style="padding: 10px; border:none; resize: none; font-size: 1.2em; width: 482px; height: 137px;" name="info" placeholder="웹툰에 대한 소개를 써주세요.(승인시 웹툰소개란에 게시 될 내용입니다.)"></textarea>
			</fieldset>
			<!-- 썸네일과 이미지 첨부 -->
			<div id="btnBox" style="margin: 10px;">
				<label class="uploadBtn" id="thumbnailBtn" for="thumbnail">웹툰 썸네일 첨부</label>
				<input type="file" id="thumbnail" name="thumbnail" style="display: none;" />
				<label class="uploadBtn" id="subThumbnailBtn" for="subThumbnail">1화 첨부</label>
				<input type="file" id="subThumbnail" name="subThumbnail" style="display: none;" />
				<label class="uploadBtn" id="imgsBtn" for="imgs">이미지 첨부</label>
				<input type="file" id="imgs" multiple="multiple" name="imgs" style="display: none;"/>
				<input class="uploadBtn" type="submit" value="업로드">
			</div>
			<table style=" text-align: center; border-spacing: 0; border-collapse: collapse;">
				<tr>
					<td width="100px">썸네일</td>
					<td width="280px">제목</td>
					<td width="80px">조회수</td>
					<td width="200px">등록일</td>
				</tr>
				<tr height="100px" style="border-top: 1px solid black;">
					<td style="padding: 10px 20px; width: 140px;height: 124px;">
						<div id="subThumbnailBox"></div>
					</td>
					<td style="text-align: left; padding-left: 20px">
						1화. <input type="text" name="subTitle" style="border-bottom: 1px solid #ddd; font-size: 0.95em; width: 200px;" placeholder="1화 제목을 입력해주세요.">
					</td>
					<td width="100px">
						0
					</td>	
					<td width="200px">
						0000-00-00
					</td>
				</tr>
			</table>
			</div>
			
			
			<div id="viewBox"></div>
		</form>
		<script type="text/javascript">
		
		/* 첨부밭은 썸네일을 미리 볼수 있도록 뿌려주는 함수 */
		var thumbnail = document.getElementById("thumbnail");
		var thumbnailBox = document.getElementById("thumbnailBox");
		thumbnail.onchange = function() {
			/* 변경시마다 썸네일을 비워주는 구문 */
			if(thumbnailBox.hasChildNodes()) thumbnailBox.removeChild( thumbnailBox.firstChild );
			let imgTag = document.createElement('img');
			imgTag.setAttribute('src' , URL.createObjectURL(thumbnail.files[0]));
			imgTag.setAttribute('id' , "viewThumbnail");
			thumbnailBox.appendChild(imgTag);
		}
		
		/* 첨부밭은 서브썸네일을 미리 볼수 있도록 뿌려주는 함수 */
		var subThumbnail = document.getElementById("subThumbnail");
		var subThumbnailBox = document.getElementById("subThumbnailBox");
		subThumbnail.onchange = function() {
			/* 변경시마다 서브썸네일을 비워주는 구문 */
			if(subThumbnailBox.hasChildNodes()) subThumbnailBox.removeChild( subThumbnailBox.firstChild );
			let imgTag = document.createElement('img');
			imgTag.setAttribute('src' , URL.createObjectURL(subThumbnail.files[0]));
			imgTag.setAttribute('id' , "viewSubThumbnail");
			subThumbnailBox.appendChild(imgTag);
		}
		/* 첨부밭은 이미지를 미리 볼수 있도록 뿌려주는 함수 */
		var imgs = document.getElementById("imgs");
		var viewBox = document.getElementById("viewBox");
		imgs.onchange = function() {
			/* 변경시마다 이미지를 비워주는 반복문 */
			while (viewBox.hasChildNodes()){
				viewBox.removeChild( viewBox.firstChild );
			}
			for (var i = 0; i < imgs.files.length; i++) {
				let imgTag = document.createElement('img');
				imgTag.setAttribute('src' , URL.createObjectURL(imgs.files[i]));
				imgTag.setAttribute('class' , "viewImgs");
				viewBox.appendChild(imgTag);
			}
		}
		/* 작가가 아닌 유저가 업로드 페이지에 들어올경우 돌려보낸다. */
		</script>
	</div>
</body>
</html>