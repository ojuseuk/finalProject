package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.HomePDao;

@Service
public class HomePServiceImp implements HomePService {
	
	@Autowired
	private HomePDao homePDao;
	
}
