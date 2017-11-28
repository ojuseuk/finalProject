package com.project.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class DownloadController implements ApplicationContextAware {

	private WebApplicationContext context = null;

	
	@RequestMapping("/downloadFile")
	public ModelAndView downloadFile(@RequestParam("attch") String attch, HttpSession session) {
		
		
		System.out.println("controller downloadFile");
		System.out.println(attch);
		File file = new File(session.getServletContext().getRealPath("/") + "ntc\\ntcFile\\" + attch); 

		if(!file.canRead()) {
			System.out.println("파일을 찾을수 없다");
		}
		System.out.println(session.getServletContext().getRealPath("/") + "ntc\\ntcFile\\" + attch);
		return new ModelAndView("download", "downloadFile", file);
		
	}
	
	@Override
	public void setApplicationContext(ApplicationContext arg0) throws BeansException {
		// TODO Auto-generated method stub

		this.context = (WebApplicationContext)arg0;

	}

}
