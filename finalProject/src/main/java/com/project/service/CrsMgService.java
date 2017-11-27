package com.project.service;

import java.sql.SQLException;
import java.util.List;

import com.project.dto.CLSSDto;
import com.project.dto.CRSDto;
import com.project.dto.SBJTDto;
import com.project.dto.TCHRDto;

public interface CrsMgService {
	
	public void courseInsert(CRSDto crs) throws SQLException;

	public List selectAll() throws SQLException;
	
	public List clssSelectAll() throws SQLException;

	public void clssInsert(CLSSDto clss) throws SQLException;

	public List sbjtSelectAll() throws SQLException;

	public List crsSelectBySbjtNm(String sbjtNm);

	public CLSSDto clssSelect(String clssId);

	public List clssSelectByCourse(String crsId);

	public CRSDto crsSelect(String crsId);

	public String clssUpdate(CLSSDto clss);
	
	

}
