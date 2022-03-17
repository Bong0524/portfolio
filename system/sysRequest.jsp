<%@page import="com.humanwebtoon.vo.RequestInfo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ArrayList<RequestInfo> requestList = (ArrayList<RequestInfo>)request.getAttribute("requestList");
/* requestList가 null일 경우 requestList를 불러오기위해 RequestListPro를 호출한다. */
if(requestList == null){
%>
<jsp:forward page="../RequestListPro" />
<%}else{%>	
<form name="responseForm" action="../ResponsePro" method="post" style=" width: 80%; text-align: center; margin: 30px auto;">
	<table id="pageList" style=" border-spacing: 0; border-collapse: collapse; width: 100%;">
		<tr>
			<td width="100px">썸네일</td>
			<td>제목</td>
			<td width="150px">신청일</td>
			<td width="150px">관리ID</td>
			<td width="80px">승인/삭제</td>
		</tr>
		<%	
		/* RequestListPro에서 받아온 ArrayList를 이용해 페이지를 뿌린다. */
		for(int i = 0 ; i < requestList.size() ; i++) {
		RequestInfo reqToon = requestList.get(i);
		%>
		<tr style="border-top: 1px solid #444444;">
			<td style="padding: 10px 10px">
				<a onclick="reqToon('<%=reqToon.getWriter()%>');return false;">
					<img alt="<%=reqToon.getWriter()%> 썸네일" src="../img/request/<%=reqToon.getWriter()%>/subThumbnail.jpg" width="80px">
				</a>
			</td>
			<td style="text-align: left; padding-left: 30px">
				<a onclick="reqToon('<%=reqToon.getWriter()%>');return false;"><%=reqToon.getSubTitle() %></a>
			</td>
			<td>
				<p><%=reqToon.getWrdate() %></p>
			</td>
			<td>
				<input type="text" style="width: 100px; font-size: 1.2em;" name="toon_id">
			</td>
			<td>
				<input id="<%=reqToon.getWriter()%>" value="<%=reqToon.getWriter()%>" type="checkbox" name="checkedBox" style="width: 25px; height: 25px; vertical-align:bottom;">
				<input id="result" name="result" type="hidden">
			</td>
		</tr>
		<%} %>
	</table>
	<div style="margin: 10px; float: right;">
		<input id="agree" class="responseBtn" type="button" value="승인">
		<input id="delete" class="responseBtn" type="button" value="삭제">
	</div>
</form>
<%} %>
<script>
function reqToon(writer){
	window.open("../RequestToon?writer="+writer+"", "ReadReq", "width=755,height=800, left=200,top=100");
}

$(".responseBtn").click(function(e) {
	e.preventDefault;
	alert($(this).val());
	$("#result").val($(this).val());
	responseForm.submit();
})
</script>
