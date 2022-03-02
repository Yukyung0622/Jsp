<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//세션해제
	session.invalidate(); 
	response.sendRedirect("/Farmstory1?success=101");

%>