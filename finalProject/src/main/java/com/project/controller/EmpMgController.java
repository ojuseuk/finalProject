package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.project.service.EmpMgService;

@Controller
public class EmpMgController {

	@Autowired
	private EmpMgService empMgService;
	
}
