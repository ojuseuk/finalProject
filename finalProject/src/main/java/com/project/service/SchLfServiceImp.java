package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.SchLfDao;

@Service
public class SchLfServiceImp implements SchLfService{

	@Autowired
	private SchLfDao schLfDao;

}
