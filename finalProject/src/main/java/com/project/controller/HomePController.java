package com.project.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.dto.QNADto;
import com.project.dto.USRDto;
import com.project.service.HomePService;

import net.sf.json.JSONArray;

@Controller
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
	@RequestMapping("/homeP/qnaInsertView")
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
	@RequestMapping("/homeP/qnaInsert")
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
	@RequestMapping("/homeP/qnaSelectView")
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
	@RequestMapping("/homeP/qnaUpdateView")
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
	@RequestMapping("/homeP/qnaUpdate")
	public ModelAndView qnaUpdate(QNADto qnaDto) {
		
		ModelAndView mav = new ModelAndView();
		System.out.println("controller qnaUpdate");
		
		int result = homePService.qnaUpdate(qnaDto);
		System.out.println(result);
		mav.addObject("result", result);
		mav.setViewName("forward:/homeP/qnaSelectView");
		
		return mav;
	}
	
	@RequestMapping("/tchr/main")
	@PreAuthorize("hasRole('ROLE_TCHR')")
	public String tchr(Authentication auth, Model model) {
		
		System.out.println(auth);
		model.addAttribute("auth", auth);
		
		return "user/main_tchr";
	}
	
	@RequestMapping("/staff/main")
	@PreAuthorize("hasRole('ROLE_STAFF')")
	public String staff(Authentication auth, Model model) {
		System.out.println("usr");
		model.addAttribute("auth", auth);
		
		return "user/main_staff";
	}
	
	
	@RequestMapping("/usr/main")
	@PreAuthorize("hasAnyRole('ROLE_ST', 'ROLE_USR')")
	public String usr(Authentication auth, Model model, RedirectAttributes redirectAttributes) {
		System.out.println("usr");
		model.addAttribute("auth", auth);
		
		return "redirect:/main.jsp";
	}
	
	@RequestMapping("/main")
	public String main(HttpSession session, Authentication auth, Locale locale, Model model) {
		
		USRDto usrDto = (USRDto) auth.getPrincipal();
		System.out.println(usrDto);
		String url = "forward:/usr/main";
		
		if (usrDto.getUsrTp().equals("staff")) {
			System.out.println("직원");
			model.addAttribute("auth", auth);
			
			url = "forward:/staff/main";
		} else if (usrDto.getUsrTp().equals("st")) {
			System.out.println("학생");
			model.addAttribute("auth", auth);
			
		} else if (usrDto.getUsrTp().equals("tchr")) {
			System.out.println("강사");

			model.addAttribute("auth", auth);
			url ="forward:/tchr/main";

		} else {
			System.out.println("사용자");
			
		}
		return url;
	}
}
