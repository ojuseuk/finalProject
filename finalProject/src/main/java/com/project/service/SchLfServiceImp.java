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
import com.project.dto.STDTCLSSDto;
import com.project.dto.STDTDto;

@Service
public class SchLfServiceImp implements SchLfService {

	@Autowired
	private SchLfDao schLfDao;

	@Override
	public List<SBJTDto> selectBySbjt() throws Exception{
		return schLfDao.selectBySbjt();
	}

	@Override
	public List<ClssInfoDto> selectByCrs() throws Exception{
		return schLfDao.selectByCrs();
	}

	@Override
	public List<ClssInfoDto> selectCrsPerSbjt(String sbjtNm) throws Exception{
		return schLfDao.selectCrsPerSbjt(sbjtNm);
	}

	@Override
	public List<ClssInfoDto> selectClssPerCrs(String crsId) throws Exception{
		return schLfDao.selectClssPerCrs(crsId);
	}

	@Override
	public List<ClssInfoDto> selectMyClss(String id) throws Exception{
		return schLfDao.selectMyClss(id);
	}

	@Override
	public List<Map<String, String>> selectMyAttnd(DateDto dto) throws Exception{
		return schLfDao.selectMyAttnd(dto);
	}

	@Override
	public List<SCRDto> selectMyScr(String id) throws Exception{
		return schLfDao.selectMyScr(id);
	}

	@Override
	public String selectMyStdtNo(String id) throws Exception{
		return schLfDao.selectMyStdtNo(id);
	}

	@Override
	public String selectStdtNo() throws Exception{
		return schLfDao.selectStdtNo();
	}

	@Override
	public void insertNewStdt(STDTDto stdt) throws Exception{
		schLfDao.insertNewStdt(stdt);
	}

	@Override
	public void insertStdtToStdtClss(STDTCLSSDto stdtclss) throws Exception{
		schLfDao.insertStdtToStdtClss(stdtclss);
	}

}
