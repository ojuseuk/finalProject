package com.project.dao;

import java.util.List;
import java.util.Map;

import com.project.dto.CLSSDto;
import com.project.dto.CRSDto;
import com.project.dto.STDTDto;

public interface StdtMgDao {
	public Map<String, STDTDto> selectByAttnd();
	public List<String> selectBySTDT();
	public List<CRSDto> selectByCrs();
	public List<CLSSDto> selectByClss(String crsId);
}
