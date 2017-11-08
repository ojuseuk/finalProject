package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.StdtMgDao;

@Service
public class StdtMgServiceImp implements StdtMgService {

	@Autowired
	private StdtMgDao stdtMgDao;
}
