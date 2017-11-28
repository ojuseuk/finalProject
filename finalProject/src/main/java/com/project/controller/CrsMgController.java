package com.project.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dto.CLSSDto;
import com.project.dto.CRSDto;
import com.project.dto.EMPDto;
import com.project.dto.TCHRDto;
import com.project.dto.USRDto;
import com.project.service.CrsMgService;

import net.sf.json.JSONArray;

@Controller
public class CrsMgController {

	@Autowired
	private CrsMgService crsMgService;
	
	public void setService(CrsMgService service) {
		this.crsMgService = service;
	}
	
	@RequestMapping(value="/courseUpdate")
	public String courseUpdate(CRSDto course, Model data) {
		System.out.println("courseUpdate Controller : " + course);
		String url = "error";
		String resultMsg = "";
		try {
			resultMsg = crsMgService.courseUpdate(course);
			
			List list = crsMgService.selectAll();
			List sbjList = crsMgService.sbjtSelectAll();
			
			data.addAttribute("list", list);
			data.addAttribute("sbjtList", sbjList);
			
			JSONArray jsonList = JSONArray.fromObject(list);
			
			data.addAttribute("jsonList", jsonList);
			data.addAttribute("resultMsg", resultMsg);
			url = "course/mgCourse";
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("resultMsg : " + resultMsg);
		
		return url;
	}
	
	@RequestMapping(value="/clssUpdate")
	public String clssUpdate(CLSSDto clss, Model data) {
		System.out.println("clssUpdate Controller : " + clss);
		String url = "error";
		String resultMsg = "";
		try {
			resultMsg = crsMgService.clssUpdate(clss);
			
			List list = crsMgService.clssSelectAll();
			List sbjList = crsMgService.sbjtSelectAll();
			
			data.addAttribute("list", list);
			data.addAttribute("sbjtList", sbjList);
			
			JSONArray jsonList = JSONArray.fromObject(list);
			JSONArray jsonSbjtList = JSONArray.fromObject(sbjList);
			
			data.addAttribute("jsonList", jsonList);
			url = "course/mgClss";
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("resultMsg : " + resultMsg);
		return url;
	}
	
	@RequestMapping("/crsSelect")
	public @ResponseBody CRSDto crsSelect(@RequestParam("crsId") String crsId) {
		System.out.println("crsSelect : Cotroller : " + crsId); // @@@
		return crsMgService.crsSelect(crsId);
	}
	
	@RequestMapping("/clssSelect")
	public @ResponseBody CLSSDto clssSelect(@RequestParam("clssId") String clssId) {
		System.out.println("clssSelect : Cotroller : " + clssId); // @@@
		return crsMgService.clssSelect(clssId);
	}
	
	@RequestMapping("/crsSelectBySbjtNm")
	public @ResponseBody List<CRSDto> crsSelectBySbjtNm(@RequestParam("sbjtNm") String sbjtNm) {
		System.out.println("Cotroller : " + sbjtNm); // @@@
		return crsMgService.crsSelectBySbjtNm(sbjtNm);
	}
	
	@RequestMapping("/clssSelectByCourse")
	@PreAuthorize("hasRole('ROLE_STAFF')")
	public String clssSelectByCourse(String crsId, Model data) {
		String url = "error";
		try {
			List list = crsMgService.clssSelectByCourse(crsId);
			List sbjList = crsMgService.sbjtSelectAll();
			
			data.addAttribute("list", list);
			data.addAttribute("sbjtList", sbjList);
			
			JSONArray jsonList = JSONArray.fromObject(list);
			JSONArray jsonSbjtList = JSONArray.fromObject(sbjList);
			
			data.addAttribute("jsonList", jsonList);
			url = "course/mgClss";
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return url;
	}
	
	@RequestMapping("/mgClss")
	@PreAuthorize("hasRole('ROLE_STAFF')")
	public String clssView(Model data) {
		String url = "error";
		try {
			List list = crsMgService.clssSelectAll();
			List sbjList = crsMgService.sbjtSelectAll();
			data.addAttribute("list", list);
			data.addAttribute("sbjtList", sbjList);
			
			JSONArray jsonList = JSONArray.fromObject(list);
			JSONArray jsonSbjtList = JSONArray.fromObject(sbjList);
			
			data.addAttribute("jsonList", jsonList);

			url = "course/mgClss";
			System.out.println("clss controller list size : " + list.size());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return url;
	}
	
	@RequestMapping("/course")
	@PreAuthorize("hasRole('ROLE_STAFF')")
	public String courseView(Model data) {
		String url = "course/error";
		try {
			List list = crsMgService.selectAll();
			List sbjList = crsMgService.sbjtSelectAll();
			data.addAttribute("list", list);
			data.addAttribute("sbjtList", sbjList);
			
			JSONArray jsonList = JSONArray.fromObject(list);
			JSONArray jsonSbjtList = JSONArray.fromObject(sbjList);
			
			data.addAttribute("jsonList", jsonList);

			url = "course/mgCourse";
			System.out.println("course controller list size : " + list.size());

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
			
			List list = crsMgService.selectAll();
			List sbjList = crsMgService.sbjtSelectAll();
			data.addAttribute("list", list);
			data.addAttribute("sbjtList", sbjList);
			
			JSONArray jsonList = JSONArray.fromObject(list);
//			JSONArray jsonSbjtList = JSONArray.fromObject(sbjList);
			
			data.addAttribute("jsonList", jsonList);
			
			url ="course/mgCourse";  	

		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("OK");
		return url;
	}
		
	@RequestMapping("/clssInsert")
	public String clssInsert(CLSSDto clss, Model data) {
		String url = "error";
		System.out.println("controller : " + clss); 		// @@@

		try {
			crsMgService.clssInsert(clss);
			
			List list = crsMgService.clssSelectAll();
			List sbjList = crsMgService.sbjtSelectAll();
			data.addAttribute("list", list);
			data.addAttribute("sbjtList", sbjList);
			
			JSONArray jsonList = JSONArray.fromObject(list);
			
			data.addAttribute("jsonList", jsonList);			
			
			
			url ="course/mgClss";  	

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
