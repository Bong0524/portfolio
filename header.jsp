<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
header {
	height: 50px;
	margin: 20px 0;
}
#logo {
	float: left;
	width: 300px;
	height: 50px;
}
input {
	border: 0px;
	cursor: pointer;
}
#searchBox input {
	margin-top : 10px;
	height: 30px;
}
input[name="search"] {
	width: 200px;
	vertical-align:middle;
}
</style>
<header>
	<a href="index.jsp?inPage=home">
		<img id="logo" alt="LOGO" src="img/logo.png">
	</a>
	<div id="searchBox">
		<input type="text" name="search" style="border: solid 2px rgb(69,56,40);"> 
		<input type="button" value="검색" style="background: rgb(69,56,40); color: #ddd; vertical-align: middle;">
	</div>
</header>