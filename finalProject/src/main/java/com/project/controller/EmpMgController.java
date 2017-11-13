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
	
	
	
	//Controller
	@RequestMapping(value= "/usrSearch.do", method=RequestMethod.GET)
	public void AjaxView(@RequestParam("id") String id, HttpServletResponse response)  {
	    ObjectMapper mapper = new ObjectMapper();

	    USRDto usr = empMgDao.usrSelect(id);
//	    EMPDto emp = dao.getPerson(id);
	    try {
	    	System.out.println(mapper.writeValueAsString(usr)); 		// @@@
	        response.getWriter().print(mapper.writeValueAsString(usr));
	    } catch (IOException e) {
	        e.printStackTrace();
	    }   
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
	

	@RequestMapping("/empInsert.do")
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
	
	@RequestMapping("/tchrInsert.do")
	public String tchrInsert(TCHRDto tchr, Model data) {
		String url = "error";
		try {
			empMgService.tchrInsert(tchr);
			data.addAttribute("list", empMgService.tchrSelectAll());
			url ="tchr/mgTchr";  	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("OK");
		return url;
	}
	
	
} // end of class
