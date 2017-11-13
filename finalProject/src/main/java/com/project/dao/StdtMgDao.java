package com.project.dao;

import java.util.List;
import java.util.Map;

import com.project.dto.CLSSDto;
import com.project.dto.CRSDto;
import com.project.dto.STDTCLSSDto;
import com.project.dto.STDTDto;
import com.project.dto.STDTInfoDto;

public interface StdtMgDao {
	public Map<String, STDTDto> selectByAttnd();
	public List<String> selectBySTDT();
	public List<CRSDto> selectByCrs();
	public List<CLSSDto> selectByClss(String crsId);
	public List<STDTInfoDto> selectByStdtList(String clssNm);
	public String selectStdtNo();
	public List<STDTInfoDto> selectAllByStdt();
	public List<STDTInfoDto> selectStdtInfo(String stdtNo);
	public void updateStdtClss(STDTCLSSDto stdtInfo);
	public List<STDTInfoDto> selectByNm(STDTInfoDto stdtInfo);
	public List<STDTInfoDto> selectStdtByCrs(String crsId);
}
