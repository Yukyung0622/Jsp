<%@page import="kr.co.board1.db.ArticleDao"%>
<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//전송데이터 수신
	request.setCharacterEncoding("utf-8");
	String content = request.getParameter("content");
	String id = request.getParameter("id");
	
	//댓글 수정 Update
	int result = ArticleDao.getInstance().updateComment(content, id);
	
	//결과값(Json) 리턴
	String jsonData = "{\"result\":"+result+"}";
	out.print(jsonData);

%>