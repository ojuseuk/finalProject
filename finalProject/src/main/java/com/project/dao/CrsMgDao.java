package com.project.dao;

import java.sql.SQLException;
import java.util.List;

import com.project.dto.CRSDto;

public interface CrsMgDao {
	void courseInsert(CRSDto crs) throws SQLException;

	List courseSelectAll();

}
