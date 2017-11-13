package com.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.StdtMgDao;
import com.project.dto.CLSSDto;
import com.project.dto.CRSDto;
import com.project.dto.STDTCLSSDto;
import com.project.dto.STDTDto;
import com.project.dto.STDTInfoDto;

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

	@Override
	public List<STDTInfoDto> selectByStdtList(String clssNm) {
		return stdtMgDao.selectByStdtList(clssNm);
	}

	@Override
	public String selectStdtNo() {
		return stdtMgDao.selectStdtNo();
	}

	@Override
	public List<STDTInfoDto> selectAllByStdt() {
		return stdtMgDao.selectAllByStdt();
	}

	@Override
	public List<STDTInfoDto> selectStdtInfo(String stdtNo) {
		return stdtMgDao.selectStdtInfo(stdtNo);
	}

	@Override
	public void updateStdtClss(STDTCLSSDto stdtInfo) {
		stdtMgDao.updateStdtClss(stdtInfo);
	}

	@Override
	public List<STDTInfoDto> selectByNm(STDTInfoDto stdtInfo) {
		return stdtMgDao.selectByNm(stdtInfo);
	}

	@Override
	public List<STDTInfoDto> selectStdtByCrs(String crsId) {
		return stdtMgDao.selectStdtByCrs(crsId);
	}
}
