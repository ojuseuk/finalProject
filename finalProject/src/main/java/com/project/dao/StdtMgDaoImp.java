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
	public Map<String, STDTDto> selectByAttnd(String today) throws Exception {
		System.out.println(sqlSession.selectMap("stdtMgMapper.phoneByAttnd", "prntPhone", today));
		return null;
	}

	@Override
	public List<String> selectBySTDT() throws Exception {
		return sqlSession.selectList("stdtMgMapper.phoneBySTDT");
	}

	@Override
	public List<CRSDto> selectByCrs() throws Exception {
		return sqlSession.selectList("stdtMgMapper.selectByCrs");
	}

	@Override
	public List<CLSSDto> selectByClss(String crsId) throws Exception {
		return sqlSession.selectList("stdtMgMapper.selectByClss", crsId);
	}

	@Override
	public List<STDTInfoDto> selectByStdtList(String clssId) throws Exception {
		return sqlSession.selectList("stdtMgMapper.selectByStdtClss", clssId);
	}

	@Override
	public String selectStdtNo() throws Exception {
		return sqlSession.selectOne("stdtMgMapper.selectStdtNo");
	}

	@Override
	public List<STDTInfoDto> selectAllByStdt() throws Exception {
		return sqlSession.selectList("stdtMgMapper.selectAllOfStdt");
	}

	@Override
	public List<STDTInfoDto> selectStdtInfo(String stdtNo) throws Exception {
		return sqlSession.selectList("stdtMgMapper.selectStdtInfo", stdtNo);
	}

	@Override
	public void updateStdtClss(STDTCLSSDto stdtInfo) throws Exception {
		sqlSession.update("stdtMgMapper.updateStdtClss", stdtInfo);
	}

	@Override
	public void updateStdtPrnt(STDTDto stdt) throws Exception {
		sqlSession.update("stdtMgMapper.updateStdtPrnt", stdt);
	}
	
	@Override
	public List<STDTInfoDto> selectByStdtNm(STDTInfoDto stdtInfo) throws Exception {
		return sqlSession.selectList("stdtMgMapper.selectStdtNm", stdtInfo);
	}
	
	@Override
	public List<STDTInfoDto> selectByClssStdtNm(STDTInfoDto stdtInfo) throws Exception {
		return sqlSession.selectList("stdtMgMapper.selectClssStdtNm", stdtInfo);
	}

	@Override
	public List<STDTInfoDto> selectStdtByCrs(String crsId) throws Exception {
		return sqlSession.selectList("stdtMgMapper.selectStdtByCrs", crsId);
	}
	
	@Override
	public String selectStdtId(String id) throws Exception {
		return sqlSession.selectOne("stdtMgMapper.selectStdtId", id);
	}

	@Override
	public int insertStdt(STDTDto dto) throws Exception {
		return sqlSession.insert("stdtMgMapper.insertStdt", dto);
	}
	
	@Override
	public int insertStdtClss(STDTCLSSDto dto) throws Exception {
		return sqlSession.insert("stdtMgMapper.insertStdtClss", dto);
	}

	@Override
	public int updateUsrTp(STDTDto stdt) throws Exception {
		return sqlSession.update("stdtMgMapper.updateUsrTp", stdt);
	}

}
