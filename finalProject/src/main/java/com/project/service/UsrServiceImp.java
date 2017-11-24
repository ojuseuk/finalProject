package com.project.service;

import java.sql.SQLException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.UsrDao;
import com.project.dto.USRDto;

@Service
public class UsrServiceImp implements UsrService {

	@Autowired
	private UsrDao usrDao;
	
	public void setDao(UsrDao dao) {
		this.usrDao = dao;
	}

	@Override
	public int userInsert(USRDto usr) throws SQLException {
		System.out.println("service : " + usr); 		

		return usrDao.userInsert(usr);
		
	}
	
	@Override
	public USRDto userLogin(HashMap<String, Object> map) throws SQLException{
		System.out.println("service : " + map); 
		
		USRDto usrDto = usrDao.userLogin(map);
		
		return usrDto;
	}
	
	//아이디, 비밀번호 찾기
	@Override
	public USRDto findId(HashMap<String, Object> map) throws SQLException {
		System.out.println("servicefindId : " + map); 
		return usrDao.findId(map);
	}
	
	@Override
	public USRDto findPwd(HashMap<String, Object> map) throws SQLException {
		System.out.println("servicefindPwd : " + map);
		return usrDao.findPwd(map);
	}
	//------------------------
	
	//idChect pwdCheck
	@Override
	public USRDto idCheck(String id) throws SQLException{
		System.out.println("serviceidCheck : " + id);
		return usrDao.idCheck(id);
	}
	@Override
	public USRDto pwdCheck(HashMap<String, String> map) throws SQLException{
		System.out.println("servicepwdCheck : " + map);
		return usrDao.pwdCheck(map);
	}
	
	
	//--------------------
	
	//after id check change pwd
	@Override
	public int changePwdNew(HashMap<String, Object> map) throws SQLException{
		System.out.println("servicechangePwdNew : " + map);
		return usrDao.changePwdNew(map);
	}
	
	
	//userOut
	@Override
	public int userOut(HashMap<String, Object> map) throws SQLException{
		System.out.println("serviceuserOut : " + map);
		return usrDao.userOut(map);
	}
	
	
}
