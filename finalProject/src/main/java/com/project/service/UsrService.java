package com.project.service;

import java.util.HashMap;

import com.project.dto.USRDto;

public interface UsrService {
	
	public int userInsert(USRDto usr) throws Exception;
	public USRDto userLogin(HashMap<String,Object> map) throws Exception;
	
	//findId
	public USRDto findId(HashMap<String, Object> map) throws Exception;
	
	//findPwd
	public USRDto findPwd(HashMap<String, Object> map) throws Exception;
		
	//idCheck
	public USRDto idCheck(String id) throws Exception;
	
	//pwdCheck
	public USRDto pwdCheck(HashMap<String, String> map) throws Exception;
	
	//after id check change pwd
	public int changePwdNew(HashMap<String, String> map) throws Exception;
	//userOut
	public int userOut(HashMap<String, Object> map) throws Exception;
	
	public USRDto confirmUsr(USRDto usr) throws Exception;
	
	public Boolean updateUsr(USRDto usr) throws Exception; 
		
}
