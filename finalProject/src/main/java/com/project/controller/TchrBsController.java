package com.project.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.dto.EXAMTPDto;
import com.project.dto.SBJTDto;
import com.project.dto.SCRDto;
import com.project.dto.TCHRDto;
import com.project.dto.TPCDto;
import com.project.dto.TTLQZDto;
import com.project.dto.USRDto;
import com.project.service.TchrBsService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/tchrBs")
public class TchrBsController {

	@Autowired
	private TchrBsService tchrBsService;
	
	/**
	 * @Method Name : qzView
	 * @작성일	    : 2017. 11. 14. 
	 * @작성자	    : 오주석
	 * @Method 설명	: 문제를 생성 하기위한 페이지로 이동하는 함수
	 * return type  : ModelAndView
	 * @return
	 */
	@RequestMapping("/qzView")
	@PreAuthorize("hasRole('ROLE_TCHR')")
	public ModelAndView qzView() {
		
		System.out.println("controller qzView");
		
		ModelAndView mav= new ModelAndView();
		Map<List<TPCDto>, List<TCHRDto>> map = null;
		try {
			map = tchrBsService.qzView();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Set<List<TPCDto>> key = map.keySet();
		List<TPCDto> listTpc = null;
		List<TCHRDto> listTchr = null;
		for (List<TPCDto> list : key) {
			listTpc = list;
			listTchr = map.get(list);
		}
		JSONArray json = JSONArray.fromObject(listTpc);
		JSONArray jsonTchr = JSONArray.fromObject(listTchr);
		System.out.println(listTpc.size());
		mav.addObject("listTpc", listTpc);
		mav.addObject("json", json);
		mav.addObject("listTchr", listTchr);
		mav.addObject("jsonTchr", jsonTchr);
		mav.setViewName("tchrBs/ttlqzView");
		
		return mav;
		
	}
	
	/**
	 * @Method Name : ttlqzInsert
	 * @작성일	    : 2017. 11. 15. 
	 * @작성자	    : 오주석
	 * @Method 설명	: 문제를 생성해 주기 위한 함수
	 * return type  : ModelAndView
	 * @param ttlqzDto
	 * @return
	 */
	@RequestMapping("/ttlqzInsert")
	@PreAuthorize("hasRole('ROLE_TCHR')")
	public String ttlqzInsert(TTLQZDto ttlqzDto, HttpSession session) {
		
		
		System.out.println("controller ttlqzInsert");
		ModelAndView mav = new ModelAndView();
		
		System.out.println(ttlqzDto);
		
		try {
			tchrBsService.ttlqzInsert(ttlqzDto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "tchrBs/ttlqzView";
	}
	
	/**
	 * @Method Name : attnd
	 * @작성일	    : 2017. 11. 14. 
	 * @작성자	    : 오주석
	 * @Method 설명	: 강사가 자기반 학생 출석을 확인하는 페이지로 이동하는 함수
	 * return type  : ModelAndView
	 * @return
	 */
	@RequestMapping("/attnd")
//	@PreAuthorize("hasRole('ROLE_TCHR')")
	public ModelAndView attnd(Authentication auth) {
		
		USRDto usrDto = (USRDto) auth.getPrincipal();
		System.out.println("controller attnd");
		ModelAndView mav = new ModelAndView();

		List<Map<String, String>> list = null;
		
		try {
			list = tchrBsService.attnd(usrDto.getId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JSONArray json = JSONArray.fromObject(list);
		
		
		mav.addObject("list", list);
		mav.addObject("json", json);
		mav.setViewName("tchrBs/attnd");
		
		return mav;
	}
	
	/**
	 * @Method Name : attndClss
	 * @작성일	    : 2017. 11. 15. 
	 * @작성자	    : 
	 * @Method 설명	:
	 * return type  : List<Map<String,String>>
	 * @param clssId
	 * @return
	 */
	@RequestMapping("/attndClss")
//	@PreAuthorize("hasRole('ROLE_TCHR')")
	public @ResponseBody List<Map<String, String>> attndClss(@RequestParam("clssId") String clssId) {
		
		System.out.println("controller attndClss");
		ModelAndView mav = new ModelAndView();
		
		System.out.println(clssId);
		
		List<Map<String, String>> list = null;
		try {
			list = tchrBsService.attndClss(clssId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	/**
	 * @Method Name : srcIn
	 * @작성일	    : 2017. 11. 15. 
	 * @작성자	    : 오주석
	 * @Method 설명	: 
	 * return type  : ModelAndView
	 * @return
	 */
	@RequestMapping("/srcIn")
	@PreAuthorize("hasRole('ROLE_TCHR')")
	public ModelAndView srcIn() {
	
		System.out.println("controller srcIn");
		
		ModelAndView mav = new ModelAndView();
		
		Map<String, List<Map<String, String>>> map = null;
		try {
			map = tchrBsService.srcIn();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<Map<String, String>> examTp = map.get("examTp");
		List<Map<String, String>> sbjt = map.get("sbjt"); 
		List<Map<String, String>> stdt = map.get("stdt");
		
		JSONArray jsonExamTp = JSONArray.fromObject(examTp);
		JSONArray jsonSbjt = JSONArray.fromObject(sbjt);
		JSONArray jsonStdt = JSONArray.fromObject(stdt);
		mav.addObject("examTp", jsonExamTp);
		mav.addObject("sbjt", jsonSbjt);
		mav.addObject("stdt", jsonStdt);
		mav.setViewName("tchrBs/srcIn");
		
		return mav;
		
	}
	
	/**
	 * @Method Name : srcInsert
	 * @작성일	    : 2017. 11. 15. 
	 * @작성자	    : 오주석
	 * @Method 설명	:
	 * return type  : String
	 * @param scrDto
	 */
	@RequestMapping("/srcInsert")
	@PreAuthorize("hasRole('ROLE_TCHR')")
	public String srcInsert(SCRDto scrDto) {
		
		System.out.println("controller srcInsert");
		System.out.println(scrDto);
		
		try {
			tchrBsService.srcInsert(scrDto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return "forward:/tchrBs/srcIn";
	}
	
	/**
	 * @Method Name : stSearch
	 * @작성일	    : 2017. 11. 16. 
	 * @작성자	    : 
	 * @Method 설명	:
	 * return type  : ModelAndView
	 * @return
	 */
	@RequestMapping("/stSearch")
	@PreAuthorize("hasRole('ROLE_TCHR')")
	public ModelAndView stSearch(Authentication auth) {
		
		USRDto usrDto = (USRDto) auth.getPrincipal();
		
		ModelAndView mav= new ModelAndView();
		
		System.out.println("controller stSearch");
		List<String> list = null;
		try {
			list = tchrBsService.stSearch(usrDto.getId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		JSONArray json = JSONArray.fromObject(list);
		
		mav.addObject("list", list);
		mav.addObject("json", json);
		mav.setViewName("tchrBs/stSearch");
		
		return mav;
		
	}
	
	/**
	 * @Method Name : stClssSearch
	 * @작성일	    : 2017. 11. 16. 
	 * @작성자	    : 
	 * @Method 설명	:
	 * return type  : void
	 * @param clssId
	 */
	@RequestMapping("/stClssSearch")
	@PreAuthorize("hasRole('ROLE_TCHR')")
	public @ResponseBody List<Map<String, Object>> stClssSearch(@RequestParam("clssId") String clssId) {
		
		System.out.println("controller stClssSearch");
		List<Map<String, Object>> list = null;
		try {
			list = tchrBsService.stClssSearch(clssId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(list);
		
		return list;
	}
	
	/**
	 * @Method Name : qzSelectView
	 * @작성일	    : 2017. 11. 17. 
	 * @작성자	    : 
	 * @Method 설명	:
	 * return type  : ModelAndView
	 * @return
	 */
	@RequestMapping("/qzSelectView")
	@PreAuthorize("hasRole('ROLE_TCHR')")
	public ModelAndView qzSelectView() {
		
		ModelAndView mav = new ModelAndView();
		System.out.println("controller qzSelectView");
		Map<List<SBJTDto>, List<Map<String, String>>> map = null;
		try {
			map = tchrBsService.qzSelectView();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Set<List<SBJTDto>> key = map.keySet();
		List<SBJTDto> listTchr = null;
		List<Map<String, String>> listExam = null;
		for (List<SBJTDto> list : key) {
			listTchr = list;
			listExam = map.get(list);
		}
		System.out.println(listExam);
		JSONArray jsonTchr = JSONArray.fromObject(listTchr);
		JSONArray jsonExam = JSONArray.fromObject(listExam);
		mav.addObject("jsonTchr", jsonTchr);
		mav.addObject("jsonExam", jsonExam);
		mav.setViewName("tchrBs/qzSelectView");
		
		return mav;
		
	}
	
	/**
	 * @Method Name : qzSelect
	 * @작성일	    : 2017. 11. 18. 
	 * @작성자	    : 
	 * @Method 설명	:
	 * return type  : List<Map<String,String>>
	 * @param sbjtNm
	 * @return
	 */
	@RequestMapping("/qzSelect")
	@PreAuthorize("hasRole('ROLE_TCHR')")
	public @ResponseBody List<Map<String, Object>> qzSelect(@RequestParam String sbjtNm) {
		
		System.out.println("controller qzSelect");
		System.out.println(sbjtNm);
		List<Map<String, Object>> list = null;
		try {
			list = tchrBsService.qzSelect(sbjtNm);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		System.out.println(list);
		
		return list;
	}
	
	/**
	 * @Method Name : qzUpdateView
	 * @작성일	    : 2017. 11. 18. 
	 * @작성자	    : 
	 * @Method 설명	:
	 * return type  : ModelAndView
	 * @return
	 */
	@RequestMapping("/qzUpdateView")
	@PreAuthorize("hasRole('ROLE_TCHR')")
	public ModelAndView qzUpdateView() {
		System.out.println("controller qzUpdateView");
		
		ModelAndView mav = new ModelAndView();
		List<TTLQZDto> list = null;
		try {
			list = tchrBsService.qzUpdateView();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mav.addObject("list", list);
		mav.setViewName("tchrBs/qzUpdateView");
		
		return mav;
		
	}
	
	/**
	 * @Method Name : qzUpdateSearch
	 * @작성일	    : 2017. 11. 18. 
	 * @작성자	    : 
	 * @Method 설명	:
	 * return type  : ModelAndView
	 * @param id
	 * @return
	 */
	@RequestMapping("qzUpdateSearch")
	public ModelAndView qzUpdateSearch(@RequestParam int id) {
		System.out.println(id);
		ModelAndView mav = new ModelAndView();
		TTLQZDto ttlqzDto = null;
		try {
			ttlqzDto = tchrBsService.qzUpdateSearch(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mav.addObject("ttlqzDto", ttlqzDto);
		mav.setViewName("tchrBs/qzUpdateSearch");
		
		return mav;
	}
	
	/**
	 * @Method Name : qzInsert
	 * @작성일	    : 2017. 11. 21. 
	 * @작성자	    : 오주석
	 * @Method 설명	:
	 * return type  : void
	 * @param id
	 * @param examId
	 */
	@RequestMapping("/qzInsert")
	public void qzInsert(@RequestParam(value="id", required=true) List<Integer> id, EXAMTPDto examtpDto) {
		
		System.out.println("controller qzInsert");
		System.out.println(examtpDto);
		System.out.println(id);
		System.out.println(id.size());
		try {
			tchrBsService.qzInsert(examtpDto, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
