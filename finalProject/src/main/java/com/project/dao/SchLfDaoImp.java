package com.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.CRSDto;
import com.project.dto.ClssInfoDto;
import com.project.dto.SBJTDto;
import com.project.dto.STDTDto;

@Repository
public class SchLfDaoImp implements SchLfDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<SBJTDto> selectBySbjt() {
		return sqlSession.selectList("schLfMapper.selectSbjt");
	}

	@Override
	public List<CRSDto> selectByCrs() {
		return sqlSession.selectList("schLfMapper.selectCrs");
	}

	@Override
	public List<CRSDto> selectCrsPerSbjt(String sbjtNm) {
		return sqlSession.selectList("schLfMapper.selectCrsPerSbjt", sbjtNm);
	}

	@Override
	public List<ClssInfoDto> selectClssPerCrs(String crsId) {
		return sqlSession.selectList("schLfMapper.selectClssPerCrs", crsId);
	}
	
}
