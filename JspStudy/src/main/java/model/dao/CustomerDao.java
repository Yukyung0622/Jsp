package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import controller.DBConfig;
import vo.CustomerVo;
import vo.UserVo;

public class CustomerDao {
	
	private static CustomerDao instance = new CustomerDao();
	
	public static CustomerDao getInstance() {
		return instance;
	}
	
	public void insertCustomer(CustomerVo vo) {
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement("INSERT INTO `customer` VALUES (?,?,?,?)");
			psmt.setInt(1, vo.getCustid());
			psmt.setString(2, vo.getName());
			psmt.setString(3, vo.getAddress());
			psmt.setString(4, vo.getPhone());
			
			psmt.executeUpdate();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	public CustomerVo selectCustomer(int custid) {
		CustomerVo customer = new CustomerVo();
		
		try {
			
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement("SELECT * FROM `Customer` WHERE `custid`=?");
			psmt.setInt(1, custid);
			
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				customer.setCustid(rs.getInt(1));
				customer.setName(rs.getString(2));
				customer.setAddress(rs.getString(3));
				customer.setPhone(rs.getString(4));
			}
			
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return customer;
	}
	
	
	
	public void selectsCustomer() {
		List<CustomerVo> users =new ArrayList<>();
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM `Customer`");
			
			while(rs.next()) {
				CustomerVo vo = new CustomerVo();
				vo.setCustid(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setAddress(rs.getString(3));
				vo.setPhone(rs.getString(4));
				
				users.add(vo);
			}
			
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return customer;
	}
	
	
	public void updateCustomer() {}
	public void deleteCustomer() {}
	
}
