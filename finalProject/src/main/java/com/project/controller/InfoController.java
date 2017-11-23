package com.project.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;




@Controller
public class InfoController {

	
	
	//go info.jsp
	@RequestMapping(value="info")
	public String idpwfind(HttpSession session) {
		return "info/info";
	}
	
	//go notice.jsp
		@RequestMapping(value="notice")
		public String notice(HttpSession session) {
			return "info/notice";
		}
	
	
}//end controller 











