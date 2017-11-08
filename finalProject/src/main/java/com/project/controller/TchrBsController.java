package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.project.service.TchrBsService;

@Controller
public class TchrBsController {

	@Autowired
	private TchrBsService tchrBsService;
	
}
