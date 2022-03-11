package model.service.customer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.CustomerDao;
import model.service.CommonService;
import vo.CustomerVo;

public class ListService implements CommonService{
	
	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {
		
		//Dao실행(데이터 가져오기)
		List<CustomerVo> customers = CustomerDao.getInstance().selectsCustomer();
		
		//members 데이터셋을 view에서 참조하기 위해 request 객체로 저장
		req.setAttribute("customers", customers);
		
		return "/Sub8/customer/list.jsp";

}

}
