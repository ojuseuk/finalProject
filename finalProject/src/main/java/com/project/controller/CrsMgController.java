package com.project.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dto.CLSSDto;
import com.project.dto.CRSDto;
import com.project.service.CrsMgService;

@Controller
public class CrsMgController {

	@Autowired
	private CrsMgService crsMgService;
	
	public void setService(CrsMgService service) {
		this.crsMgService = service;
	}
	
	@RequestMapping("/mgClss")
	public String clssView(Model data) {
		String url = "error";
		try {
			data.addAttribute("list", crsMgService.clssSelectAll());
			data.addAttribute("sbjtList", crsMgService.sbjtSelectAll());
			data.addAttribute("courseList", crsMgService.selectAll());
			url = "course/mgClss";
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return url;
	}
	
	@RequestMapping("/clssInsert")
	public String clssInsert(CLSSDto clss, Model data) {
		String url = "error";
		System.out.println("controller : " + clss); 		// @@@
		clss.setStrtDt(clss.getStrtDt().replace("-", "")); 
		clss.setEndDt(clss.getEndDt().replace("-", "")); 
		clss.setStrtTm(clss.getStrtTm().replace(":", "") + "00"); 
		clss.setEndTm(clss.getEndTm().replace(":", "") + "00"); 
		System.out.println(clss); 								// @@@
		try {
			crsMgService.clssInsert(clss);
			data.addAttribute("list", crsMgService.clssSelectAll());
			url ="course/mgClss";  	
//			url ="redirect:course/mgCourse";  	// 비동기 처리 시

		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("OK");
		return url;
	}
	
	@RequestMapping("/course")
	public String courseView(Model data) {
		String url = "course/error";
		try {
			data.addAttribute("list", crsMgService.selectAll());
			data.addAttribute("sbjtList", crsMgService.sbjtSelectAll());
			url = "course/mgCourse";
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return url;
	}
	
	@RequestMapping("/courseInsert")
	public String courseInsert(CRSDto crs, Model data) {
		String url = "course/error";
		System.out.println("controller : " + crs); 		// @@@
		try {
			crsMgService.courseInsert(crs);
			data.addAttribute("list", crsMgService.selectAll());
			data.addAttribute("sbjtList", crsMgService.sbjtSelectAll());
			url ="course/mgCourse";  	
//			url ="redirect:course/mgCourse";  	// 비동기 처리 시

		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("OK");
		return url;
	}
	
	@RequestMapping("/courseList")
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
