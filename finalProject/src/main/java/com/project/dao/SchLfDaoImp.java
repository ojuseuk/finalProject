package com.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.ATTNDDto;
import com.project.dto.CRSDto;
import com.project.dto.ClssInfoDto;
import com.project.dto.DateDto;
import com.project.dto.SBJTDto;
import com.project.dto.SCRDto;
import com.project.dto.STDTCLSSDto;
import com.project.dto.STDTDto;

@Repository
public class SchLfDaoImp implements SchLfDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<SBJTDto> selectBySbjt() throws Exception{
		return sqlSession.selectList("schLfMapper.selectSbjt");
	}

	@Override
	public List<ClssInfoDto> selectByCrs() throws Exception{
		return sqlSession.selectList("schLfMapper.selectCrs");
	}

	@Override
	public List<ClssInfoDto> selectCrsPerSbjt(String sbjtNm) throws Exception{
		return sqlSession.selectList("schLfMapper.selectCrsPerSbjt", sbjtNm);
	}

	@Override
	public List<ClssInfoDto> selectClssPerCrs(String crsId) throws Exception{
		return sqlSession.selectList("schLfMapper.selectClssPerCrs", crsId);
	}

	@Override
	public List<ClssInfoDto> selectMyClss(String id) throws Exception{
		return sqlSession.selectList("schLfMapper.selectMyClss", id);
	}

	@Override
	public List<Map<String, String>> selectMyAttnd(DateDto dto) throws Exception{
		System.out.println(sqlSession.selectList("schLfMapper.myAttnd", dto));
		return sqlSession.selectList("schLfMapper.myAttnd", dto);
	}

	@Override
	public List<SCRDto> selectMyScr(String id) throws Exception{
		return sqlSession.selectList("schLfMapper.myScr", id);
	}

	@Override
	public String selectMyStdtNo(String id) throws Exception{
		return sqlSession.selectOne("schLfMapper.myStdtNo", id);
	}
	
	@Override
	public String selectStdtNo() throws Exception{
		return sqlSession.selectOne("schLfMapper.selectStdtNo");
	}

	@Override
	public void insertNewStdt(STDTDto stdt) throws Exception{
		sqlSession.insert("schLfMapper.insertNewStdt", stdt);
	}

	@Override
	public void insertStdtToStdtClss(STDTCLSSDto stdtclss) throws Exception{
		sqlSession.insert("schLfMapper.insertStdtToStdtClss", stdtclss);
	}
}
