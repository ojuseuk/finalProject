package com.project.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dto.CRSDto;
import com.project.dto.USRDto;
import com.project.service.CrsMgService;
import com.project.service.UsrService;

@Controller
public class UsrController {

	@Autowired
	private UsrService usrService;
	
	public void setService(UsrService service) {
		this.usrService = service;
	}
	
	
	@RequestMapping("/userInsert.do")
	public String userInsert(USRDto usr, Model data) {
		String url = "user/error";
		System.out.println("controller : " + usr); 		
		try {
			usrService.userInsert(usr);
			System.out.println("insert");
			System.out.println(data);
			url ="main2.jsp";  	


		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("OK");
		return url;
	}

}
