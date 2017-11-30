package com.project.service;

import java.util.List;

import com.project.dto.CLSSDto;
import com.project.dto.CRSDto;
import com.project.dto.SBJTDto;
import com.project.dto.TCHRDto;

public interface CrsMgService {
	
	public void courseInsert(CRSDto crs) throws Exception;

	public List selectAll() throws Exception;
	
	public List clssSelectAll() throws Exception;

	public void clssInsert(CLSSDto clss) throws Exception;

	public List sbjtSelectAll() throws Exception;

	public List crsSelectBySbjtNm(String sbjtNm) throws Exception;

	public CLSSDto clssSelect(String clssId) throws Exception;

	public List clssSelectByCourse(String crsId) throws Exception;

	public CRSDto crsSelect(String crsId) throws Exception;

	public String clssUpdate(CLSSDto clss) throws Exception;

	public String courseUpdate(CRSDto course) throws Exception;
	
	

}
