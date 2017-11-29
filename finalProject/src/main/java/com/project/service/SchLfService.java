package com.project.service;

import java.util.List;
import java.util.Map;

import com.project.dto.ATTNDDto;
import com.project.dto.CRSDto;
import com.project.dto.ClssInfoDto;
import com.project.dto.DateDto;
import com.project.dto.SBJTDto;
import com.project.dto.SCRDto;
import com.project.dto.STDTCLSSDto;
import com.project.dto.STDTDto;

public interface SchLfService {
	public List<SBJTDto> selectBySbjt() throws Exception;
	public List<ClssInfoDto> selectByCrs() throws Exception;
	public List<ClssInfoDto> selectCrsPerSbjt(String sbjtNm) throws Exception;
	public List<ClssInfoDto> selectClssPerCrs(String crsId) throws Exception;
	public List<ClssInfoDto> selectMyClss(String id) throws Exception;
	public List<Map<String, String>> selectMyAttnd(DateDto dto) throws Exception;
	public List<SCRDto> selectMyScr(String id) throws Exception;
	public String selectMyStdtNo(String id) throws Exception;
	public String selectStdtNo() throws Exception;
	public void insertNewStdt(STDTDto stdt) throws Exception;
	public void insertStdtToStdtClss(STDTCLSSDto stdtclss) throws Exception;
}
