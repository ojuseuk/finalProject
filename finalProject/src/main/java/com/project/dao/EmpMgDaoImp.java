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
		return list;
	}

	@Override
	public void empInsert(EMPDto emp) {
		// TODO Auto-generated method stub
		int num = 0;
		num = sqlSession.insert("empMgMapper.empInsert", emp);
	}

	@Override
	public EMPDto empSelect(String empNo) {
		// TODO Auto-generated method stub
		EMPDto emp = sqlSession.selectOne("empMgMapper.empSelectOne", empNo);
		return emp;
	}

	@Override
	public EMPDto empSelectById(String id) {
		// TODO Auto-generated method stub
		EMPDto emp =  sqlSession.selectOne("empMgMapper.empSelectById",id);
		return emp;
	}
	
	@Override
	public USRDto usrSelect(String id) {
		// TODO Auto-generated method stub
		USRDto usr =  sqlSession.selectOne("empMgMapper.usrSelectOne",id);
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

	@Override
	public int empUpdate(EMPDto emp) {
		// TODO Auto-generated method stub
		System.out.println("DAO Update : " + emp);
		return sqlSession.update("empMgMapper.empUpdate", emp);
	}

	@Override
	public int empRetire(EMPDto emp) {
		// TODO Auto-generated method stub
		return sqlSession.update("empMgMapper.empRetire", emp);
	}

	@Override
	public TCHRDto tchrSelectById(String id) {
		// TODO Auto-generated method stub
		TCHRDto tchr =  sqlSession.selectOne("empMgMapper.tchrSelectById",id);
		return tchr;
	}

	@Override
	public TCHRDto tchrSelect(String tchrNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("empMgMapper.tchrSelect",tchrNo);
	}

	@Override
	public int tchrUpdate(TCHRDto tchr) {
		// TODO Auto-generated method stub
		System.out.println("DAO update 전 : " + tchr);
		return sqlSession.update("empMgMapper.tchrUpdate", tchr);
	}

	
}
