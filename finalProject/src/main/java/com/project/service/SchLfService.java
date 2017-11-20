package com.project.service;

import java.util.List;
import java.util.Map;

import com.project.dto.ATTNDDto;
import com.project.dto.CRSDto;
import com.project.dto.ClssInfoDto;
import com.project.dto.DateDto;
import com.project.dto.SBJTDto;

public interface SchLfService {
	public List<SBJTDto> selectBySbjt();
	public List<CRSDto> selectByCrs();
	public List<CRSDto> selectCrsPerSbjt(String sbjtNm);
	public List<ClssInfoDto> selectClssPerCrs(String crsId);
	public List<ClssInfoDto> selectMyClss(String id);
	public List<Map<String, String>> selectMyAttnd(DateDto dto);
	
}
