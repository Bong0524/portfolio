<%@page import="com.humanwebtoon.vo.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
UserInfo user = (UserInfo) session.getAttribute("user");
if(user == null||!user.getGrade().equals("작가")){
	response.sendRedirect("index.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업로드</title>
<style type="text/css">
	* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;.
	}
	#container{
		width: 960px;
		margin: 0 auto;
	}
	
	#viewBox{
		width: 600px;
		margin: 0 auto;
	}
	#thumbnailBox{
		width: 600px;
		margin: 0 auto;
		margin-bottom: 50px;
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
	}
	.viewImgs, #viewThumbnail{
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
		<form name="uploadForm" action="UploadPro" method="post" enctype="multipart/form-data">
		<input type="hidden" name="toon_id" value="<%=request.getParameter("toon")%>">
		<!-- 업로드할 페이지에 대한 정보 -->
		<div id="inputInfo">
			<input type="number" name="page" style="margin-top: 40px; font-size: 2em; width: 12%; border-bottom: 1px solid #ddd; text-align: right;"/>
			<span style="margin-top: 40px; font-size: 2em;">화.&nbsp;</span>
			<input type="text" name="title" placeholder="제목만 입력해주세요." style="margin-top: 40px; font-size: 2em; width: 80%; border-bottom: 1px solid #ddd">
		</div>
		<!-- 업로드할 썸네일과 이미지 첨부 -->
		<div id="btnBox" style="margin: 10px;">
			<label class="uploadBtn" id="thumbnailBtn" for="thumbnail">썸네일 첨부</label>
			<input type="file" id="thumbnail" name="thumbnail" style="display: none;" />
			<label class="uploadBtn" id="imgsBtn" for="imgs">이미지 첨부</label>
			<input type="file" id="imgs" multiple="multiple" name="imgs" style="display: none;"/>
			<input type="submit" value="업로드">
		</div>
			<!-- 첨부시킨 이미지를 뿌려줄(미리보기) 박스 --><br>
			<div id="thumbnailBox"></div>
			<div id="viewBox"></div>
		</form>
		<script type="text/javascript">
		/* 첨부밭은 썸네일을 미리 볼수 있도록 뿌려주는 함수 */
		var thumbnail = document.getElementById("thumbnail");
		var thumbnailBox = document.getElementById("thumbnailBox");
		thumbnail.onchange = function() {
			for (var i = 0; i < thumbnail.files.length; i++) {
				/* 변경시마다 썸네일을 비워주는 구문 */
				if(thumbnailBox.hasChildNodes()){
				thumbnailBox.removeChild( thumbnailBox.firstChild );
				}
				let imgTag = document.createElement('img');
				imgTag.setAttribute('src' , URL.createObjectURL(thumbnail.files[i]));
				imgTag.setAttribute('id' , "viewThumbnail");
				thumbnailBox.appendChild(imgTag);
				thumbnailBox.style.outline = "solid 3px rgb(69,56,40)";
			}
		}
		/* 첨부밭은 이미지를 미리 볼수 있도록 뿌려주는 함수 */
		var imgs = document.getElementById("imgs");
		var viewBox = document.getElementById("viewBox");
		imgs.onchange = function() {
			while (viewBox.hasChildNodes()){
				viewBox.removeChild( viewBox.firstChild );
			}
			for (var i = 0; i < imgs.files.length; i++) {
				/* 변경시마다 이미지를 비워주는 반복문 */
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