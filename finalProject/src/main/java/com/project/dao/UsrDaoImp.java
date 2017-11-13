package com.project.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.TestDto;
import com.project.dto.USRDto;

@Repository
public class UsrDaoImp implements UsrDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void userInsert(USRDto usr) throws SQLException {
		int num = 0;
		System.out.println("DAO:" + usr);
		num = sqlSession.insert("usrMapper.userInsert",usr);
	}

}
