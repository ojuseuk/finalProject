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
		return empMgDao.empSelectAll();
	}

	@Override
	public void empInsert(EMPDto emp) throws SQLException {
		empMgDao.empInsert(emp);
		empMgDao.usrUpdateToStaff(emp.getId());
	}

	@Override
	public List tchrSelectAll() throws SQLException {
		return empMgDao.tchrSelectAll();
	}

	@Override
	public void tchrInsert(TCHRDto tchr) throws SQLException {
		EMPDto emp = null;
		emp = empSelect(tchr.getEmpNo());
		if(emp == null) {					// DB에 emp가 존재하지 않는 경우
			emp = new EMPDto(tchr.getEmpNo(), tchr.getId(), tchr.getSlr());
			empInsert(emp);
		}
		empMgDao.tchrInsert(tchr);
		empMgDao.usrUpdateToTchr(tchr.getId());
	}

	@Override
	public EMPDto empSelect(String empNo) {
		EMPDto emp = empMgDao.empSelect(empNo);
		if(emp != null) {
			if(emp.getRetiredDt() != null) {
				emp.setRetiredDt(emp.getRetiredDt().substring(0, 4) + "-" + emp.getRetiredDt().substring(4, 6) + "-" + emp.getRetiredDt().substring(6, 8));
			}
		}
		return emp;
	}

	@Override
	public int empUpdate(EMPDto emp) {
		
		return empMgDao.empUpdate(emp);
	}

	@Override
	public int empRetire(EMPDto emp) {
		return empMgDao.empRetire(emp);
	}

	@Override
	public TCHRDto tchrSelect(String tchrNo) {
		// TODO Auto-generated method stub
		return empMgDao.tchrSelect(tchrNo);
	}

	@Override
	public int tchrUpdate(TCHRDto tchr) {
		// TODO Auto-generated method stub
		return empMgDao.tchrUpdate(tchr);
	}
}
