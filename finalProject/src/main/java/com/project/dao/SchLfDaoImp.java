package com.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SchLfDaoImp implements SchLfDao{

	@Autowired
	private SqlSession sqlSession;
	
}
