package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.SaleMgDao;

@Service
public class SaleMgServiceImp implements SaleMgService {

	@Autowired
	private SaleMgDao saleMgDao;
}
