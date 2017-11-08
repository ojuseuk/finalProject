package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.CrsMgDao;

@Service
public class CrsMgServiceImp implements CrsMgService {

	@Autowired
	private CrsMgDao crsMgDao;
	
}
