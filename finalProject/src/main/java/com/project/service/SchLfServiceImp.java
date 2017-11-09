package com.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.SchLfDao;
import com.project.dto.STDTDto;

@Service
public class SchLfServiceImp implements SchLfService{

	@Autowired
	private SchLfDao schLfDao;

	@Override
	public Map<String, STDTDto> selectByAttnd() {
		return schLfDao.selectByAttnd();
	}

	@Override
	public List<String> selectBySTDT() {
		return schLfDao.selectBySTDT();
	}
	
}
