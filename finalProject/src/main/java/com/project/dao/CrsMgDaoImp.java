package com.project.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.CLSSDto;
import com.project.dto.CRSDto;
import com.project.dto.TCHRDto;

@Repository
public class CrsMgDaoImp implements CrsMgDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void courseInsert(CRSDto crs) throws SQLException {
		int num = 0;
		System.out.println("DAO : " + crs); 		// @@@
		num = sqlSession.insert("crsMgMapper.courseInsert", crs);
		
	}

	@Override
	public List courseSelectAll() {
		List list = sqlSession.selectList("crsMgMapper.courseSelectAll");
		
		return list;
		// TODO Auto-generated method stub
		
	}

	@Override
	public List clssSelectAll() {
		List list = sqlSession.selectList("crsMgMapper.clssSelectAll");
		return list;
	}

	@Override
	public void clssInsert(CLSSDto clss) throws SQLException {
		// TODO Auto-generated method stub
		int num = 0;
		System.out.println("DAO : " + clss); 		// @@@
		num = sqlSession.insert("crsMgMapper.clssInsert", clss);
	}

	@Override
	public List sbjtSelectAll() {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("crsMgMapper.sbjtSelectAll");
		return list;
	}

	@Override
	public List crsSelectBySbjtNm(String sbjtNm) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("crsMgMapper.crsSelectBySbjtNm", sbjtNm);
		return list;	}

	@Override
	public CLSSDto clssSelect(String clssId) {
		// TODO Auto-generated method stub
		System.out.println("DAO : " + clssId);
		CLSSDto clss = sqlSession.selectOne("crsMgMapper.clssSelect", clssId);
		System.out.println("DAO : " + clss);
		return clss;
	}

	@Override
	public List clssSelectByCourse(String crsId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("crsMgMapper.clssSelectByCourse", crsId);
	}

	@Override
	public CRSDto crsSelect(String crsId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("crsMgMapper.crsSelect", crsId);
	}

	@Override
	public String clssUpdate(CLSSDto clss) {
		// TODO Auto-generated method stub
		String resultMsg = "";
		int result = sqlSession.update("crsMgMapper.clssUpdate", clss);
		if (result > 0) {
			resultMsg = "강좌정보가 정상적으로 수정되었습니다.";
		} else {
			resultMsg = "강좌정보 수정에 실패했습니다.";
		}
		return resultMsg;
	}
	
}
