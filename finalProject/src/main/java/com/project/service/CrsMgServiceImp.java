package com.project.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.CrsMgDao;
import com.project.dto.CLSSDto;
import com.project.dto.CRSDto;
import com.project.dto.TCHRDto;

import util.DateTimeUtil;

@Service
public class CrsMgServiceImp implements CrsMgService {

	@Autowired
	private CrsMgDao crsMgDao;
	
	public void setDao(CrsMgDao dao) {
		this.crsMgDao = dao;
	}

	@Override
	public void courseInsert(CRSDto crs) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("service : " + crs); 		// @@@

		crsMgDao.courseInsert(crs);
		
	}

	@Override
	public List selectAll() throws SQLException {
		// TODO Auto-generated method stub
		return crsMgDao.courseSelectAll();
		 
	}

	@Override
	public List clssSelectAll() throws SQLException {
		// TODO Auto-generated method stub
		return crsMgDao.clssSelectAll();
	}

	@Override
	public void clssInsert(CLSSDto clss) throws SQLException {
		// TODO Auto-generated method stub
		// DB에 넣기 위해 날짜, 시각 형식을 순수 문자열로 변환
		clss.setStrtDt(clss.getStrtDt().replace("-", "")); 
		clss.setEndDt(clss.getEndDt().replace("-", "")); 
		clss.setStrtTm(clss.getStrtTm().replace(":", "") + "00"); 
		clss.setEndTm(clss.getEndTm().replace(":", "") + "00"); 
		System.out.println("Service : " + clss); 								// @@@
		crsMgDao.clssInsert(clss);
		
	}

	@Override
	public List sbjtSelectAll() throws SQLException {
		// TODO Auto-generated method stub
		return crsMgDao.sbjtSelectAll();
	}

	@Override
	public List crsSelectBySbjtNm(String sbjtNm) {
		// TODO Auto-generated method stub
		return crsMgDao.crsSelectBySbjtNm(sbjtNm);
	}

	@Override
	public CLSSDto clssSelect(String clssId) {
		// TODO Auto-generated method stub
		System.out.println("Service : " + clssId);
		CLSSDto clss = crsMgDao.clssSelect(clssId);
		if(clss != null) {
			if(!clss.getStrtDt().equals("")) {
				clss.setStrtDt(DateTimeUtil.dateForm(clss.getStrtDt()));
			}
			if(!clss.getEndDt().equals("")) {
				clss.setEndDt(DateTimeUtil.dateForm(clss.getEndDt()));
			}
			if(!clss.getStrtTm().equals("")) {
				clss.setStrtTm(DateTimeUtil.timeForm(clss.getStrtTm()));
			}
			if(!clss.getEndTm().equals("")) {
				clss.setEndTm(DateTimeUtil.timeForm(clss.getEndTm()));
			}
			
		}
		System.out.println("Service : " + clss);
		
		return clss;
	}

	@Override
	public List clssSelectByCourse(String crsId) {
		// TODO Auto-generated method stub
		return crsMgDao.clssSelectByCourse(crsId);
	}

	@Override
	public CRSDto crsSelect(String crsId) {
		// TODO Auto-generated method stub
		return crsMgDao.crsSelect(crsId);
	}

	@Override
	public String clssUpdate(CLSSDto clss) {
		// TODO Auto-generated method stub
		// DB에 넣기 위해 날짜, 시각 형식을 순수 문자열로 변환
		clss.setStrtDt(clss.getStrtDt().replace("-", "")); 
		clss.setEndDt(clss.getEndDt().replace("-", "")); 
		clss.setStrtTm(clss.getStrtTm().replace(":", "") + "00"); 
		clss.setEndTm(clss.getEndTm().replace(":", "") + "00"); 
		return crsMgDao.clssUpdate(clss);
	}
	
}
