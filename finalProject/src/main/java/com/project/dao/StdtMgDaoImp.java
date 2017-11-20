package com.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.CLSSDto;
import com.project.dto.CRSDto;
import com.project.dto.STDTCLSSDto;
import com.project.dto.STDTDto;
import com.project.dto.STDTInfoDto;

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
		return sqlSession.selectList("stdtMgMapper.selectByCrs");
	}

	@Override
	public List<CLSSDto> selectByClss(String crsId) {
		return sqlSession.selectList("stdtMgMapper.selectByClss", crsId);
	}

	@Override
	public List<STDTInfoDto> selectByStdtList(String clssNm) {
		return sqlSession.selectList("stdtMgMapper.selectByStdtClss", clssNm);
	}

	@Override
	public String selectStdtNo() {
		return sqlSession.selectOne("stdtMgMapper.selectStdtNo");
	}

	@Override
	public List<STDTInfoDto> selectAllByStdt() {
		return sqlSession.selectList("stdtMgMapper.selectAllOfStdt");
	}

	@Override
	public List<STDTInfoDto> selectStdtInfo(String stdtNo) {
		return sqlSession.selectList("stdtMgMapper.selectStdtInfo", stdtNo);
	}

	@Override
	public void updateStdtClss(STDTCLSSDto stdtInfo) {
		sqlSession.update("stdtMgMapper.updateStdtClss", stdtInfo);
	}

	@Override
	public List<STDTInfoDto> selectByStdtNm(STDTInfoDto stdtInfo) {
		return sqlSession.selectList("stdtMgMapper.selectStdtNm", stdtInfo);
	}
	
	@Override
	public List<STDTInfoDto> selectByClssStdtNm(STDTInfoDto stdtInfo) {
		return sqlSession.selectList("stdtMgMapper.selectClssStdtNm", stdtInfo);
	}

	@Override
	public List<STDTInfoDto> selectStdtByCrs(String crsId) {
		return sqlSession.selectList("stdtMgMapper.selectStdtByCrs", crsId);
	}
	
	@Override
	public String selectStdtId(String id) {
		return sqlSession.selectOne("stdtMgMapper.selectStdtId", id);
	}

	@Override
	public int insertStdt(STDTDto dto) {
		return sqlSession.insert("stdtMgMapper.insertStdt", dto);
	}
}
