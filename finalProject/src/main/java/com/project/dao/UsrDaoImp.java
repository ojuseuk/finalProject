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
	
	//아이디, 비밀번호 찾기 
	@Override
	public USRDto findId(HashMap<String, Object> map){
		System.out.println("DAOfindId:" + map);
		return sqlSession.selectOne("usrMapper.findId",map);
	}
	@Override
	public USRDto findPwd(HashMap<String, Object> map){
		System.out.println("DAOfindPwd:" + map);
		return sqlSession.selectOne("usrMapper.findPwd",map);
	}
	//////////////////////
	
	//idCheck pwdCheck
	@Override
	public USRDto idCheck(String id){
		System.out.println("DAOidCheck:" + id);
		return sqlSession.selectOne("usrMapper.idCheck",id);
	}
	@Override
	public USRDto pwdCheck(HashMap<String, String> map){
		System.out.println("DAOpwdCheck:" + map);
		return sqlSession.selectOne("usrMapper.pwdCheck",map);
	}
	////////////////////////////
	
	//after id check change pwd
	@Override
	public int new_change_pwd(HashMap<String, Object> map){
		System.out.println("DAOnew_change_pwd:" + map);
		return sqlSession.update("usrMapper.changePwdNew",map);
	}

}



