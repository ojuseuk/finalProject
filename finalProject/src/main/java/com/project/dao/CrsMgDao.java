package com.project.dao;

import java.sql.SQLException;
import java.util.List;

import com.project.dto.CLSSDto;
import com.project.dto.CRSDto;

public interface CrsMgDao {
	void courseInsert(CRSDto crs) throws SQLException;

	List courseSelectAll();
	
	List clssSelectAll();

	void clssInsert(CLSSDto clss) throws SQLException;
	
	List sbjtSelectAll();

	List crsSelectBySbjtNm(String sbjtNm);

	CLSSDto clssSelect(String clssId);

	List clssSelectByCourse(String crsId);

}
