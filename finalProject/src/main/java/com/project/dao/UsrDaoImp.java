package com.project.dao;

import java.sql.SQLException;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.USRDto;

@Repository
public class UsrDaoImp implements UsrDao {

	@Autowired
	private SqlSession sqlSession;
	//private final String NAMESPACE="mapper.usrMapper";
	
	
	@Override
	public void userInsert(USRDto usr) throws SQLException {
		int num = 0;
		System.out.println("DAO:" + usr);
		num = sqlSession.insert("usrMapper.userInsert",usr);
	}
	
	@Override
	public HashMap<String,Object> userLogin(HashMap<String,Object> map){
		System.out.println("DAO:" + map);
		return sqlSession.selectOne("usrMapper.userLogin",map);
	}

}
