package com.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.TestDto;

@Repository
public class TestDaoImp implements TestDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int test(TestDto testDto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("test.insertTest", testDto);
	}

}
