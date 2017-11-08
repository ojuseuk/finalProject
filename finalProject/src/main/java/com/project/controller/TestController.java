package com.project.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dto.TestDto;
import com.project.service.TestService;

import jdk.nashorn.api.scripting.JSObject;

@Controller
public class TestController {

	@Autowired
	private TestService testService;
	
	@RequestMapping("/test")
	public String testView(TestDto testDto) {
	
		System.out.println("controller");
		int a = testService.test(testDto);
		System.out.println(a);
		return "test/testS";
	}
}
