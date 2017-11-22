package com.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.project.dao.SchLfDao;
import com.project.dto.ATTNDDto;
import com.project.dto.CRSDto;
import com.project.dto.ClssInfoDto;
import com.project.dto.DateDto;
import com.project.dto.SBJTDto;
import com.project.dto.SCRDto;

@Service
public class SchLfServiceImp implements SchLfService{

	@Autowired
	private SchLfDao schLfDao;

	@Override
	public List<SBJTDto> selectBySbjt() {
		return schLfDao.selectBySbjt();
	}

	@Override
	public List<ClssInfoDto> selectByCrs() {
		return schLfDao.selectByCrs();
	}

	@Override
	public List<ClssInfoDto> selectCrsPerSbjt(String sbjtNm) {
		return schLfDao.selectCrsPerSbjt(sbjtNm);
	}

	@Override
	public List<ClssInfoDto> selectClssPerCrs(String crsId) {
		return schLfDao.selectClssPerCrs(crsId);
	}

	@Override
	public List<ClssInfoDto> selectMyClss(String id) {
		return schLfDao.selectMyClss(id);
	}

	@Override
	public List<Map<String, String>> selectMyAttnd(DateDto dto) {
		return schLfDao.selectMyAttnd(dto);
	}

	@Override
	public List<SCRDto> selectMyScr(String id) {
		return schLfDao.selectMyScr(id);
	}

	

}
