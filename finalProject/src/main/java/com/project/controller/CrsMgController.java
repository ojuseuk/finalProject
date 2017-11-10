package com.project.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dto.CRSDto;
import com.project.service.CrsMgService;

@Controller
public class CrsMgController {

	@Autowired
	private CrsMgService crsMgService;
	
	public void setService(CrsMgService service) {
		this.crsMgService = service;
	}
	
	@RequestMapping("/course")
//	public String courseView() {
//		return "course/mgCourse";
//	}
	
	public String courseView(Model data) {
		String url = "course/error";
		try {
			data.addAttribute("list", crsMgService.selectAll());
			url = "course/mgCourse";
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return url;
	}
	
	@RequestMapping("/courseInsert.do")
	public String courseInsert(CRSDto crs, Model data) {
		String url = "course/error";
		System.out.println("controller : " + crs); 		// @@@
		try {
			crsMgService.courseInsert(crs);
			data.addAttribute("list", crsMgService.selectAll());
			System.out.println("inser 후 select");
			System.out.println(data);
			url ="course/mgCourse";  	
//			url ="redirect:course/mgCourse";  	// 비동기 처리 시

		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("OK");
		return url;
	}
	
	@RequestMapping("courseList.do")
	public String courseList(Model data) {
		String url = "course/error";
		try {
			data.addAttribute("list", crsMgService.selectAll());
			url = "course/listCourse";
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return url;
	}
	
}
