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
		
		ModelAndView mav= new ModelAndView();
		Map<List<TPCDto>, List<TCHRDto>> map = null;
		try {
			map = tchrBsService.qzView();
			
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
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mav.setViewName("redirect:/error.jsp");
			return mav;
		}
		
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
	public ModelAndView ttlqzInsert(TTLQZDto ttlqzDto, HttpSession session) {
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tchrBs/ttlqzView");
		
		try {
			tchrBsService.ttlqzInsert(ttlqzDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			mav.setViewName("redirect:/error.jsp");
			return mav;
		}
		
		return mav;
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
		ModelAndView mav = new ModelAndView();

		List<Map<String, String>> list = null;
		
		try {
			list = tchrBsService.attnd(usrDto.getId());
			JSONArray json = JSONArray.fromObject(list);
			
			mav.addObject("list", list);
			mav.addObject("json", json);
			mav.setViewName("tchrBs/attnd");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			mav.setViewName("redirect:/error.jsp");
			return mav;
		}
		
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
		
		ModelAndView mav = new ModelAndView();
		
		List<Map<String, String>> list = null;
		try {
			list = tchrBsService.attndClss(clssId);
		} catch (Exception e) {
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
	
		ModelAndView mav = new ModelAndView();
		
		Map<String, List<Map<String, String>>> map = null;
		try {
			map = tchrBsService.srcIn();
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
		} catch (Exception e) {
			// TODO Auto-generated catch block
			mav.setViewName("redirect:/error.jsp");
			return mav;
		}
		
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
		
		try {
			tchrBsService.srcInsert(scrDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return "redirect:/error.jsp";
			
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
		
		List<String> list = null;
		try {
			list = tchrBsService.stSearch(usrDto.getId());
			
			JSONArray json = JSONArray.fromObject(list);
			
			mav.addObject("list", list);
			mav.addObject("json", json);
			mav.setViewName("tchrBs/stSearch");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			mav.setViewName("redirect:/error.jsp");
			return mav;
		}

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
		
		List<Map<String, Object>> list = null;
		try {
			list = tchrBsService.stClssSearch(clssId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
		}
		
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
		Map<List<SBJTDto>, List<Map<String, String>>> map = null;
		try {
			map = tchrBsService.qzSelectView();
			
			Set<List<SBJTDto>> key = map.keySet();
			List<SBJTDto> listTchr = null;
			List<Map<String, String>> listExam = null;
			for (List<SBJTDto> list : key) {
				listTchr = list;
				listExam = map.get(list);
			}
			JSONArray jsonTchr = JSONArray.fromObject(listTchr);
			JSONArray jsonExam = JSONArray.fromObject(listExam);
			mav.addObject("jsonTchr", jsonTchr);
			mav.addObject("jsonExam", jsonExam);
			mav.setViewName("tchrBs/qzSelectView");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			mav.setViewName("redirect:/error.jsp");
			return mav;
		}

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
		
		List<Map<String, Object>> list = null;
		try {
			list = tchrBsService.qzSelect(sbjtNm);
		} catch (Exception e) {
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
		
		ModelAndView mav = new ModelAndView();
		List<TTLQZDto> list = null;
		try {
			list = tchrBsService.qzUpdateView();
			
			mav.addObject("list", list);
			mav.setViewName("tchrBs/qzUpdateView");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			mav.setViewName("redirect:/error.jsp");
			return mav;
		}

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
		ModelAndView mav = new ModelAndView();
		TTLQZDto ttlqzDto = null;
		try {
			ttlqzDto = tchrBsService.qzUpdateSearch(id);
			mav.addObject("ttlqzDto", ttlqzDto);
			mav.setViewName("tchrBs/qzUpdateSearch");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			mav.setViewName("redirect:/error.jsp");
			return mav;
		}
		
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
		
		try {
			tchrBsService.qzInsert(examtpDto, id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
