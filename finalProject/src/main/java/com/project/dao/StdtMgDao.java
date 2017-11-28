package com.project.dao;

import java.util.List;
import java.util.Map;

import com.project.dto.CLSSDto;
import com.project.dto.CRSDto;
import com.project.dto.STDTCLSSDto;
import com.project.dto.STDTDto;
import com.project.dto.STDTInfoDto;

public interface StdtMgDao {
	public Map<String, STDTDto> selectByAttnd() throws Exception;
	public List<String> selectBySTDT() throws Exception;
	public List<CRSDto> selectByCrs() throws Exception;
	public List<CLSSDto> selectByClss(String crsId) throws Exception;
	public List<STDTInfoDto> selectByStdtList(String clssNm) throws Exception;
	public String selectStdtNo() throws Exception;
	public List<STDTInfoDto> selectAllByStdt() throws Exception;
	public List<STDTInfoDto> selectStdtInfo(String stdtNo) throws Exception;
	public void updateStdtClss(STDTCLSSDto stdtInfo) throws Exception;
	public void updateStdtPrnt(STDTDto stdt) throws Exception;
	public List<STDTInfoDto> selectByStdtNm(STDTInfoDto stdtInfo) throws Exception;
	public List<STDTInfoDto> selectByClssStdtNm(STDTInfoDto stdtInfo) throws Exception;
	public List<STDTInfoDto> selectStdtByCrs(String crsId) throws Exception;
	public String selectStdtId(String id) throws Exception;
	public int insertStdt(STDTDto dto) throws Exception;
	public int insertStdtClss(STDTCLSSDto dto) throws Exception;
	public int updateUsrTp(STDTDto stdt) throws Exception;
}
