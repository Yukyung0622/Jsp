<%@page import="kr.co.board1.bean.ArticleBean"%>
<%@page import="kr.co.board1.dao.ArticleDao"%>
<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//전송데이터 수신
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String fname = request.getParameter("fname");
	String uid = request.getParameter("uid");
	String regip   = request.getRemoteAddr();
	
	//댓글 수정 Update
	ArticleBean article = new ArticleBean();
	article.setTitle(title);
	article.setContent(content);
	article.setFname(fname);
	article.setUid(uid);
	article.setRegip(regip);
	
	int result = ArticleDao.getInstance().insertArticle(article);
	
	//결과값(Json) 리턴
	String jsonData = "{\"result\":"+result+"}";
	out.print(jsonData);

%>