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
	public int userInsert(USRDto usr) throws SQLException {
		System.out.println("DAO:" + usr);
		return sqlSession.insert("usrMapper.userInsert",usr);
	}
	
	@Override
	public USRDto userLogin(HashMap<String,Object> map){
		System.out.println("DAO:" + map);
		USRDto usrDto = sqlSession.selectOne("usrMapper.userLogin", map);
		if(usrDto == null) {
			System.out.println("?????");
		}
		return usrDto;
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
	public int changePwdNew(HashMap<String, Object> map){
		System.out.println("DAOchangePwdNew:" + map);
		return sqlSession.update("usrMapper.changePwdNew",map);
	}
	
	//update userOut
	@Override
	public int userOut(HashMap<String, Object> map){
		System.out.println("DAOuserOut:" + map);
		return sqlSession.update("usrMapper.userOut",map);
	}

//	스프링 보안 적용 로그인
	@Override
	public USRDto userLoginId(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("usrMapper.userLoginId", id);
	}

	@Override
	public USRDto confirmUsr(USRDto usr) {
		return sqlSession.selectOne("usrMapper.confirmUsr", usr);
	}
	
	public Boolean updateUsr(USRDto usr) {
		return sqlSession.update("usrMapper.updateUsr", usr) > 0 ? true : false;
	}
}



