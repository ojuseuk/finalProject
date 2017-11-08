package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.SchLfDao;

@Service
public class SchLfServiceImp implements SchLfService{

	@Autowired
	private SchLfDao schLfDao;

	@Override
	public List<String> selectByAttnd() {
		return schLfDao.selectByAttnd();
	}
	
}
