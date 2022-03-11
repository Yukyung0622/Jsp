package model.service.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.CustomerDao;
import model.service.CommonService;
import vo.CustomerVo;

public class RegisterService implements CommonService {

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {
		
		if(req.getMethod().equals("GET")) {
			// Get ��û�� ���
			return "/Sub8/customer/register.jsp";	
		}else {
			// Post ��û�� ���
			//String custid  = req.getParameter("custid");
			String name = req.getParameter("name");
			String address   = req.getParameter("address");
			String phone  = req.getParameter("phone");
			
			// Dao ����
			CustomerVo vo = new CustomerVo();
			//vo.setCustid(custid);
			vo.setName(name);
			vo.setAddress(address);
			vo.setPhone(phone);
			
			CustomerDao.getInstance().insertCustomer(vo);
			
			return "redirect:/JspStudy/Sub8/customer/list.do";
		}
		
	}

}