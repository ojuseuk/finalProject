package com.project.dao;

import java.sql.SQLException;

import com.project.dto.USRDto;

public interface UsrDao {
	void userInsert(USRDto usr) throws SQLException;
	
	
}
