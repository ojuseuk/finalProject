package com.project.dao;

import java.util.HashMap;

import com.project.dto.USRDto;

public interface UsrDao {
	int userInsert(USRDto usr) throws Exception;
	USRDto userLogin(HashMap<String,Object> map) throws Exception;
	USRDto findId(HashMap<String, Object> map)throws Exception;
	USRDto findPwd(HashMap<String, Object> map)throws Exception;
	USRDto idCheck(String id)throws Exception;
	USRDto pwdCheck(HashMap<String, String> map)throws Exception;
	//after id check change pwd
	int changePwdNew(HashMap<String, String> map)throws Exception;
	//delete user
/*	USRDto delUser(HashMap<String, Object> map)throws Exception;
	*/
	
	//스프링 보안 적용 로그인
	USRDto userLoginId(String id) throws Exception;
	//userOut
	int userOut(HashMap<String, Object> map)throws Exception;
	
	public USRDto confirmUsr(USRDto usr) throws Exception;
	
	public Boolean updateUsr(USRDto usr) throws Exception;
}
