package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.EmpMgDao;

@Service
public class EmpMgServiceImp implements EmpMgService {

	@Autowired
	private EmpMgDao empMgDao;
}
