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
		String url = "error";
		String resultMsg = "";
		List list = null;
		List sbjList = null;
		
		try {
			resultMsg = crsMgService.courseUpdate(course);
			
			list = crsMgService.selectAll();
			sbjList = crsMgService.sbjtSelectAll();
			
			data.addAttribute("list", list);
			data.addAttribute("sbjtList", sbjList);
			
			JSONArray jsonList = JSONArray.fromObject(list);
			
			data.addAttribute("jsonList", jsonList);
			data.addAttribute("resultMsg", resultMsg);
			url = "course/mgCourse";
			
		} catch (Exception e) {

			return "redirect:/error.jsp";
		}
		
		
		return url;
	}
	
	@RequestMapping(value="/clssUpdate")
	public String clssUpdate(CLSSDto clss, Model data) {
		System.out.println("clssUpdate Controller : " + clss);
		String url = "error";
		String resultMsg = "";
		try {
			resultMsg = crsMgService.clssUpdate(clss);
			url = listClss(clss, data, resultMsg, url);
		} catch (Exception e) {
			
			return "redirect:/error.jsp";
		}

		return url;
	}
	
	private String listClss(CLSSDto clss, Model data, String resultMsg, String url) throws SQLException {
		List list=null;
		List sbjList=null;
		try {
			list = crsMgService.clssSelectAll();
			sbjList = crsMgService.sbjtSelectAll();
			
			data.addAttribute("list", list);
			data.addAttribute("sbjtList", sbjList);
			
			JSONArray jsonList = JSONArray.fromObject(list);
			JSONArray jsonSbjtList = JSONArray.fromObject(sbjList);
			
			data.addAttribute("jsonList", jsonList);
			data.addAttribute("clss", clss);
			data.addAttribute("resultMsg", resultMsg);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return "redirect:/error.jsp";
		}
		
		return "course/mgClss";
		
	}

	@RequestMapping("/crsSelect")
	public @ResponseBody CRSDto crsSelect(@RequestParam("crsId") String crsId) {
		CRSDto crsDto = null;
		try {
			crsDto = crsMgService.crsSelect(crsId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
		}
		return crsDto;
	}
	
	@RequestMapping("/clssSelect")
	public @ResponseBody CLSSDto clssSelect(@RequestParam("clssId") String clssId) {
		CLSSDto clssDto = null;
		try {
			clssDto = crsMgService.clssSelect(clssId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return clssDto;
	}
	
	@RequestMapping("/crsSelectBySbjtNm")
	public @ResponseBody List<CRSDto> crsSelectBySbjtNm(@RequestParam("sbjtNm") String sbjtNm) {

		List<CRSDto> list =null;
		try {
			list = crsMgService.crsSelectBySbjtNm(sbjtNm);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
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
		} catch (Exception e) {
			return "redirect:/error.jsp";
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
		} catch (Exception e) {
			return "redirect:/error.jsp";
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

		} catch (Exception e) {
			return "redirect:/error.jsp";
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

		} catch (Exception e) {
			return "redirect:/error.jsp";
		}
		return url;
	}
		
	@RequestMapping("/clssInsert")
	public String clssInsert(CLSSDto clss, Model data) {
		String url = "error";

		try {
			crsMgService.clssInsert(clss);
			
			List list = crsMgService.clssSelectAll();
			List sbjList = crsMgService.sbjtSelectAll();
			data.addAttribute("list", list);
			data.addAttribute("sbjtList", sbjList);
			
			JSONArray jsonList = JSONArray.fromObject(list);
			
			data.addAttribute("jsonList", jsonList);			
			
			
			url ="course/mgClss";  	

		} catch (Exception e) {
			return "redirect:/error.jsp";
		}
		return url;
	}
	

	@RequestMapping("/courseList")
	public String courseList(Model data) {
		String url = "course/error";
		try {
			data.addAttribute("list", crsMgService.selectAll());
			url = "course/listCourse";
		} catch (Exception e) {
			return "redirect:/error.jsp";
		}
		return url;
	}
	
}
