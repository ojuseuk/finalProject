package com.project.dao;

import java.sql.SQLException;
import java.util.List;

import com.project.dto.CLSSDto;
import com.project.dto.CRSDto;
import com.project.dto.TCHRDto;

public interface CrsMgDao {
	
	void courseInsert(CRSDto crs) throws Exception;

	List courseSelectAll() throws Exception;
	
	List clssSelectAll() throws Exception;

	void clssInsert(CLSSDto clss) throws Exception;
	
	List sbjtSelectAll() throws Exception;

	List crsSelectBySbjtNm(String sbjtNm) throws Exception;

	CLSSDto clssSelect(String clssId) throws Exception;

	List clssSelectByCourse(String crsId) throws Exception;

	CRSDto crsSelect(String crsId) throws Exception;

	String clssUpdate(CLSSDto clss) throws Exception;

	String courseUpdate(CRSDto course) throws Exception;

}
