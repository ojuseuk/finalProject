package com.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SchLfDaoImp implements SchLfDao{

	@Autowired
	private SqlSession sqlSession;

	//출석 유무로 부모 전화번호 선택
	@Override
	public List<String> selectByAttnd() {
		return sqlSession.selectList("schLfMapper.phoneByAttnd");
	}
	
}
