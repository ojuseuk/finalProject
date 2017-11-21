package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.dto.QNADto;
import com.project.service.HomePService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/homeP")
public class HomePController {

	@Autowired
	private HomePService homePService;
	
	/**
	 * @Method Name : qNAInsertView
	 * @작성일	    : 2017. 11. 21. 
	 * @작성자	    : 오주석
	 * @Method 설명	:
	 * return type  : String
	 * @return
	 */
	@RequestMapping("/qnaInsertView")
	public String qnaInsertView() {
		
		System.out.println("controller QNAInsertView");

		return "homeP/qnaInsertView";
		
	}
	
	/**
	 * @Method Name : qNAInsert
	 * @작성일	    : 2017. 11. 21. 
	 * @작성자	    : 오주석
	 * @Method 설명	:
	 * return type  : void
	 */
	@RequestMapping("/qnaInsert")
	public void qnaInsert(QNADto qnaDto) {
		
		System.out.println("controller QNAInsert");
		
		homePService.qnaInsert(qnaDto);
		
	}
	
	@RequestMapping("/qnaSelectView")
	public ModelAndView qnaSelectView() {
		
		ModelAndView mav = new ModelAndView();
		System.out.println("controller qnaSelectView");
		
		List<QNADto> list = homePService.qnaSelectView();
		JSONArray jsonArray = JSONArray.fromObject(list);
		mav.addObject("list", list);
		mav.addObject("json", jsonArray);
		
		mav.setViewName("homeP/qnaSelectView");
		
		return mav;
	}
	
	public void qnaRead() {
		
		System.out.println("controller qnaRead");
		
//		homePService.qnaRead();
	}
}
