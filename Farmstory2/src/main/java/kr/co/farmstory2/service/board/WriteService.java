package kr.co.farmstory2.service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.controller.CommonService;

public class WriteService implements CommonService {
	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {

		return "/board/write.jsp";
	}
}
