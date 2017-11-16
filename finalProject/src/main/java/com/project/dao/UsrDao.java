package com.project.dao;

import java.sql.SQLException;
import java.util.HashMap;

import com.project.dto.USRDto;

public interface UsrDao {
	void userInsert(USRDto usr) throws SQLException;
	HashMap<String,Object> userLogin(HashMap<String,Object> map) throws SQLException;
	USRDto findId(HashMap<String, Object> map)throws SQLException;
	
}
