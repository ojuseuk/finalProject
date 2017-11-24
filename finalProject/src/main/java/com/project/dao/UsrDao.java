package com.project.dao;

import java.sql.SQLException;
import java.util.HashMap;

import com.project.dto.USRDto;

public interface UsrDao {
	int userInsert(USRDto usr) throws SQLException;
	USRDto userLogin(HashMap<String,Object> map) throws SQLException;
	USRDto findId(HashMap<String, Object> map)throws SQLException;
	USRDto findPwd(HashMap<String, Object> map)throws SQLException;
	USRDto idCheck(String id)throws SQLException;
	USRDto pwdCheck(HashMap<String, String> map)throws SQLException;
	//after id check change pwd
	int changePwdNew(HashMap<String, Object> map)throws SQLException;
	//delete user
/*	USRDto delUser(HashMap<String, Object> map)throws SQLException;
	*/
}
