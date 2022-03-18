package kr.co.board2.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.board2.controller.CommonService;
import kr.co.board2.dao.ArticleDao;
import kr.co.board2.vo.ArticleVo;
import kr.co.board2.vo.UserVo;

public class DeleteService implements CommonService {

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {
		
		
		HttpSession sess = req.getSession();
		UserVo userVo = (UserVo) sess.getAttribute("sessUser");
		
		if(userVo == null) {
			return "redirect:/Board2/user/login.do";
		}else {
			String no = req.getParameter("no");
			String file = req.getParameter("file");
			String fid = req.getParameter("fid");
			
			
			if(Integer.parseInt(file) == 0) {
				
	
				ArticleDao.getInstance().deleteArticle(no);
				ArticleDao.getInstance().deleteArticleComment(no);
				
				
				return "redirect:/Board2/list.do";
			}else {
				
				ArticleDao.getInstance().deleteArticle(no);
				ArticleDao.getInstance().deleteArticleComment(no);
				ArticleDao.getInstance().deleteArticleFile(fid);
				
				
				
				return "redirect:/Board2/list.do";
			}
	}
		}
}
