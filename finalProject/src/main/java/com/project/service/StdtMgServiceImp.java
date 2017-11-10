package com.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.StdtMgDao;
import com.project.dto.CLSSDto;
import com.project.dto.CRSDto;
import com.project.dto.STDTDto;

@Service
public class StdtMgServiceImp implements StdtMgService {

	@Autowired
	private StdtMgDao stdtMgDao;
	@Override
	public Map<String, STDTDto> selectByAttnd() {
		return stdtMgDao.selectByAttnd();
	}

	@Override
	public List<String> selectBySTDT() {
		return stdtMgDao.selectBySTDT();
	}
	
	public List<CRSDto> selectByCrs() {
		return stdtMgDao.selectByCrs();
	}

	@Override
	public List<CLSSDto> selectByClss(String crsId) {
		return stdtMgDao.selectByClss(crsId);
	}
}
