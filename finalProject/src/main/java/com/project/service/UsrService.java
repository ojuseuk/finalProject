package com.project.service;

import java.sql.SQLException;
import java.util.HashMap;

import com.project.dto.USRDto;



public interface UsrService {
	
	public void userInsert(USRDto usr) throws SQLException;
	public HashMap<String,Object> userLogin(HashMap<String,Object> map) throws SQLException;
	
	//findId
	public USRDto findId(HashMap<String, Object> map) throws SQLException;
	
	//findPwd
	public USRDto findPwd(HashMap<String, Object> map) throws SQLException;
		
	//idCheck
	public USRDto idCheck(String id) throws SQLException;
	
	//pwdCheck
	public USRDto pwdCheck(HashMap<String, String> map) throws SQLException;
	
	//after id check change pwd
	public int new_change_pwd(HashMap<String, Object> map) throws SQLException;
		
}
