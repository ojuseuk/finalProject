package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.SchLfDao;
import com.project.dto.CRSDto;
import com.project.dto.ClssInfoDto;
import com.project.dto.SBJTDto;

@Service
public class SchLfServiceImp implements SchLfService{

	@Autowired
	private SchLfDao schLfDao;

	@Override
	public List<SBJTDto> selectBySbjt() {
		return schLfDao.selectBySbjt();
	}

	@Override
	public List<CRSDto> selectByCrs() {
		return schLfDao.selectByCrs();
	}

	@Override
	public List<CRSDto> selectCrsPerSbjt(String sbjtNm) {
		return schLfDao.selectCrsPerSbjt(sbjtNm);
	}

	@Override
	public List<ClssInfoDto> selectClssPerCrs(String crsId) {
		return schLfDao.selectClssPerCrs(crsId);
	}

}
