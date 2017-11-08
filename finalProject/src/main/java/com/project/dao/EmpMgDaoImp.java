package com.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmpMgDaoImp implements EmpMgDao {

	@Autowired
	private SqlSession sqlSession;
	
}
