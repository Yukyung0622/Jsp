package kr.co.board2.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;

import kr.co.board2.controller.CommonService;
import kr.co.board2.dao.ArticleDao;
import kr.co.board2.vo.ArticleVo;
import kr.co.board2.vo.UserVo;

public class ModifyService implements CommonService {

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {
		
		// 로그인 체크
		HttpSession sess = req.getSession();
		UserVo userVo = (UserVo) sess.getAttribute("sessUser");
		
		if(userVo == null) {
			return "redirect:/Board2/user/login.do";
		}else {
			if(req.getMethod().equals("GET")) {
				
				
				String no = req.getParameter("no");
				
				ArticleVo article = ArticleDao.getInstance().selectArticle(no);
				
				req.setAttribute("article", article);
				
				return "/modify.jsp";
				
			}else {
				
				String no = req.getParameter("no");
				String title = req.getParameter("title");
				String content = req.getParameter("content");
				
				ArticleDao.getInstance().updateArticle(no,title, content);
				
				return "redirect:/Board2/view.do?no="+no;
			}
		
			
	 }
		
	}
}