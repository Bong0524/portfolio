<%@page import="com.humanwebtoon.vo.CommentInfo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ArrayList<CommentInfo> commentsList = (ArrayList<CommentInfo>)request.getAttribute("commentsList");
if(commentsList.size()==0){%>
	<div style="text-align: center;">
		댓글이 아직 없습니다. 첫번째 댓글을 달아보세요!
	</div>
<%}
for(int i = 0 ; i < commentsList.size() ; i++){
	CommentInfo comment = commentsList.get(i);
%>
	<div>
		<span><%=comment.getWriter_name() %>(<%=comment.getWriter_id() %>)</span>
		<span><%=comment.getWrdate() %></span>
		<p><%=comment.getComments() %></p>	
	</div>
<%}%>
