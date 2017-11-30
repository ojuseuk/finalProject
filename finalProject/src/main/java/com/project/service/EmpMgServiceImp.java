package com.project.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.EmpMgDao;
import com.project.dto.EMPDto;
import com.project.dto.TCHRASSNDto;
import com.project.dto.TCHRDto;

import util.DateTimeUtil;

@Service
public class EmpMgServiceImp implements EmpMgService {

	@Autowired
	private EmpMgDao empMgDao;

	@Override
	public List empSelectAll() throws Exception {
		return empMgDao.empSelectAll();
	}

	@Override
	public String empInsert(EMPDto emp) throws Exception {
		String resultMsg = "";
		resultMsg = empMgDao.empInsert(emp);
		resultMsg = resultMsg + " " + empMgDao.usrUpdateToStaff(emp.getId());
		return resultMsg;
	}

	@Override
	public List tchrSelectAll() throws Exception {
		return empMgDao.tchrSelectAll();
	}

	@Override
	public String tchrInsert(TCHRDto tchr) throws Exception {
		EMPDto emp = null;
		String resultMsg = "";
		emp = empSelect(tchr.getEmpNo());
		if(emp == null) {					// DB에 emp가 존재하지 않는 경우
			emp = new EMPDto(tchr.getEmpNo(), tchr.getId(), tchr.getSlr());
			empInsert(emp);
		}
		resultMsg = empMgDao.tchrInsert(tchr);
		resultMsg = resultMsg + " " + empMgDao.usrUpdateToTchr(tchr.getId());
		return resultMsg;
	}

	@Override
	public EMPDto empSelect(String empNo) throws Exception {
		EMPDto emp = empMgDao.empSelect(empNo);
		if(emp != null) {
			if(emp.getRetiredDt() != null) {
				emp.setRetiredDt(DateTimeUtil.dateForm(emp.getRetiredDt()));
			}
		}
		return emp;
	}

	@Override
	public String empUpdate(EMPDto emp) throws Exception {
		String resultMsg = "";
		if(emp.getRetiredDt() != null) {
			emp.setRetiredDt(emp.getRetiredDt().replace("-", ""));
		}
		if(emp.getSlr() != null) {
			emp.setSlr(emp.getSlr().replace(",", "")); 		// DataTable에서 추가된 "," 제거
		}
		resultMsg = empMgDao.empUpdate(emp);
		if(!emp.getRetiredDt().equals("") && emp.getRetiredDt() != null) { 			// 날짜처럼 보이기 위해 '-' 삽입
//			퇴직 일자 있음
			emp.setRetiredDt(DateTimeUtil.dateForm(emp.getRetiredDt()));
		}
		return resultMsg;
	}

	@Override
	public String empRetire(EMPDto emp) throws Exception {
		String resultMsg = "";
		if(emp.getRetiredDt() != null) {
			emp.setRetiredDt(emp.getRetiredDt().replace("-", ""));
		}
		if(emp.getSlr() != null) {
			emp.setSlr(emp.getSlr().replace(",", "")); 		// DataTable에서 추가된 "," 제거
		}
		resultMsg = empMgDao.empRetire(emp);
		if(!emp.getRetiredDt().equals("")) { 			// 날짜처럼 보이기 위해 '-' 삽입
			emp.setRetiredDt(DateTimeUtil.dateForm(emp.getRetiredDt()));
		}
		return resultMsg;
	}

	@Override
	public TCHRDto tchrSelect(String tchrNo) throws Exception {
		return empMgDao.tchrSelect(tchrNo);
	}

	@Override
	public String tchrUpdate(TCHRDto tchr) throws Exception {
		return empMgDao.tchrUpdate(tchr);
	}

	@Override
	public List tchrSelectBySbjtNm(String sbjtNm) throws Exception {
		return empMgDao.tchrSelectBySbjtNm(sbjtNm);
	}

	@Override
	public String assnTchr(TCHRASSNDto tchrAssn) throws Exception {
		return empMgDao.assnTchr(tchrAssn);
		
	}

	@Override
	public List tchrAssnSelect(String clssId) throws Exception {
		// TODO Auto-generated method stub
		return empMgDao.tchrAssnSelect(clssId);
	}
}
