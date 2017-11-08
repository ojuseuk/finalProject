package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.project.service.SaleMgService;

@Controller
public class SaleMgController {

	@Autowired
	private SaleMgService saleMgService;
	
}
