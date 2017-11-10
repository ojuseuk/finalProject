package com.project.service;

import java.sql.SQLException;
import java.util.List;

import com.project.dto.CRSDto;

public interface CrsMgService {
	
	public void courseInsert(CRSDto crs) throws SQLException;

	public List selectAll() throws SQLException;

}
