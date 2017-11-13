package com.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.EMPDto;
import com.project.dto.TCHRDto;
import com.project.dto.USRDto;

@Repository
public class EmpMgDaoImp implements EmpMgDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List empSelectAll() {
		List list = sqlSession.selectList("empMgMapper.empSelectAll");
		System.out.println(list); 		// @@@
		
		return list;
	}

	@Override
	public void empInsert(EMPDto emp) {
		// TODO Auto-generated method stub
		int num = 0;
		num = sqlSession.insert("empMgMapper.empInsert", emp);
	}

	@Override
	public EMPDto empSelect(String id) {
		// TODO Auto-generated method stub
		EMPDto emp = sqlSession.selectOne("empMgMapper.empSelectOne");
		return emp;
	}

	@Override
	public USRDto usrSelect(String id) {
		// TODO Auto-generated method stub
		USRDto usr =  sqlSession.selectOne("empMgMapper.usrSelectOne");
		return usr;
	}

	@Override
	public List tchrSelectAll() {
		List list = sqlSession.selectList("empMgMapper.tchrSelectAll");
		return list;
	}

	@Override
	public void tchrInsert(TCHRDto tchr) {
		int num = 0;
		System.out.println(tchr);
		num = sqlSession.insert("empMgMapper.tchrInsert", tchr);
	}

	@Override
	public void usrUpdateToTchr(String id) {
		// TODO Auto-generated method stub
		sqlSession.update("empMgMapper.usrUpdateToTchr", id);
		
	}

	@Override
	public void usrUpdateToStaff(String id) {
		// TODO Auto-generated method stub
		sqlSession.update("empMgMapper.usrUpdateToStaff", id);
		
	}
	
}
