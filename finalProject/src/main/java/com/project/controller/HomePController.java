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
	public ModelAndView qnaInsertView(QNADto qnaDto) {
		
		System.out.println(qnaDto);
		System.out.println("controller QNAInsertView");
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnaDto", qnaDto);
		mav.setViewName("homeP/qnaInsertView");
		
		return mav;
		
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
		System.out.println(qnaDto);
		homePService.qnaInsert(qnaDto);
		
	}
	
	/**
	 * @Method Name : qnaSelectView
	 * @작성일	    : 2017. 11. 21. 
	 * @작성자	    : 
	 * @Method 설명	:
	 * return type  : ModelAndView
	 * @return
	 */
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

	/**
	 * @Method Name : qnaUpdateView
	 * @작성일	    : 2017. 11. 21. 
	 * @작성자	    : 
	 * @Method 설명	:
	 * return type  : ModelAndView
	 * @param no
	 * @return
	 */
	@RequestMapping("/qnaUpdateView")
	public ModelAndView qnaUpdateView(@RequestParam("no") int no) {
		
		System.out.println("controller qnaUpdateView");
		System.out.println(no);
		ModelAndView mav = new ModelAndView();
		QNADto qnaDto = homePService.qnaUpdateView(no);
		System.out.println(qnaDto);
		
		mav.addObject("qnaDto", qnaDto);
		mav.setViewName("homeP/qnaUpdateView");
		
		return mav;
	}
	
	/**
	 * @Method Name : qnaUpdate
	 * @작성일	    : 2017. 11. 21. 
	 * @작성자	    : 
	 * @Method 설명	:
	 * return type  : ModelAndView
	 * @param qnaDto
	 * @return
	 */
	@RequestMapping("/qnaUpdate")
	public ModelAndView qnaUpdate(QNADto qnaDto) {
		
		ModelAndView mav = new ModelAndView();
		System.out.println("controller qnaUpdate");
		
		int result = homePService.qnaUpdate(qnaDto);
		System.out.println(result);
		mav.addObject("result", result);
		mav.setViewName("forward:/homeP/qnaSelectView");
		
		return mav;
	}
}
