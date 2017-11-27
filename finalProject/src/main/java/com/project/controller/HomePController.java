package com.project.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.dto.NTCDto;
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
	
	/**
	 * @Method Name : ntcInsertView
	 * @작성일	    : 2017. 11. 27. 
	 * @작성자	    : 오주석
	 * @Method 설명	: 직원이 공지사항을 추가하기 위한 화면으로 이동하는 함수
	 * return type  : String
	 * @return
	 */
	@RequestMapping("/ntcInsertView")
	public String ntcInsertView(Authentication auth, Model data) {
		
		System.out.println("controller ntcInsertView");
		data.addAttribute("auth", auth);
		
		return "homeP/ntcInsertView";
	}
	
	/**
	 * @Method Name : ntcInsert
	 * @작성일	    : 2017. 11. 27. 
	 * @작성자	    : 오주석
	 * @Method 설명	: 공지사항을 DB에 추가하기 위한 함수
	 * return type  : void
	 * @param auth
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping(value="/ntcInsert", method=RequestMethod.POST, headers = ("content-type=multipart/*"))
	public void ntcInsert(Authentication auth, @ModelAttribute NTCDto ntcDto, HttpSession session, @RequestParam("ntcFile") MultipartFile attchFile) throws IllegalStateException, IOException {
		
		System.out.println("controller ntcInsert");
		
		USRDto usrDto = (USRDto) auth.getPrincipal();
		
//		String empNo = empMgService.ntcTchr(usrDto.getId());
//		System.out.println(empNo);
		
		if(!attchFile.isEmpty()) {
			String path = session.getServletContext().getRealPath("/") + "ntc\\ntcFile\\";
			System.out.println(path);
			File targetDir = new File(path);
			if(!targetDir.exists()) {
				targetDir.mkdirs();
			}
			System.out.println("imgFile.getOriginalFilename() : " + attchFile.getOriginalFilename()); 
			System.out.println("imgFile.getName() : " + attchFile.getName()); 
			System.out.println("imgFile.getContentType() : " + attchFile.getContentType()); 
			
			String ext[] = attchFile.getOriginalFilename().split("\\.");
			
			
//			파일명을 "강사번호.확장자"로 변경
			System.out.println("ext[0] : " + ext[0]); 		// @@@
			System.out.println("ext[1] : " + ext[1]); 		// @@@
			
			Date date = new Date();
			DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
			File file = new File(path + ext[0] + dateFormat.format(date) + "." + ext[1]);
			
			attchFile.transferTo(file);
			
			System.out.println("file.getName() : " + file.getName()); 
			System.out.println("file.getAbsoluteFile() : " + file.getAbsoluteFile()); 
			
			ntcDto.setAttchFile(file.getName());
			System.out.println("■path:::" + path);

		}
		
		int result = homePService.ntcInsert(usrDto.getId(), ntcDto);
		
	}
	
	/**
	 * @Method Name : ntcList
	 * @작성일	    : 2017. 11. 27. 
	 * @작성자	    : 오주석 
	 * @Method 설명	: 공지사항 목록을 보여주기 위한 controller
	 * return type  : void
	 */
	@RequestMapping("/ntcList")
	public ModelAndView ntcList(Authentication auth) {
		
		USRDto usrDto = (USRDto) auth.getPrincipal();
		System.out.println("controller ntcList");
		
		ModelAndView mav = new ModelAndView();
		
		List<NTCDto> list = homePService.ntcList();
		System.out.println(list);
		
		JSONArray json = JSONArray.fromObject(list);
		mav.addObject("json", json);
		mav.addObject("list", list);
		
		if(usrDto.getUsrTp().equals("ROLE_STAFF")) {
			mav.setViewName("homeP/ntcListUpdate");
		}else {
			mav.setViewName("homeP/ntcList");
		}
		
		return mav;
	}
	
	@RequestMapping("/ntcUpdatePage")
	public ModelAndView ntcUpdatePage(@RequestParam("no") int no, HttpSession session) {
		
		System.out.println("controller ntcUpdatePage");
		System.out.println(no);
		
		String path = session.getServletContext().getRealPath("/") + "ntc\\ntcFile\\";
		ModelAndView mav = new ModelAndView();
		NTCDto ntcDto = homePService.ntcUpdatePage(no);
		
		mav.addObject("path", path);
		mav.addObject("ntcDto", ntcDto);
		mav.setViewName("homeP/ntcUpdatePage");
		
		return mav;
	}
	
	@RequestMapping(value="/ntcUpdate", method=RequestMethod.POST, headers = ("content-type=multipart/*"))
	public void ntcUpdate(Authentication auth, @ModelAttribute NTCDto ntcDto, HttpSession session, @RequestParam("ntcFile") MultipartFile attchFile) throws IllegalStateException, IOException {
		
		System.out.println("controller ntcUpdate");
		System.out.println(attchFile);
		if(!attchFile.isEmpty()) {
			String path = session.getServletContext().getRealPath("/") + "ntc\\ntcFile\\";
			System.out.println(path);
			File targetDir = new File(path);
			if(!targetDir.exists()) {
				targetDir.mkdirs();
			}
			System.out.println("imgFile.getOriginalFilename() : " + attchFile.getOriginalFilename()); 
			System.out.println("imgFile.getName() : " + attchFile.getName()); 
			System.out.println("imgFile.getContentType() : " + attchFile.getContentType()); 
			
			String ext[] = attchFile.getOriginalFilename().split("\\.");
			
			
//			파일명을 "강사번호.확장자"로 변경
			System.out.println("ext[0] : " + ext[0]); 		// @@@
			System.out.println("ext[1] : " + ext[1]); 		// @@@
			
			Date date = new Date();
			DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
			File file = new File(path + ext[0] + dateFormat.format(date) + "." + ext[1]);
			
			attchFile.transferTo(file);
			
			System.out.println("file.getName() : " + file.getName()); 
			System.out.println("file.getAbsoluteFile() : " + file.getAbsoluteFile()); 
			
			ntcDto.setAttchFile(file.getName());
			System.out.println("■path:::" + path);

		}		
		
		int result = homePService.ntcUpdate(ntcDto);
		
	}
} // end of class
