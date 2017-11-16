package com.project.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.CLSSDto;
import com.project.dto.CRSDto;

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
	
}
