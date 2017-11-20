package com.project.controller;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
	 * @Method 설명	:
	 * return type  : ModelAndView
	 * @return
	 */
	@RequestMapping("/qzView")
	public ModelAndView qzView() {
		
		System.out.println("controller qzInsert");
		
		ModelAndView mav= new ModelAndView();
		Map<List<TPCDto>, List<TCHRDto>> map = tchrBsService.qzView();
		Set<List<TPCDto>> key = map.keySet();
		List<TPCDto> listTpc = null;
		List<TCHRDto> listTchr = null;
		for (List<TPCDto> list : key) {
			listTpc = list;
			listTchr = map.get(list);
		}
		JSONArray json = JSONArray.fromObject(listTpc);
		System.out.println(listTpc.size());
		mav.addObject("listTpc", listTpc);
		mav.addObject("json", json);
		mav.addObject("listTchr", listTchr);
		mav.setViewName("tchrBs/qzView");
		
		return mav;
		
	}
	
	/**
	 * @Method Name : ttlqzInsert
	 * @작성일	    : 2017. 11. 15. 
	 * @작성자	    : 
	 * @Method 설명	:
	 * return type  : ModelAndView
	 * @param ttlqzDto
	 * @return
	 */
	@RequestMapping("/ttlqzInsert")
	public String ttlqzInsert(TTLQZDto ttlqzDto, HttpSession session) {
		
		
		System.out.println("controller ttlqzInsert");
		ModelAndView mav = new ModelAndView();
		
		System.out.println(ttlqzDto);
		
		tchrBsService.ttlqzInsert(ttlqzDto);
		
		return "tchrBs/ttlqzView";
	}
	
	/**
	 * @Method Name : attnd
	 * @작성일	    : 2017. 11. 14. 
	 * @작성자	    : 
	 * @Method 설명	:
	 * return type  : ModelAndView
	 * @return
	 */
	@RequestMapping("/attnd")
	public ModelAndView attnd() {
		
		System.out.println("controller attnd");
		ModelAndView mav = new ModelAndView();
		
		List<Map<String, String>> list = tchrBsService.attnd("t1");
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
	public @ResponseBody List<Map<String, String>> attndClss(@RequestParam("clssId") String clssId) {
		
		System.out.println("controller attndClss");
		ModelAndView mav = new ModelAndView();
		
		System.out.println(clssId);
		
		List<Map<String, String>> list = tchrBsService.attndClss(clssId);
		
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
	public ModelAndView srcIn() {
	
		System.out.println("controller srcIn");
		
		ModelAndView mav = new ModelAndView();
		
		Map<String, List<Map<String, String>>> map = tchrBsService.srcIn();
		
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
	 * return type  : void
	 * @param scrDto
	 */
	@RequestMapping("/srcInsert")
	public void srcInsert(SCRDto scrDto) {
		
		System.out.println("controller srcInsert");
		System.out.println(scrDto);
		
		tchrBsService.srcInsert(scrDto);
		
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
	public ModelAndView stSearch() {
		
		ModelAndView mav= new ModelAndView();
		
		System.out.println("controller stSearch");
		List<String> list = tchrBsService.stSearch("t1");
		
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
	public @ResponseBody List<Map<String, Object>> stClssSearch(@RequestParam("clssId") String clssId) {
		
		System.out.println("controller stClssSearch");
		List<Map<String, Object>> list = tchrBsService.stClssSearch(clssId);
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
	public ModelAndView qzSelectView() {
		
		ModelAndView mav = new ModelAndView();
		System.out.println("controller qzSelectView");
		Map<List<SBJTDto>, List<EXAMTPDto>> map = tchrBsService.qzSelectView();
		
		Set<List<SBJTDto>> key = map.keySet();
		List<SBJTDto> listTchr = null;
		List<EXAMTPDto> listExam = null;
		for (List<SBJTDto> list : key) {
			listTchr = list;
			listExam = map.get(list);
		}
		
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
	public @ResponseBody List<Map<String, Object>> qzSelect(@RequestParam String sbjtNm) {
		
		System.out.println("controller qzSelect");
		List<Map<String, Object>> list = tchrBsService.qzSelect(sbjtNm);
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
	public ModelAndView qzUpdateView() {
		System.out.println("controller qzUpdateView");
		
		ModelAndView mav = new ModelAndView();
		List<TTLQZDto> list = tchrBsService.qzUpdateView();
		
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
		TTLQZDto ttlqzDto = tchrBsService.qzUpdateSearch(id);
		mav.addObject("ttlqzDto", ttlqzDto);
		mav.setViewName("tchrBs/qzUpdateSearch");
		
		return mav;
	}
	
	@RequestMapping("/qzInsert")
	public void qzInsert(@RequestParam(value="id", required=true) List<Integer> id, @RequestParam("examId") String examId) {
		
		System.out.println("controller qzInsert");
		System.out.println(examId);
		System.out.println(id);
		System.out.println(id.size());
		tchrBsService.qzInsert(examId, id);
		
	}
	
}
