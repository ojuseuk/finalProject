package com.project.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.EmpMgDao;
import com.project.dto.EMPDto;
import com.project.dto.TCHRDto;

@Service
public class EmpMgServiceImp implements EmpMgService {

	@Autowired
	private EmpMgDao empMgDao;

	@Override
	public List empSelectAll() throws SQLException {
		// TODO Auto-generated method stub
		return empMgDao.empSelectAll();
	}

	@Override
	public void empInsert(EMPDto emp) throws SQLException {
		// TODO Auto-generated method stub
		empMgDao.empInsert(emp);
		empMgDao.usrUpdateToStaff(emp.getId());
		
	}

	@Override
	public List tchrSelectAll() throws SQLException {
		// TODO Auto-generated method stub
		return empMgDao.tchrSelectAll();
	}

	@Override
	public void tchrInsert(TCHRDto tchr) {
		// TODO Auto-generated method stub
		empMgDao.tchrInsert(tchr);
		empMgDao.usrUpdateToTchr(tchr.getId());
	}
}
