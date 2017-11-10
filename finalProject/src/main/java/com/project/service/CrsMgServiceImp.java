package com.project.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.CrsMgDao;
import com.project.dto.CRSDto;

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
	
}
