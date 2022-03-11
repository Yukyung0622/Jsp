package model.service.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.CustomerDao;
import model.service.CommonService;
import vo.CustomerVo;

public class DeleteService implements CommonService{
	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String custid = req.getParameter("custid");
		CustomerDao.getInstance().deleteCustomer(custid);
			
			return "redirect:/JspStudy/Sub8/customer/list.do";
		}

}


