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
	<div style="border-bottom: 1px solid #aaa; padding: 15px 0;">
		<p style="font-weight: bold;"><%=comment.getWriter_name() %>(<%=comment.getWriter_id() %>)</p>
		<p style="margin: 8px 0;"><%=comment.getComments() %></p>	
		<p style="color: #bbb; font-size: 0.9em;"><%=comment.getWrdate() %></p>
	</div>
<%}%>
