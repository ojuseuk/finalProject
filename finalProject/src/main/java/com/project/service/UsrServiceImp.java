package com.project.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.project.dao.UsrDao;
import com.project.dto.USRDto;

import util.Constants;

@Service
public class UsrServiceImp implements UsrService {

	@Autowired
	private UsrDao usrDao;
	
	public void setDao(UsrDao dao) {
		this.usrDao = dao;
	}

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public int userInsert(USRDto usr) throws Exception {

		String encodePass = passwordEncoder.encode(usr.getPw());
		usr.setPws(encodePass);
		
		usr.setUsrTp(Constants.ROLE_USR);
		
		return usrDao.userInsert(usr);
		
	}
	
	@Override
	public USRDto userLogin(HashMap<String, Object> map) throws Exception{
		
		USRDto usrDto = usrDao.userLogin(map);
		
		return usrDto;
	}
	
	//아이디, 비밀번호 찾기
	@Override
	public USRDto findId(HashMap<String, Object> map) throws Exception {
		return usrDao.findId(map);
	}
	
	@Override
	public USRDto findPwd(HashMap<String, Object> map) throws Exception {
		return usrDao.findPwd(map);
	}
	//------------------------
	
	//idChect pwdCheck
	@Override
	public USRDto idCheck(String id) throws Exception{
		return usrDao.idCheck(id);
	}
	@Override
	public USRDto pwdCheck(HashMap<String, String> map) throws Exception{
		return usrDao.pwdCheck(map);
	}
	
	
	//--------------------
	
	//after id check change pwd
	@Override
	public int changePwdNew(HashMap<String, String> map) throws Exception{
		
		String encodePass = passwordEncoder.encode(map.get("pw"));
		map.put("pws", encodePass);
		
		return usrDao.changePwdNew(map);
	}
	
	
	//userOut
	@Override
	public int userOut(HashMap<String, Object> map) throws Exception{
		return usrDao.userOut(map);
	}

	@Override
	public USRDto confirmUsr(USRDto usr) throws Exception {
		return usrDao.confirmUsr(usr);
	}

	@Override
	public Boolean updateUsr(USRDto usr) throws Exception {
		
		String encodePass = passwordEncoder.encode(usr.getPw());
		usr.setPws(encodePass);
		
		return usrDao.updateUsr(usr);
	}
	
	
}
