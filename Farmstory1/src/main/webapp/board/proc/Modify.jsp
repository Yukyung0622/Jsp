<%@page import="kr.co.farmstory1.dao.ArticleDao"%>
<%@page import="kr.co.farmstory1.bean.ArticleBean"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//전송데이터 수신
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String fname = request.getParameter("fname");
	String uid = request.getParameter("uid");
	String regip   = request.getRemoteAddr();
	
	ArticleBean ab = new ArticleBean();
	ab.setTitle(title);
	ab.setContent(content);
	ab.setFname(fname);
	ab.setUid(uid);
	ab.setRegip(regip);
		
	int result = ArticleDao.getInstance().insertArticle(ab);	
	
	
	//결과값(Json) 리턴
	String jsonData = "{\"result\":"+result+"}";
	out.print(jsonData);

%>