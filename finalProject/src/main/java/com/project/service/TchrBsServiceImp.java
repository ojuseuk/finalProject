package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.TchrBsDao;

@Service
public class TchrBsServiceImp implements TchrBsService {

	@Autowired
	private TchrBsDao tchrBsDao;
	
}
