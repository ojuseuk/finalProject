package com.project.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
		System.out.println(list); 		// @@@
		
		return list;
		// TODO Auto-generated method stub
		
	}
	
}
