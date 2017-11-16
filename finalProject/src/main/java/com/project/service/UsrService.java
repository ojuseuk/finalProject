package com.project.service;

import java.sql.SQLException;
import java.util.HashMap;

import com.project.dto.USRDto;



public interface UsrService {
	
	public void userInsert(USRDto usr) throws SQLException;
	public HashMap<String,Object> userLogin(HashMap<String,Object> map) throws SQLException;
	public USRDto findId(HashMap<String, Object> map) throws SQLException;

}
