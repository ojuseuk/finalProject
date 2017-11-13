package com.project.service;

import java.sql.SQLException;
import java.util.List;

import com.project.dto.USRDto;



public interface UsrService {
	
	public void userInsert(USRDto usr) throws SQLException;


}
