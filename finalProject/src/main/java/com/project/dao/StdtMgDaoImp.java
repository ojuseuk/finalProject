package com.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.CLSSDto;
import com.project.dto.CRSDto;
import com.project.dto.STDTDto;

@Repository
public class StdtMgDaoImp implements StdtMgDao {

	@Autowired
	private SqlSession sqlSession;
	@Override
	public Map<String, STDTDto> selectByAttnd() {
		return sqlSession.selectMap("stdtMgMapper.phoneByAttnd", "prntPhone");
	}

	@Override
	public List<String> selectBySTDT() {
		return sqlSession.selectList("stdtMgMapper.phoneBySTDT");
	}

	@Override
	public List<CRSDto> selectByCrs() {
		System.out.println(sqlSession.selectList("stdtMgMapper.selectByCrs"));
		return sqlSession.selectList("stdtMgMapper.selectByCrs");
	}

	@Override
	public List<CLSSDto> selectByClss(String crsId) {
		System.out.println(sqlSession.selectList("stdtMgMapper.selectByClss", crsId));
		return sqlSession.selectList("stdtMgMapper.selectByClss", crsId);
	}
}
