package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.project.service.CrsMgService;

@Controller
public class CrsMgController {

	@Autowired
	private CrsMgService crsMgService;
	
}
