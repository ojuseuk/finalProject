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
	public Map<String, STDTDto> selectByAttnd(String today) throws Exception {
		return stdtMgDao.selectByAttnd(today);
	}

	@Override
	public List<String> selectBySTDT() throws Exception {
		return stdtMgDao.selectBySTDT();
	}
	
	public List<CRSDto> selectByCrs() throws Exception {
		return stdtMgDao.selectByCrs();
	}

	@Override
	public List<CLSSDto> selectByClss(String crsId) throws Exception {
		return stdtMgDao.selectByClss(crsId);
	}

	@Override
	public List<STDTInfoDto> selectByStdtList(String clssId) throws Exception {
		return stdtMgDao.selectByStdtList(clssId);
	}

	@Override
	public String selectStdtNo() throws Exception {
		return stdtMgDao.selectStdtNo();
	}

	@Override
	public List<STDTInfoDto> selectAllByStdt() throws Exception {
		return stdtMgDao.selectAllByStdt();
	}

	@Override
	public List<STDTInfoDto> selectStdtInfo(String stdtNo) throws Exception {
		return stdtMgDao.selectStdtInfo(stdtNo);
	}

	@Override
	public void updateStdtClss(STDTCLSSDto stdtInfo) throws Exception{
		stdtMgDao.updateStdtClss(stdtInfo);
	}

	@Override
	public void updateStdtPrnt(STDTDto stdt) throws Exception {
		stdtMgDao.updateStdtPrnt(stdt);
		
	}
	
	@Override
	public List<STDTInfoDto> selectByStdtNm(STDTInfoDto stdtInfo) throws Exception {
		return stdtMgDao.selectByStdtNm(stdtInfo);
	}
	
	@Override
	public List<STDTInfoDto> selectByClssStdtNm(STDTInfoDto stdtInfo) throws Exception {
		return stdtMgDao.selectByClssStdtNm(stdtInfo);
	}

	@Override
	public List<STDTInfoDto> selectStdtByCrs(String crsId) throws Exception {
		return stdtMgDao.selectStdtByCrs(crsId);
	}
	
	@Override
	public String selectStdtId(String id) throws Exception {
		return stdtMgDao.selectStdtId(id);
	}

	@Override
	public int insertStdt(STDTDto dto) throws Exception {
		return stdtMgDao.insertStdt(dto);
	}

	@Override
	public int insertStdtClss(STDTCLSSDto dto) throws Exception{
		return stdtMgDao.insertStdtClss(dto);
	}

	@Override
	public int updateUsrTp(STDTDto stdt) throws Exception {
		return stdtMgDao.updateUsrTp(stdt);
	}

}
