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
	public void userInsert(USRDto usr) throws SQLException {
		System.out.println("service : " + usr); 		

		usrDao.userInsert(usr);
		
	}
	
	@Override
	public HashMap<String, Object> userLogin(HashMap<String, Object> map) throws SQLException{
		System.out.println("service : " + map); 
		return usrDao.userLogin(map);
	}
	
	//아이디, 비밀번호 찾기
	@Override
	public USRDto findId(HashMap<String, Object> map) throws SQLException {
		System.out.println("findId : " + map); 
		return usrDao.findId(map);
	}
	
	
	//------------------------
	
}
