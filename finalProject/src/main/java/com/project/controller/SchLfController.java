package com.project.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.dto.CRSDto;
import com.project.dto.ClssInfoDto;
import com.project.dto.DateDto;
import com.project.service.SchLfService;

import net.sf.json.JSONArray;

@Controller
public class SchLfController {

	@Autowired
	private SchLfService schLfService;
	
	/**
	 * @Method Name : selectByCrs
	 * @작성일	    : 2017. 11. 14. 
	 * @작성자	    : 김동근
	 * @Method 설명	: 수강신청 페이지 과목명 출력, 전체과정 출력
	 * return type  : String
	 * @param model
	 * @return
	 */
	@RequestMapping("viewRegist")
	public String selectByCrs(Model model){
		model.addAttribute("sbjt", schLfService.selectBySbjt());
		model.addAttribute("crs", schLfService.selectByCrs());
		return "schLf/registClssView";
	}
	
	/**
	 * @Method Name : selectCrsPerSbjt
	 * @작성일	    : 2017. 11. 14. 
	 * @작성자	    : 김동근
	 * @Method 설명	: 과목에 해당하는 과정 출력
	 * return type  : List<CRSDto>
	 * @param sbjtNm
	 * @return
	 */
	@RequestMapping("selectCrsPerSbjt")
	public @ResponseBody List<CRSDto> selectCrsPerSbjt(@RequestParam("sbjtNm") String sbjtNm){
		if(sbjtNm.equals("과목선택")){
			return schLfService.selectByCrs();
		}
		return schLfService.selectCrsPerSbjt(sbjtNm);
	}
	
	/**
	 * @Method Name : selectClssPerCrs
	 * @작성일	    : 2017. 11. 15. 
	 * @작성자	    : 김동근
	 * @Method 설명	: 과정에 해당하는 강좌 출력
	 * return type  : List<ClssInfoDto>
	 * @param crsId
	 * @return
	 */
	@RequestMapping("selectClssPerCrs")
	public @ResponseBody List<ClssInfoDto> selectClssPerCrs(@RequestParam("crsId") String crsId){
		return schLfService.selectClssPerCrs(crsId);
	}
	
	/**
	 * @Method Name : applyClss
	 * @작성일	    : 2017. 11. 16. 
	 * @작성자	    : 김동근
	 * @Method 설명	: 수강신청
	 * return type  : String
	 * @param clssList
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("applyClss")
	public String applyClss(@RequestBody List<String> clssList, Model model) throws Exception{
		int fee = 0;
		List<ClssInfoDto> list = new ArrayList<>();
		JSONParser parser = new JSONParser();
		JSONObject jo = null;
		for (int i = 0; i < clssList.size(); i++) {
			jo = (JSONObject) parser.parse(clssList.get(i));
			list.add(new ClssInfoDto(jo.get("nm").toString(), jo.get("clssNm").toString()
					, jo.get("strtDt").toString(),	jo.get("endDt").toString(), jo.get("stdtclssttn").toString()));
			fee += Integer.parseInt(jo.get("stdtclssttn").toString());
		}
		model.addAttribute("list", list);
		model.addAttribute("fee", fee);
		return "schLf/registListView";
	}
	
	/**
	 * @Method Name : selectMyClss
	 * @작성일	    : 2017. 11. 19. 
	 * @작성자	    : 김동근
	 * @Method 설명	: 나의 수강과정 목록 조회
	 * return type  : List<ClssInfoDto>
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("myClssList")
	public String selectMyClss(HttpSession session, Model model){
		System.out.println(schLfService.selectMyClss(session.getAttribute("id").toString()));
		model.addAttribute("list", schLfService.selectMyClss(session.getAttribute("id").toString()));
		return "schLf/myClssView";
	}
	
	@RequestMapping("myScr")
	public String selectMyScr(){
		return null;
	}
	
	@RequestMapping("myAttnd")
	public ModelAndView selectMyAttnd(HttpSession session, Model model){
		System.out.println(session.getAttribute("id").toString());
		SimpleDateFormat formatter1 = new SimpleDateFormat ("yyyyMM");
		SimpleDateFormat formatter2 = new SimpleDateFormat ("MM");
		Date currentTime = new Date ();
		String date = formatter1.format(currentTime);
		String month = formatter2.format(currentTime);
		String statDt = date + "01";
		String endDt = "";
		System.out.println(date);
		System.out.println(month);
		
		if(month.equals("1")){
			endDt = date + "31";
		} else if(month.equals("2")){
			endDt = date + "29";
		} else if(month.equals("3")){
			endDt = date + "31";
		} else if(month.equals("4")){
			endDt = date + "30";
		} else if(month.equals("5")){
			endDt = date + "31";
		} else if(month.equals("6")){
			endDt = date + "30";
		} else if(month.equals("7")){
			endDt = date + "31";
		} else if(month.equals("8")){
			endDt = date + "31";
		} else if(month.equals("9")){
			endDt = date + "30";
		} else if(month.equals("10")){
			endDt = date + "31";
		} else if(month.equals("11")){
			endDt = date + "30";
		} else if(month.equals("12")){
			endDt = date + "31";
		} else {
			System.out.println("Error");
		}
		
		DateDto dto = new DateDto(session.getAttribute("id").toString(), statDt, endDt);
		ModelAndView mav = new ModelAndView();
		List<Map<String, String>> list = schLfService.selectMyAttnd(dto);
		JSONArray json = JSONArray.fromObject(list);
		mav.addObject("list", list);
		mav.addObject("json", json);
		mav.setViewName("schLf/myAttndView");
		return mav;
	}
}
