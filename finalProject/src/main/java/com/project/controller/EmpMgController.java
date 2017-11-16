package com.project.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.dao.EmpMgDao;
import com.project.dto.CLSSDto;
import com.project.dto.EMPDto;
import com.project.dto.TCHRDto;
import com.project.dto.USRDto;
import com.project.service.CrsMgService;
import com.project.service.EmpMgService;

@Controller
public class EmpMgController {

	@Autowired
	private EmpMgService empMgService;
	@Autowired	
	private EmpMgDao empMgDao;
	@Autowired
	private CrsMgService crsMgService;
	

	@RequestMapping("/mgTchr")
	public String tchrView(Model data) {
		String url = "error";
		try {
			data.addAttribute("list", empMgService.tchrSelectAll());
			data.addAttribute("sbjtList", crsMgService.sbjtSelectAll());
			url = "tchr/mgTchr";
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return url;
	}
	
	@RequestMapping("/usrSearch")
	public @ResponseBody USRDto usrSelect(@RequestParam("id") String id) {
		return empMgDao.usrSelect(id);
	}
	
	@RequestMapping("/empSearchById")
	public @ResponseBody EMPDto empSelectById(@RequestParam("id") String id) {
		return empMgDao.empSelectById(id);
	}
	
	@RequestMapping("/tchrSearchById")
	public @ResponseBody TCHRDto tchrSelectById(@RequestParam("id") String id) {
		return empMgDao.tchrSelectById(id);
	}
	
	@RequestMapping("/empSelect")
	public @ResponseBody EMPDto empSelect(@RequestParam("empNo") String empNo) {
		return empMgService.empSelect(empNo);
	}
					 
	@RequestMapping("/tchrSelect")
	public @ResponseBody TCHRDto tchrSelect(@RequestParam("tchrNo") String tchrNo) {
		
		TCHRDto tchr = empMgService.tchrSelect(tchrNo);
		System.out.println(tchr);
		return tchr;
	}
	
	@RequestMapping("/emp")
	public String empView(Model data) {
		String url = "error";
		try {
			data.addAttribute("list", empMgService.empSelectAll());
//			data.addAttribute("usrList", homepService.sbjtSelectAll());
			url = "emp/mgEmp";
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return url;
	}
	

	@RequestMapping("/empInsert")
	public String empInsert(EMPDto emp, Model data) {
		String url = "error";
		if(emp.getRetiredDt() != null) {
			emp.setRetiredDt(emp.getRetiredDt().replace("-", ""));
		}
		try {
			empMgService.empInsert(emp);
			data.addAttribute("list", empMgService.empSelectAll());
			url ="emp/mgEmp";  	

		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("OK");
		return url;
	}
											   
	@RequestMapping(value="/empUpdate")
	public String empUpdate(EMPDto emp, Model data) {
		System.out.println("/empUpdate update Controller : " + emp);
		String url = "error";
		if(emp.getRetiredDt() != null) {
			emp.setRetiredDt(emp.getRetiredDt().replace("-", ""));
		}
		try {
			empMgService.empUpdate(emp);
			data.addAttribute("list", empMgService.empSelectAll());
			url ="emp/mgEmp";  	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("OK");
		return url;
	}
	
	@RequestMapping(value="/tchrUpdate")
	public String tchrUpdate(TCHRDto tchr, Model data) {
		System.out.println("tchrUpdate Controller : " + tchr);
		String url = "error";
		try {
			empMgService.tchrUpdate(tchr);
			data.addAttribute("list", empMgService.tchrSelectAll());
			url ="emp/mgTchr";  	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("tchrUpdate OK");
		return url;
	}
	
	@RequestMapping(value="/empRetire")
	public String empRetire(EMPDto emp, Model data) {
		System.out.println("update"); // @@@
		System.out.println("Controller : " + emp); // @@@
		String url = "error";
		if(emp.getRetiredDt() != null) {
			emp.setRetiredDt(emp.getRetiredDt().replace("-", ""));
		}
		try {
			empMgService.empRetire(emp);
			data.addAttribute("list", empMgService.empSelectAll());
			url ="emp/mgEmp";  	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("OK");
		return url;
	}
	
	@RequestMapping("/tchrInsert.do")
	public String tchrInsert(TCHRDto tchr, Model data) {
		String url = "error";
		try {
			empMgService.tchrInsert(tchr);
			data.addAttribute("list", empMgService.tchrSelectAll());
			data.addAttribute("sbjtList", crsMgService.sbjtSelectAll());
			url ="tchr/mgTchr";  	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("OK");
		return url;
	}
	
	
} // end of class
