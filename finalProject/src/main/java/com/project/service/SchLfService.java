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
	public List<SBJTDto> selectBySbjt();
	public List<ClssInfoDto> selectByCrs();
	public List<ClssInfoDto> selectCrsPerSbjt(String sbjtNm);
	public List<ClssInfoDto> selectClssPerCrs(String crsId);
	public List<ClssInfoDto> selectMyClss(String id);
	public List<Map<String, String>> selectMyAttnd(DateDto dto);
	public List<SCRDto> selectMyScr(String id);
	public String selectMyStdtNo(String id);
	public String selectStdtNo();
	public void insertNewStdt(STDTDto stdt);
	public void insertStdtToStdtClss(STDTCLSSDto stdtclss);
}
