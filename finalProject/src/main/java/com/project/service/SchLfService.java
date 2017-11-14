package com.project.service;

import java.util.List;

import com.project.dto.CRSDto;
import com.project.dto.ClssInfoDto;
import com.project.dto.SBJTDto;

public interface SchLfService {
	public List<SBJTDto> selectBySbjt();
	public List<CRSDto> selectByCrs();
	public List<CRSDto> selectCrsPerSbjt(String sbjtNm);
	public List<ClssInfoDto> selectClssPerCrs(String crsId);
}
